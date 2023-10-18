#!/usr/bin/make

SHELL = /bin/sh

include .env

CURRENT_UID := $(shell id -u)
CURRENT_GID := $(shell id -g)
ARCH := $(shell env arch)

export CURRENT_UID
export CURRENT_GID
export ARCH


dc-first-install-app: dc-pull dc-add-host dc-up dc-init

dc-certbot-install:
	docker compose -f docker-compose.certbot.yml up nginx -d
	docker compose -f docker-compose.certbot.yml up certbot
	docker compose -f docker-compose.certbot.yml down

dc-up:
	docker compose up --scale dns-consumer=3 -d

dc-create-first-user:
	docker compose exec workspace php artisan ipm:create-user

dc-shell:
	docker compose up workspace -d
	docker compose exec workspace bash

dc-composer-install:
	docker compose up workspace -d
	docker compose exec workspace composer install

dc-storage-link:
	docker compose up workspace -d
	docker compose exec workspace php artisan storage:link --force

dc-yarn-install:
	docker compose run --rm node yarn install --cache-folder ./node_modules/.yarn-cache

dc-init:
	docker compose up workspace -d
	docker compose exec workspace php artisan key:generate
	docker compose exec workspace php artisan migrate --force

dc-migrate:
	docker compose exec workspace php artisan migrate --force

dc-add-host:
	echo "127.0.0.1    $(APP_DOMAIN)" | sudo tee -a /etc/hosts

dc-down:
	docker compose down
dc-kill:
	docker compose --profile=testing down

dc-pull:
	docker compose pull php-fpm nginx workspace

dc-bash:
	docker compose exec workspace bash
dc-ps:
	docker compose ps

