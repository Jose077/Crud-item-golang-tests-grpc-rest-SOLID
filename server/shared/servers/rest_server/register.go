package rest_server

import (
	"crudItem/shared/db"

	handle_rest_item "crudItem/modules/item/interface/external-server/rest"

	"github.com/go-chi/chi/v5"
)

// Registra as rotas da aplicação
func RegisterRoutes(r *chi.Mux, handle *db.IRepositories) {

	// Instancias dos handlers das rotas
	items := handle_rest_item.NewItemHandler(handle.Item)

	//Items
	r.Get("/items", items.GetItems)
	r.Post("/items", items.PostItems)

}