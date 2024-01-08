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

## Credentials
- `EDITOR="code --wait" rails credentials:edit` 
- `Rails.application.credentials.<key>

## Add form
- `form_tag <url>, options ... `

## Style
- Tab is 2 spaces

## Debug
- Empty rendering: add the = character, check for <%= 

