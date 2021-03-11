# Jungle

Jungle is a mini e-commerce application built with Rails 4.2

## Screenshots

!["Screenshot of home page"](https://github.com/KPCE/jungle-rails/blob/master/public/docs/home_page.png?raw=true)
!["Screenshot of login form with validation"](https://github.com/KPCE/jungle-rails/blob/master/public/docs/login_form_validation.png?raw=true)
!["Screenshot of empty cart"](https://github.com/KPCE/jungle-rails/blob/master/public/docs/empty_cart.png?raw=true)
!["Screenshot of full cart"](https://github.com/KPCE/jungle-rails/blob/master/public/docs/full_cart.png?raw=true)
!["Screenshot of completed order"](https://github.com/KPCE/jungle-rails/blob/master/public/docs/completed_order.png?raw=true)
!["Screenshot of categories, electronics"](https://github.com/KPCE/jungle-rails/blob/master/public/docs/categories_electronics.png?raw=true)
!["Screenshot of admin products"](https://github.com/KPCE/jungle-rails/blob/master/public/docs/admin_products.png?raw=true)
!["Screenshot of admin dashboard"](https://github.com/KPCE/jungle-rails/blob/master/public/docs/admin_dashboard.png?raw=true)
!["Screenshot of admin categories"](https://github.com/KPCE/jungle-rails/blob/master/public/docs/admin_categories.png?raw=true)
!["Screenshot of about page"](https://github.com/KPCE/jungle-rails/blob/master/public/docs/about.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Do the same as step 5 with database.example.yml and secrets.example.yml
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
