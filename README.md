# Range Society
A Turing School group project created with Rails.

[RangeSociety](https://range-society.herokuapp.com)

Contributors:
* Bradley Niedt
* Lance Taylor
* Mary Goodhart
* Ricardo Ledesma

![RangeSociety](/.readme/mixology.jpg)

#blurb about what our app is

![RangeSociety](/.readme/cocktails.jpg)

## Learning Goals

* Understanding how to build a full Rails app from idea to delivery
* Revisiting previous concepts such as APIs and OAuth
* Finding the strengths and gaps in knowledge of Ruby, Rails, and organizing a project.
* Using an agile process as features are developed
* Configure a continuous integration server (We used `Travis CI`)

## Getting Started && Prerequisites

### Implementing OAuth

* Google OAuth requirements:
  Sign up for Google OAuth, receive a client id and secret defined within as `ENV['CLIENT_ID']` & `ENV['CLIENT_SECRET']`

###### API Keys Required:

* Yelp defined within as `ENV['YELP_API_KEY']`
* Mapbox defined within as `ENV['MAPBOX_KEY']`
* Nrel defined within as `ENV['NREL_API_KEY']`

You will need Rails v 5.2.2.
```
gem install rails -v 5.2.2
```
Clone down this repo!

```
git clone https://github.com/Bradniedt/Range_society
```

### Installing

From your terminal, navigate into the Range_society directory:

```
cd Range_society
```

Make sure your gemfile is up to date:

```
bundle
bundle update
```
Establish a database:

```
rake db:{drop,create,migrate}
```
Start your server:

```
rails s
```

Open your browser (best functionality in Chrome).

`localhost:3000`

Welcome to our dev environment!


## Testing

Your location should be the root directory of the project (`Range_society`).

From the command line run `rspec`
(This can take a moment)

`Green` is passing.
`Red` is failing.

We used `rspec`, `capybara`, `launchy`, `vcr`, `shoulda-matchers`, and `simplecov` for testing.

##### Model, Service, Facade:

![user model](/.readme/user.jpg)
![yelp service](/.readme/yelp_service.jpg)
![facade](/.readme/ev_station_facade.jpg)

##### Map, JavaScript:

![Alt text](/.readme/map.jpg)
![Alt text](/.readme/js.jpg)

##### Bootstrap Styling:

![Alt text](/.readme/styling.jpg)

##### Decorator, Cache:

![Alt text](/.readme/decorator.jpg)
![Alt text](/.readme/cache.jpg)

## Deployment

Our app is deployed on heroku at: [RangeSociety](https://range-society.herokuapp.com)

`https://range-society.herokuapp.com`

## Created with

* `Rails`
* `Ruby`
* `JavaScript`

### Gems:
* `faraday`
* `figaro`
* `omniauth-google-oauth2`
* `travis`
* `geocoder`
* `bootstrap`
* `newrelic_rmp`
* `draper`
