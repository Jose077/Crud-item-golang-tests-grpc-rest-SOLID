package repository

import (
	"crudItem/modules/item/domain/entity"
)

type ItemRepositoryFake struct {
}

func NewItemRepositoryFake() *ItemRepositoryFake {
	return &ItemRepositoryFake{}
}

//db fake
var ItemsDb []entity.Item

// Declaração da implementação do repository
var _ IItemRepository = &ItemRepositoryFake{}

// PostItems implements IItemRepository
func (*ItemRepositoryFake) PostItems(item entity.Item) (*entity.Item, error) {
	ItemsDb = append(ItemsDb, item)

	return &item, nil
}

// GetItems implements IItemRepository
func (*ItemRepositoryFake) GetItems() (*[]entity.Item, error) {
	panic("unimplemented")
}
