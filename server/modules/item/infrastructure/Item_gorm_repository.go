package infrastructure

import (
	"crudItem/modules/item/domain/entity"
	"crudItem/modules/item/domain/repository"

	"gorm.io/gorm"
)

type ItemRepository struct {
	db *gorm.DB
}

// construtor
func NewItemGormRepository(db *gorm.DB) *ItemRepository {
	return &ItemRepository{db}
}

// Declaração da implementação do repository
var _ repository.IItemRepository = &ItemRepository{}

// GetItem implements repository.IItemRepository
func (it *ItemRepository) GetItems() (*[]entity.Item, error) {
	var items []entity.Item

	err := it.db.Raw(`
		SELECT 
			i.id,
			i.descricao,
			i.sn,
			i.mac,
			i.imei,
			i.criado_em AS criacao_item
			-- l.nome,
			-- l.criado_em 
		FROM item i
	   -- INNER JOIN localidade l ON i.localidade_id = l.id
	`).Scan(&items).Error
	if err != nil {
		return nil, err
	}

	return &items, nil
}

// PostItem implements repository.IItemRepository
func (it *ItemRepository) PostItems(item entity.Item) (*entity.Items, error) {
	var items []entity.Item

	err := it.db.Raw("INSERT INTO item (id, descricao, sn, mac, imei) VALUES(?,?,?,?,?)", item.ID, item.Descricao, item.Sn, item.Mac, item.Imei).Scan(&items).Error

	if err != nil {
		return nil, err
	}

	return &items, nil

}
