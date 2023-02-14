# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* DB diagram
  * https://dbdiagram.io/d/63b9a1e47d39e42284e981ee
* Jira Task
  * https://lc-software.atlassian.net/jira/software/projects/TC/boards/3
* Swagger Docs
  * [WEB API documentation](http://localhost:3000/api-docs/index.html)
  * [CRM API documentation](http://localhost:3000/api-docs/index.html?urls.primaryName=CRM%20API%20V1)
* SEED
  * rake db:seed

# HOW TO STARK THIS PROJECT

 - 1. docker-compose build
 - 2. docker-compose up
 - 3. docker-compose exec app bundle exec rake db:setup db:migrate
 - 4. go to [WEB API documentation](http://localhost:3000/api-docs/index.html)
 
# Autentication
 - 1. Login with admin role => email: 'admin@teip.challenge' and password: 'P@sssword'
 - 2. Create a new user, with user role

# Popular and Top products
 - To see the list of top products, you have to create and confirm orders
 - To see the list of popular products, you have to mark products as favorited

# Notes
 - Orders must be confirmed by a user with admin role.
 - Products transactions allow you to see how products stocks are moving
 - When an order is canceled, the products will come back to the stock


