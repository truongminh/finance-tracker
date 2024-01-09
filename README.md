# Finance Tracker

## Command
- `rails generate controller welcome index`
- `bundle install --without production`
- `rails generate devise:install`
- `rails generate devise User`

## Generate controller
- `rails generate controller <class> <method>`

## Library
- Authentication: `bundle add devise`
- Bootstrap: 
```sh
bundle add bootstrap jquery-rails
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
# update application.js
# //= require jquery3
# //= require popper
# //= require bootstrap
# config/initializers/assets.rb
# Rails.application.config.assets.precompile += %w(bootstrap.min.js popper.js)
# for scss
bundle add sassc-rails # support scss
# ensure manifest.js
# //= link_directory ../stylesheets .css
# update application.scss to @import 'bootstrap';
```

## Add data model
- Add Stock model
`rails g model Stock ticker:string name:string price:decimal`
`rails db:migrate`
- Add model with references
`rails g resource UserStock user:references stock:references`

## Credentials
- `EDITOR="code --wait" rails credentials:edit` 
- `Rails.application.credentials.<key>

## Add form
- `form_tag <url>, options ... `
- Form method: `data: { turbo_method: :delete }`

## Enable AJAX
https://guides.rubyonrails.org/v6.1/working_with_javascript_in_rails.html
- Enable `rails-ujs`
`./bin/importmap pin @rails/ujs`

```js
// application.js
import Rails from '@rails/ujs';

Rails.start();
```
- Set form `remote: true` 

## Style
- Tab is 2 spaces

## Syntax
- String interpolation: `Stock #{stock.ticker}`
- `return true if check(stock)`
- `return false unless stock stocks.where(id: stock.id).exists?`

## Debug
- Empty rendering: add the = character, check for <%= 
- List routes: `rails routes --expanded`
