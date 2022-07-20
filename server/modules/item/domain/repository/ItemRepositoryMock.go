package repository

// import (
// 	"crudItem/modules/item/domain/entity"
// 	"crudItem/modules/item/dtos"

// 	"github.com/google/uuid"
// 	"github.com/stretchr/testify/mock"
// )

// type ItemRepositoryMock struct {
// 	// add a Mock object instance
// 	mock.Mock
// }

// // Declaração da implementação do repository
// var _ IItemRepository = &ItemRepositoryMock{}

// // PostItems implements IItemRepository
// func (o *ItemRepositoryMock) PostItems(item entity.Item) (*[]entity.Item, error) {
// 	args := o.Called()
// 	return args.Get(0).(*[]entity.Item), args.Error(1)

// }

// // GetItems implements IItemRepository
// func (o *ItemRepositoryMock) GetItems() (*[]dtos.ItemLocalidadeDTO, error) {
// 	panic("unimplemented")
// }

// // GetItemsLocalidade implements IItemRepository
// func (o *ItemRepositoryMock) GetItemsLocalidade(localidade_id uuid.UUID) (*[]entity.Item, error) {
// 	panic("unimplemented")
// }
