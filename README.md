# Inventory Tracker

### About

Product Tracker is an application that allows a user to view products and their quantities. Users have the ability to increase and decrease the quantity of the products and will receive an email when the product is sold out.


1. Start the server- `rails s`
2. [👀 Visit the app on Localhost:3000](http://localhost:3000/)

100% test coverage!

## Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`
4. Run migrations: ` rails db:migrate`
5. Seed the database: `rails db:seed`

### Database Design
![Product Tracker Schema](https://user-images.githubusercontent.com/77904287/142489077-b210b85a-cc73-4ad5-a321-f007a7a3a536.png)

## Important Gems
Testing
* [rspec-rails](https://github.com/rspec/rspec-rails)
* [capybara](https://github.com/teamcapybara/capybara)
* [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
* [simplecov](https://github.com/simplecov-ruby/simplecov)

## Testing
* RSpec and Capybara were used for unit and integration testing and project development adhered to TDD principles.
* Simplecov was used to track total test coverage.
* To run our test suite, RSpec, enter `$ bundle exec rspec` in the terminal.
* To see a coverage report enter `$ open coverage/index.html`
* SimpleCov test coverage is at 100.00%:



## Versions

- Ruby 2.7.2

- Rails 5.2.5

## Authors

- Emmy Morris - [emmymorris](https://github.com/EmmyMorris)
