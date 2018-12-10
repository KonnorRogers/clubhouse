[Link to TheOdinProject project](https://www.theodinproject.com/lessons/authentication)

# README

* This is merely an authentication app where all users are built via:

      rails console

* Ruby version - 2.5.1
* Dependencies - Rails 5.2.1, Pry, Bcrypt
* How to use:

      git clone https://github.com/ParamagicDev/clubhouse.git

      cd /path/to/clubhouse

      gem install bundler

      bundle install

      rails db:migrate

      rails console

* Create users at command line like so:

      >> user = User.create(name: 'foobar', email: 'foo@bar.com', password: 'example', password_confirmation: 'example')

* Then exit the console and do as follows:

      rails server

* In your preferred web browser enter the following url:

      localhost:3000

* This will bring you to a login in page w/ a few unstyled links, feel free to make new posts as you please and test around with the app by creating more users, posts etc

* New posts will only display the author name if you login, good luck!

## Considerations

* This is merely a trial of authentication and how it works

* No tests were added as a result, so there may be some broken features

* This is not meant to be beautiful, only a test app

* Currently, the only way to add users is via command line

* Feel free to email me if you have any questions:

* Konnor5456@gmail.com
