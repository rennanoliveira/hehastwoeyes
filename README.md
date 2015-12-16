# hehastwoeyes

This project is a [Rails](http://rubyonrails.org/) application for secret santa.
It currently allows users to login via facebook, create a group, invite friends and draw the group.

## Dependencies

To run this project you need to have:

* Ruby 2.2.2 - You can use [RVM](http://rvm.io)
* [PostgreSQL](http://www.postgresql.org/)
  * OSX - [Postgress.app](http://postgresapp.com/)
  * Linux - `$ sudo apt-get install postgresql`
  * Windows - [PostgreSQL for Windows](http://www.postgresql.org/download/windows/)

## Setup the project

1. Install the dependencies above
2. `$ git clone <REPOSITORY_URL> hehastwoeyes` - Clone the project
3. `$ cd hehastwoeyes` - Go into the project folder
4. `$ bin/setup` - Run the setup script
5. `$ bin/rspec` - Run the specs to see if everything is working fine
6. We are using the [Figaro](https://github.com/laserlemon/figaro) gem to configure env variables. You must set: Figaro.env.facebook_key, Figaro.env.facebook_secret and Figaro.env.facebook_callback_url. DO NOT commit your application.yml file

If everything goes OK, you can now run the project!

## Running the project

1. `$ bundle exec foreman start` - Opens the server
2. Open [http://localhost:3000](http://localhost:3000)

#### Running specs and checking coverage

`$ bundle exec rake spec` to run the specs.

`$ coverage=on bundle exec rake spec` to generate the coverage report then open the file `coverage/index.html` on your browser.

## Generated with PAH

Generated with [PAH](https://github.com/Helabs/pah), an open source project created and maintained by [HE:labs](http://helabs.com.br).

## Contributing

See CONTRIBUTING.MD
