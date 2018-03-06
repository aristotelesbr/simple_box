# SimpleBox

SimpleBox is a simple system for importing data from a text file.

## Versions

Ruby:
  
  2.2.0

Rails:
  
  '5.0.0.1'

Database:

  'sqlite3'

## Installation

Assuming you already have the environment properly configured on your machine after cloning the project do:
  
  $ cd simple_box

Install dependencies:

  $ bundle install

Configuring the database:

  $ rails db:create db:migrate

Run the tests:

  $ bundle exec rspec

Start server:

  $ rails s

## Docker instalation

builder installation:

$ docker-compose build

Database setup:

$ docker-compose run --rm web 

rails db:create db:migrate

Start server:

$ docker-compose up

## License

The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


Done with :coffee: 