## Install

### Clone the repository

```bash
git clone https://github.com/ziyauddin-ror/Test-Task-User-Auth.git
cd Test-Task-User-Auth

```

### Check your Ruby version

```bash
ruby -v
```

The ouput should start with something like `ruby 3.1.2`

If not, install the right ruby version using rvm (it could take a while):

```bash
rvm install "ruby-3.1.2"
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```bash
bundle install
```

### Update database.yml file
In the database.yml file, edit the database configuration as required.

### Initialize the database

```ruby
rails db:create db:migrate
```

### Serve

```ruby
rails s
```
And now you can visit the site with the URL http://localhost:3000/

### Additional Info
#### Here APIs curl requests

- register in response success message
```bash
curl -X POST -H "Content-Type: application/json" -d '{
  "user": {
    "user_name": "usernameexample"
    "email": "user@example.com",
    "password": "password",
    "password_confirmation": "password"
  }
}' http://localhost:3000/api/v1/register
```
- login: response Authorization token after successfully login

```bash
curl -X POST -H "Content-Type: application/json" -d '{
  "email": "user@example.com",
  "password": "password"
}' http://localhost:3000/api/v1/login
```
- Get posts
```bash
curl -X GET -H "Content-Type: application/json"
-H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.TCPGq1isM1XGfYzLpXSXnZLIJi5xyOyXoqp__Fl9Pp4"
http://localhost:3000/api/v1/posts
```
