package repository

import (
	"crudItem/modules/item/domain/entity"
)

type IItemRepository interface {
	GetItems() (*[]entity.Item, error)
	PostItems(item entity.Item) (*entity.Item, error)
}
