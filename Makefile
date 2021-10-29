start:
	cd docker && docker-compose up --build -d
down:
	cd docker && docker-compose down
restart:
	cd docker && docker-compose down
	cd docker && docker-compose up -d
init:
	git clone git@github.com:RomakinNum1/task3Chat_authorise.git ./services/user_api || true
	git clone git@github.com:RomakinNum1/task3Chat_css.git ./services/frontend || true
	git clone git@github.com:RomakinNum1/task3Chat_api.git ./services/chat_api || true
	cd services/user_api/composer && composer install
	cd services/frontend/composer && composer install
	cd services/chat_api/composer && composer install
migrate:
	migrate -path=services/user_api/web/migrations/ -database "mysql://root:root@tcp(localhost:8989)/test" up
composer_restart:
	cd services/user_api/composer && composer dumpautoload
runserv:
	cd services/chat_api && php server.php