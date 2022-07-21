package usecases

import (
	"crudItem/modules/item/domain/entity"
	"crudItem/modules/item/domain/repository"
	test_item "crudItem/modules/item/e2e"
	postItem "crudItem/modules/item/usecases/postItem"
	"fmt"
	"log"

	"testing"

	"github.com/google/uuid"
	"github.com/stretchr/testify/assert"
)

func TestDeleteItemPositive(t *testing.T) {

	mac, err := test_item.GenerateMac()
	if err != nil {
		t.Error("erro ao gerar mac: ", err)
	}

	repo := repository.NewItemRepositoryFake()

	// Criar item
	ItemMock := entity.Item{
		Descricao: "item descricao",
		Sn:        "32132131231",
		Mac:       mac,
		Imei:      "eqe23e32e32e32",
	}

	postitemUseCase := postItem.NewPostItemUseCase(repo)
	item, err := postitemUseCase.PostItems(ItemMock)
	if err != nil {
		t.Error("Failed to create item: ", err)
	}

	deleteItemUseCase := NewDeleteItemUseCase(repo)

	result, err := deleteItemUseCase.DeleteItems(fmt.Sprint(item.ID))
	if err != nil {
		t.Error("Failed to delete item: ", err)
	}

	assert.Equal(t, result, true)

}

func TestDeleteItemNegative(t *testing.T) {

	repo := repository.NewItemRepositoryFake()

	id := uuid.New().String()
	deleteItemUseCase := NewDeleteItemUseCase(repo)

	log.Println("id: ", id)

	result, err := deleteItemUseCase.DeleteItems(id)
	if err != nil {
		t.Error("Failed to delete item: ", err)
	}

	assert.Equal(t, result, false)

}
