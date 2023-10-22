createdb:
	createdb simple_bank

dropdb:
	dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: createdb dropdb migrateup migratedown sqlc
