
## Charter Technologies

#### This project was built using Ruby 2.1.4 and Rails 4.24

### Running on your Machine

#### Clone the repository 
```json
$ git clone git@github.com:RyanDandrow/charter-technologies.git

$ cd charter-technologies
```

#### Install dependencies
```json
$ bundle install
```

#### Run the migrations
```json
$ rake db:migrate
```

#### Run the following Rake task to set up the initial admin user.  Specify your email address in the rake command to sign in with.  For the initial login, use the email you specify in the rake command along with the randomly generated password from the rake command.  
```json
$ rake users:create_admin email=user@example.com
```

#### Run the Server
```json
$ rails s
```

#### Open http://localhost:3000 in your browser to see the app running.