Coding Challenge
====

This repository contains the source code for a small metrics app which provides a simple UI for viewing statistics on millions of records from our agent.

It's only a simple beginning, though, so we'd like for you to add a few features to it! Below is a list of features we'd like to add. Please pick at least 2-3 tasks and give yourself no more than 5 hours to complete them.

- **Bugfix**: The first time "Load More" is clicked, it shows the same list of machines (DONE)

<!--  Added a set before action in metrics controller to set the page info, the method checks to see if the page is nil it sets the page to 2 or if not empty it sets the next page based on the page its on. The metrics controller already starts the page at 1 if it equals 0 --> 

- **Bugfix**: Currently if the same machine reports new values, it will create new Metric records. Change POST /metrics to update an existing Metric value if there already exists a record with the same machine_id and category. (DONE)

<!-- ** I had to create two tests for this to work, I need to put both of those together within the api test-->


- **Improvement**: Currently the POST /metrics endpoint is unsecured. Add some sort of authentication, could be a shared static api_key parameter. (Needs Review)

 <!-- 
 # Implemented Devise, user can sign up, sign in and log out. Authenticity token is created during signin and is destroyed at sign out. Created a user table to store user sign in data.  -->


- **Improvement**: Add the rack-attack gem to throttle POST /metrics to 1 request per minute per IP address. (DONE)

<!-- Rack attack installed, initializer created and configuration to throttle based on specs above complete. Ran a test on postman and appears to be working ---> 

- **Feature**: Allow the metrics machine to have a friendly name rather than just a uuid. (IN PROGRESS)

* Created generated machine controller with show action and search 
* Need to create a machine table that has a one to many relationship with metrics
* Need to give html url a name that displays the machine name or id
* need to connect the page to the search function and create link from the metrics List 


- **Feature**: Add a new page with a view based on a single machine_id. List all of the metric categories for that machine and their values in a table. Update the main list to make the machine_ids clickable to go here. (IN PROGRESS)

- **Feature**: Add a Search box to the header. This should be able to search full or partial machine_ids and list the results on a new page. (IN PROGRESS)




Feel free to add any gems you'd like (e.g. RackAttack, React-rails, etc.) and add models (e.g. Machine).




Database setup
-----
```
sudo -u postgres psql
psql -U USERNAME postgres /* if above does not work use this to sign in */
postgres=# create database statapp_development;
postgres=# create user statapp with encrypted password 'statapp';
postgres=# grant all privileges on database statapp_development to statapp;
```
```
bundle exec rails db:migrate
bundle exec rake db:seed
```
