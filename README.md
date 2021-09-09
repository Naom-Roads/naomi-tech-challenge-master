Coding Challenge
====

This repository contains the source code for a small metrics app which provides a simple UI for viewing statistics on millions of records from our agent.

It's only a simple beginning, though, so we'd like for you to add a few features to it! Below is a list of features we'd like to add. Please pick at least 2-3 tasks and give yourself no more than 5 hours to complete them.

- **Bugfix**: The first time "Load More" is clicked, it shows the same list of machines (NEEDS REVIEW)
- **Bugfix**: Currently if the same machine reports new values, it will create new Metric records. Change POST /metrics to update an existing Metric value if there already exists a record with the same machine_id and category.
- **Improvement**: Currently the POST /metrics endpoint is unsecured. Add some sort of authentication, could be a shared static api_key parameter.
- **Improvement**: Add the rack-attack gem to throttle POST /metrics to 1 request per minute per IP address.
- **Feature**: Allow the metrics machine to have a friendly name rather than just a uuid.
- **Feature**: Add a new page with a view based on a single machine_id. List all of the metric categories for that machine and their values in a table. Update the main list to make the machine_ids clickable to go here.
- **Feature**: Add a Search box to the header. This should be able to search full or partial machine_ids and list the results on a new page.

Feel free to add any gems you'd like (e.g. RackAttack, React-rails, etc.) and add models (e.g. Machine).

Database setup
-----
```
sudo -u postgres psql
postgres=# create database statapp_development;
postgres=# create user statapp with encrypted password 'statapp';
postgres=# grant all privileges on database statapp_development to statapp;
```
```
bundle exec rails db:migrate
bundle exec rake db:seed
```
