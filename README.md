# README

# subscribe_api #
This is a Ruby API to solve Code Challenge to [Subscribe](https://subscribeplatform.com/)

[Requirements](https://gist.github.com/safplatform/792314da6b54346594432f30d5868f36)

## Deployment
### Install
- Ruby
```sh
rvm install ruby
```
- Rails
```sh
gem install rails
```
- Cors
```sh
gem install rack-cors -v 0.4.0
```
- Clone this repo:
```sh
git clone git@github.com:joseasantacruz/subscribe_api.git
```
- bundle install
```sh
cd subscribe_api
bundle install
```
- create db
```sh
rake db:setup
```
- migrate db
```sh
rails db:migrate
``` 
- seed data
```sh
rails db:seed
``` 
### Run server
```sh
rails s
``` 