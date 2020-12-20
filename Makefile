.PHONY: start stop
.DEFAULT_GOAL := start

start:
	yarn install
	docker-compose down
	mkcert localhost.justingardner.com localhost 127.0.0.1 ::1
	open https://localhost.justingardner.com
	docker-compose up --build

stop:
	docker-compose down --volumes
