## Levei

Site Demo: [Here](http://levei.co)

Demo Account:
```bash
login: seller@levei.co
password: qwe123
```


##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.7.1](https://github.com/leospaula/truckin/blob/master/.ruby-version#L1)
- Rails [6.0.3](https://github.com/leospaula/truckin/blob/master/Gemfile#L6)

##### 1. Check out the repository

```bash
git clone git@github.com:levei-co/levei.git
```

##### 2. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

##### 3. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000
