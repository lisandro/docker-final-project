```
docker run

--name web

--link db:mysql

-d 

-p 8081:80

-v ./worldapi:/opt/www/worldapi

--add-host api.world.com.ar:127.0.0.1
```

```
docker run

--name mysql

-e MYSQL_HOST=localhost

-e MYSQL_DATABASE=homestead

-e MYSQL_USER=homestead

-e MYSQL_PASSWORD=secret

-d 

mysql:5.6

```