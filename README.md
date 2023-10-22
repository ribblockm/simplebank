# bank_backend
A simple but *consistent* backend for a back, written in Go

In this application, we will create a back in which we:
- create and manage accounts
- record all balance changes
- do money transfer transactions

## 1. Design a DB model
- We generated the `bank-schema.sql` file to create a db in PostgreSQL.

## 2. Migrations
Migrations are a crucial part of a db management.
We'll use a cli and golang library, `golang-migrate`.

We run
`migrate create -ext sql -dir db/migration -seq init_schema` to create the files for `up` and `down` migrations.
In the `up` script we'll use the model defined in `bank-schema.sql`, and for the `down` script we will drop the tables (in sequential order, they are dependent).

Our first up migration becomes
`migrate -path db/migration -database "postgresql://localhost:5432/simple_bank?sslmode=disable" -verbose up`.

## 3. Makefile
We add the above commands to a Makefile.