package usecases

import (
	"crudItem/modules/item/domain/entity"
	"crudItem/modules/item/domain/repository"
	test_item "crudItem/modules/item/e2e"

	"testing"

	"github.com/stretchr/testify/assert"
)

func TestPostItem(t *testing.T) {

	mac, err := test_item.GenerateMac()
	if err != nil {
		t.Error("erro ao gerar mac: ", err)
	}

	// repositorio com mock do testfy
	// repo := new(repository.ItemRepositoryMock)
	// repo.Mock.On("PostItems").Return(&[]entity.Item{postMock}, nil)

	repo := repository.NewItemRepositoryFake() // new(repository.ItemRepositoryFake)
	postMock := entity.Item{
		Descricao: "item descricao",
		Sn:        "32132131231",
		Mac:       mac,
		Imei:      "eqe23e32e32e32",
	}
	postItemUseCase := NewPostItemUseCase(repo)

	item, err := postItemUseCase.PostItems(postMock)
	if err != nil {
		t.Error("Failed to create item: ", err)
	}

	itemsValue := *item

	assert.NotZero(t, itemsValue[0].ID)
	assert.Equal(t, itemsValue[0].Descricao, postMock.Descricao)
	assert.Equal(t, itemsValue[0].Sn, postMock.Sn)
	assert.Equal(t, itemsValue[0].Mac, postMock.Mac)
	assert.Equal(t, itemsValue[0].Imei, postMock.Imei)

}
