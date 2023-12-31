TODO
[x] reset password
[x] don't seed db if there is an existing volume
[x] only backup db if db has data
[x] implement docker healthcheck for web service
[-] abstract .env files out to root folder
[x] create backup of hub db into sql file
[x] run sql to make sure it seeds db
[x] create a seed script to run seed file on start
[x] create initial seed file that ports old hub db into new hub db
[x] add cron job container to docker compose, run cron job for various sql maintenance

QUERY TAGS
SELECT t.tag FROM mobs m
JOIN tags t ON t.id Member of(m.tags)
WHERE m.id = 1

DB CHANGE
-follow data migration steps (ref: https://www.prisma.io/docs/guides/migrate/data-migration)

OR
-git checkout feature branch
-make changes to schema
-npx prisma migrate dev --name <migration_name>
-npx prisma migrate deploy

IF ABOVE ERROR
-wipe out prisma migrations from /web/prisma and from DB prisma table
-npx prisma db push
-rebuild hub_web image
-rerun containers

prisma migrate dev --name init ./prisma/schema.prisma && prisma db seed && 

MYSQLDUMP
mysqldump -h db -u root --password=root hub > ../backups/backup.sql 

RESTORE
mysql -h db -u root --password=root hub > ../backups/backup.sql 

dockerfile
-add RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

mysql sql
-ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';

cron container
-service mysql start
-mysqldump -h hub_mysql --password=root -u root hub > test.sql

BUILD/RUN IMAGE
docker build -t <image_name> .
docker run -d --rm --name <image_name> <image_name>

CONNECT TO MYSQL FROM CONTAINER
docker exec -it <container> bash

CONNECT TO CONTAINER SHELL
docker exec -it <container> bash

TEST CRON
crontab.txt
* * * * * date >> /opt/dates.txt
* * * * * /app/init.sh >> /opt/out.txt  2>&1

STARTING SERVICES
-docker-compose down -v
-docker system prune -a
-docker-compose up --build -d
-cd /web, run npx prisma migrate dev ./prisma/schema.prisma --name init

App routes
/
/builder
/items
/items/:id
/mobs
/mobs/:id
/quests
/quests/:id
/articles
/articles/:id
/login
/signup
/404

SEEDING
-set env database var
-create schema file, point to env database var
-run npx prisma db pull --schema <schema_name>.prisma to create models
-run npx prisma generate --schema <schema.name>.prisma to create the prisma client
-run oldhub sql directly inside of phpmyadmin
-run npm run seed

id  name                         str   con   dex   min
1   a sword of might              5     2
2   a sword of courage                  5     2
3   shield of power                     5     5

no sort (id asc)
----------------
1   a sword of might              5     2
2   a sword of courage                  5     2
3   shield of power                     5     5

name asc
--------
2   a sword of courage                  5     2
1   a sword of might              5     2
3   shield of power                     5     5

name desc
---------
3   shield of power                     5     5
1   a sword of might              5     2
2   a sword of courage                  5     2

str asc
-------
2   a sword of courage                  5     2
3   shield of power                     5     5
1   a sword of might              5     2

str desc
--------
1   a sword of might              5     2
3   shield of power                     5     5
2   a sword of courage                  5     2

con asc
-------
1   a sword of might              5     2
2   a sword of courage                  5     2
3   shield of power                     5     5

con desc
--------
3   shield of power                     5     5
2   a sword of courage                  5     2
1   a sword of might              5     2

dex asc
-------
1   a sword of might              5     2
2   a sword of courage                  5     2
3   shield of power                     5     5

dex desc
--------
3   shield of power                     5     5
2   a sword of courage                  5     2
1   a sword of might              5     2

min asc
-------
1   a sword of might              5     2
2   a sword of courage                  5     2
3   shield of power                     5     5

min desc
--------
3   shield of power                     5     5
2   a sword of courage                  5     2
1   a sword of might              5     2

