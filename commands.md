#Web container
```
docker run

--name web

--link db:mysql

-d 

-p 8081:80

-v ./worldapi:/opt/www/worldapi

```

#MySQL container

```
docker run

--name mysql

-e MYSQL_ROOT_PASSWORD=my-secret-pw

-e MYSQL_DATABASE=homestead

-e MYSQL_USER=homestead

-e MYSQL_PASSWORD=secret

-d 

mysql:5.6

```