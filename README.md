# block_chain_event

A simple web app designed to get a payload  https://blockchain.info/ticker, store it in a database, and then send it to geckoboard dataset api.

### Usage

#### Technology

Ruby 2.3.1,  Ruby on Rails 5, Rspec, Travis, Hound, Coveralls

Gems:
Whenever, VCR, Webmock, shoulda-matchers, httparty

#### To run the server on your local machine:

Download or clone the repo

Run `$ bundle install`

Create the database with `$ rake db:create`

And migrate `$ rake db:migrate`

Create cron jobs using whenever gem `$ whenever --update-crontab`

Run `$ rails s` to start the server

### Test

Run tests using:

`$ rspec`

### Work Done

TDD controller and model for Events which deal with Blockchain payload and saves it to my database.  Created another model for the exchange_rates to create a 1-to-many relationship with events so USD can have many exchange rates e.g. "buy" & "sell". Stubbed the http from Blockchain for my test.  Used whenever gem to create the intervals for pulling & pushing data.  

### Currently working

TDDing my geckoboard controller but having problems since want to iteriate through my exchange rates, would of been easier to only send the latest paypal but want to be able to create graphs on buy/sell for bitcoins for certain currencies over time.  

### Struggles

Currently with the geckoboard dataset api since getting weird errors.

Http stubbing took some time until I used VCR which made it a lot simpler to stub them.

Trying to create a method for the intervals with no result so I used whenever gem

### Next steps

Get my geckoboard controller working then create widgets

Create a test for my whenever schedule.rb.

Refactor my code 
