<p align="center">
    <img src="https://github.com/octobercms/october/blob/master/themes/demo/assets/images/october.png?raw=true" alt="October" width="15%" height="15%" />
</p>

[October](http://octobercms.com) is a Content Management System (CMS) and web platform whose sole purpose is to make your development workflow simple again. It was born out of frustration with existing systems.<br>
This fork is a **Multi Solution** boilerplate which includes:

* Disabled core updates
* Locked dependencies
* Enabled DotEnv configuration
* Builder plugin
* **Docker!**
    * PHP 7.1
    * MySQL 5.7
    * Redis 3.2
    * Composer
    * Enabled modrewrite

### Using this fork

```shell
composer create-project multisolution/october your-app dev-master
```

Copy `.env.dist` to `.env` and `.htaccess.dist` to `.htaccess` and update the copied files contents to match you environment.
You also should update `docker/vhost.conf` and `docker/php.ini`.

If using Docker Compose, don't forget to change container names.

Then you should exec install scripts yourself:

```shell
docker-compose exec web php composer.phar install
docker-compose exec web php artisan key:generate
docker-compose exec web php artisan october:up
docker-compose exec web php artisan october:fresh
```
*If you are not using Docker, just remove the `docker-compose exec web` part.*
