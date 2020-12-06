# README

<h1>HamLogbook</h1>
<h2>Overview</h2>

<p>A single page web based database for radio amateurs to create/read/update/delete contacts. User needs to create an account to be able to access the database. User has to add a callsign before he can add contacts. If user obtains another callsign he/she can change it in the profile, no need to create an new account. User can edit all fields it the profile.</p>

<p>This application has been built using Ruby 2.6.1, which should be loaded while running:</p> 
<pre><code>bundle install</code></pre>
<h2>Installation</h2>
<p>To use this application:

Go to https://github.com/johnzonneveld/hamlogbook-api
Click the 'Clone or Download' button
Copy the link
In Command Line or Git Bash, type 'git clone' then paste the URL.<br>
Run:</p> 
<pre><code>bundle install</code></pre>
<p>Type on the command line:</p> 
<pre><code>rails db:create</code></pre> 
<p>to create the PostgreSQL database. Next type: </p>
<pre><code>rails db:migrate</code></pre> 
<p>to create the database tables.</p>

<p>Run:</p> 
<pre><code>rails s</code></pre> 
<p>to start the backend, Ruby on Rails server that serves the JavaScript frontend.</p>

<p>With each interaction between front- and back end an authorization token is exchanged. Default expiry time for the token is set to 3600 seconds (1 hours). Inactivity of interaction between front- and back end larger than 3600 seconds the token will be expired and the user will be forced to log in again.</p>


<h2>Usage</h2>
<p>Frontend is described in https://github.com/johnzonneveld/hamlogbook-js</p>
<p>This repo works in combination with the before linked frontend. Once that repo has been forked and cloned, opening the index.html will show the user interface. Depending on the user interaction, the frontend will make fetch requests to this API</p>
<ul>
<li>User can signup and login</li>
<li>User can create, read, edit and delete contacts</li>
<li>While adding a new contact user will see if there have been any previous contacts with the remote callsign</li>
<li>User can filter contacts based on callsign, country or mode</li>

<h2>License</h2>
<p><a href="https://opensource.org/licenses/MIT" rel="nofollow">MIT License</a>.</p>
