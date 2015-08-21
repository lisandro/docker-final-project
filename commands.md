#Web container
```
docker build -t app-web-image:1.1 .
docker run --name web --link mysql:mysql -d -p 80:80 -v /home/lisandro/git_projects/docker-final-project/worldapi:/opt/www/worldapi app-web-image:1.1

```

#MySQL container

```
docker run --name mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -e MYSQL_DATABASE=homestead -e MYSQL_USER=homestead -e MYSQL_PASSWORD=secret -d mysql:5.6

```