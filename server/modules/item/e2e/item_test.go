package external_server

import (
	entity "crudItem/modules/item/domain/entity"
	"crudItem/modules/item/dtos"
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

// negative
func (suite *Suite) TestGetItemsNegative() {

	// Create a New Request
	req, _ := http.NewRequest("GET", "/items", nil)

	// Execute Request
	response := suite.executeRequest(req, suite.server)

	assert.Equal(suite.T(), response.Body.String(), "Nenhum item encontrado!")
	assert.Equal(suite.T(), response.Code, 204)
}

// positive
func (suite *Suite) TestGetItemsPositive() {

	// Create a New Request
	req, _ := http.NewRequest("GET", "/items", nil)

	item := []dtos.ItemDTO{}

	// instancia factory de items
	factory := Item_test_factory{}

	// Criar item no db
	itemDb, errItem := factory.CreateItem(
		entity.Item{
			Descricao: "item test",
			Sn:        "323232323232",
			Imei:      "dwq2323242",
			Mac:       "ddddd",
		},
	)
	if errItem != nil {
		suite.T().Error("Failed to create item: ", errItem)
	}

	// Execute Request
	response := suite.executeRequest(req, suite.server)

	errMarshal := json.Unmarshal(response.Body.Bytes(), &item)
	if errMarshal != nil {
		suite.T().Error("Failed to unmarshal response: ", errMarshal)
	}

	// deleta item criado para teste do db
	factory.DeleteItem(fmt.Sprint(itemDb.ID))

	assert.Equal(suite.T(), response.Code, 200)
	require.Greater(suite.T(), len(item), 0)
	assert.NotZero(suite.T(), item[0].ID, "Campo de ID")
	assert.NotZero(suite.T(), item[0].Descricao, "Campo de descricao")
	assert.NotZero(suite.T(), item[0].Imei, "Campo de Imei")
	assert.NotZero(suite.T(), item[0].Sn, "Campo de Sn")
}
