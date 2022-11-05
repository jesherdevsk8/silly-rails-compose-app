## Docker Compose Template to Development with Ruby on Rails + MySqll
---

**1. First clone the project**
```
 git clone https://github.com/jesherdevsk8/rails-compose-template.git your_project_name
```

**3. Change directory -**
```
 cd your_project_name
```

**4. Verify yout ruby version and rails version**
```
ruby -v
rails -v
```

**5. Setup your rails version on the Gemfile -**
```
source 'https://rubygems.org'
gem 'rails', '7.0.4'
```

**6. Setup your Ruby version on Dockerfile -**
```
FROM  ruby:3.1.2-slim
```

**7. Now install new rails app - with mysql**
```
docker-compose run app rails new . --force --database=mysql --skip-bundle
```

**8. Change the ownership of the new files**
```
sudo chown -R $USER:$USER .
```

**9. Build the docker image -**
```
docker-compose build
```
**10. Update database details on config/database.yml file.**
```
default: &default
  adapter: mysql2
  encoding: utf8
  pool: 5
  username: root
  password: KDglu#oKy8X1DT
  host: db
```

**11. Run -**
```
docker-compose run app rails db:create

docker-compose up
```

**12. Browse http://localhost:3002**
![Ruby on rails 7.0.4 docker with mysql](https://i.ibb.co/xJXVpLg/rails-compose.png)

_*See docker documentation https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/rails*_
