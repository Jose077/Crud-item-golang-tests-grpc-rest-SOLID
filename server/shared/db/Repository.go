package db

import (
	Iitem_repository "crudItem/modules/item/domain/repository"

	"crudItem/shared/config"

	"go.uber.org/zap"
)

type IRepositories struct {
	Item Iitem_repository.IItemRepository
	rest any
}

func NewRepository(params config.ConfigParamsDb, log *zap.Logger) (*IRepositories, error) {
	return NewGormRepository(params.AuthGormPostgresParams, log)
}
