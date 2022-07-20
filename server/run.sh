#!/bin/sh

# export DB_HOST=
# export DB_NAME=
# export DB_PASSWORD=
# export DB_PORT=
# export DB_USER=

rm -rv ./*.bin; go build -v -o application.bin
./application.bin