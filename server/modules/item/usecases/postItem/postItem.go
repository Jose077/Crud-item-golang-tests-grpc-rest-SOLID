package usecases

import (
	"crudItem/modules/item/domain/entity"
	"crudItem/modules/item/domain/repository"

	"github.com/google/uuid"
)

type PostItemUseCase struct {
	repository repository.IItemRepository
}

func NewPostItemUseCase(repo repository.IItemRepository) *PostItemUseCase {
	return &PostItemUseCase{
		repository: repo,
	}
}

// var _ repository.IItemRepository = &PostItemUseCase{}
func (it *PostItemUseCase) PostItems(item entity.Item) (*entity.Items, error) {

	item.ID = uuid.Must(uuid.NewRandom())

	return it.repository.PostItems(item)

}