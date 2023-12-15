postgres:
	docker run --name db_exercise_php -p 5434:5432 -e POSTGRES_PASSWORD=manolo221212 -e POSTGRES_USER=root -d postgres:16-alpine 

stop_db:
	docker stop db_exercise_php

create_db:
	docker exec -it db_exercise_php psql -U root -d postgres -c "CREATE DATABASE exercise_php;"

drop_db:
	docker exec -it db_exercise_php psql -U root -d postgres -c "DROP DATABASE exercise_php;"

list_db:
	docker exec -it db_exercise_php psql -U root -d postgres -c "SELECT datname FROM pg_database;"

createdb: 
	docker exec -it db_exercise_php createdb --username root --owner root simple_store

dropdb:
	docker exec --it db_exercise_php dropdb simple_store

migrateup:
	migrate -path db/migration/ -database "postgresql://root:manolo221212@localhost:5434/exercise_php?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration/ -database "postgresql://root:manolo221212@localhost:5434/exercise_php?sslmode=disable" -verbose down

.PHONY: postgres stop_db create_db drop_db createdb dropdb migrateup migratedown list_db