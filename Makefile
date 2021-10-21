start:
	cd docker && docker-compose up -d
down:
	cd docker && docker-compose down
restart:
	cd docker && docker-compose down
	cd docker && docker-compose up -d
init:
	git clone https://github.com/RomakinNum1/task3Chat_authorise.git ./services/user_api
	git clone https://github.com/RomakinNum1/task3Chat_css.git ./services/frontend
	cd services/user_api/composer && composer install
migrate:
	migrate -path=services/user_api/web/migrations/ -database "mysql://root:root@tcp(task2.loc:8989)/test" up
composer_autoload:
	cd services/user_api/composer && composer dumpautoload