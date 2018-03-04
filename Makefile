run:
	@docker-compose up

kill:
	@docker-compose kill

test-rspec:
	@docker-compose run --rm web rspec

create:
	@docker-compose run --rm web rails db:create

migrate:
	@docker-compose run --rm web rails db:migrate

seed:
	@docker-compose run --rm web rails db:seed

setup:
	@docker-compose run --rm web rails db:drop db:create db:migrate db:seed

console:
	@docker-compose run --rm web bundler exec rails console
