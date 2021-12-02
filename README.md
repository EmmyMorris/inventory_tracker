# Inventory Tracker

### About

Product Tracker is an application that allows a user to create, view, edit, and delete their products. When a user updates one of their products to have a quantity of zero an email is sent to the user!


1. Start the server- `rails s`
2. [👀 Visit the app on Localhost:3000](http://localhost:3000/)

100% test coverage!

## Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`
4. Run migrations: ` rails db:migrate`

### Database Design
<img width="814" alt="Inventory Tracker DB Design" src="https://user-images.githubusercontent.com/77904287/144309507-8adfd925-fa46-4c6d-9353-17b1520ce43a.png">

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
* SimpleCov test coverage is at 99.22%!



## Versions

- Ruby 2.7.2

- Rails 6.0.4

## Authors

- Emmy Morris - [emmymorris](https://github.com/EmmyMorris)
