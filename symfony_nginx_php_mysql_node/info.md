https://www.youtube.com/watch?v=ITOnpzkzlYM  
https://www.youtube.com/watch?v=tcU5XwlEeRU  

docker exec -it php-container bash  
composer create-project symfony/skeleton .  
composer update

docker exec -it php-container bash 
php bin/console doctrine:database:create

