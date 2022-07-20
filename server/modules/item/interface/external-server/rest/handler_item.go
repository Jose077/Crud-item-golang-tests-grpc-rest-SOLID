package external_server

import (
	"crudItem/modules/item/domain/entity"
	"crudItem/modules/item/domain/repository"
	"crudItem/modules/item/usecases"
	postItemUsecases "crudItem/modules/item/usecases/postItem"
	"encoding/json"
	"net/http"
)

type Items struct {
	it repository.IItemRepository
}

// constructor
func NewItemHandler(it repository.IItemRepository) *Items {
	return &Items{
		it: it,
	}
}

//Consulta e Cadastro de items
func (item *Items) GetItems(w http.ResponseWriter, r *http.Request) {

	getItemUseCase := usecases.NewGetItemUseCase(item.it)

	// user := r.Context().Value("user").(string)

	// log.Println(user)

	items, err := getItemUseCase.GetItems()
	if err != nil {
		w.Write([]byte(err.Error()))
		return
	}

	if len(*items) <= 0 {
		w.WriteHeader(204)
		w.Write([]byte("Nenhum item encontrado!"))
		return
	}

	w.WriteHeader(http.StatusOK)

	json.NewEncoder(w).Encode(items)
}

// Criar items
func (item *Items) PostItems(w http.ResponseWriter, r *http.Request) {

	var itembody entity.Item

	err := json.NewDecoder(r.Body).Decode(&itembody)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	postItemUseCase := postItemUsecases.NewPostItemUseCase(item.it)

	Items, err := postItemUseCase.PostItems(itembody)

	if err != nil {
		w.Write([]byte(err.Error()))
		return
	}

	w.WriteHeader(http.StatusCreated)

	json.NewEncoder(w).Encode(Items)
}
