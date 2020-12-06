# README

HamLogbook

A single page web based database for radio amateurs to create/read/update/delete contacts. User needs to create an account to be able to access the database. User has to add a callsign before he can add contacts. If user obtains another callsign he/she can change it in the profile, no need to create an new account. User can edit all fields it the profile.

This application has been built using Ruby 2.6.1, which should be loaded while running <pre><code>bundle install</code></pre>

To use this application:

Go to https://github.com/johnzonneveld/hamlogbook-api
Click the 'Clone or Download' button
Copy the link
In Command Line or Git Bash, type 'git clone' then paste the URL.<br>
Run: 
<pre><code>bundle install</code></pre>
Type on the command line 
<pre><code>rails db:create</code></pre> to create the PostgreSQL database. Next type: <pre><code>rails db:migrate</code></pre> to create the database tables.

Run: <pre><code>rails s</code></pre> to start the backend, Ruby on Rails server that serves the JavaScript frontend.

With each interaction between front- and back end an authorization token is exchanged. Default expiry time for the token is set to 3600 seocnds (1 hours). Inactivity of interaction between front- and back end larger than 3600 seconds the token will be expired and the user will be forced to log in again.

Frontend is described in https://github.com/johnzonneveld/hamlogbook-js

