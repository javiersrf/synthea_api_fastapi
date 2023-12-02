PORT=8000


setup:
	@pip install -U pip setuptools poetry

dependencies:
	@make setup
	@poetry run pip install -U pip
	@poetry install --no-root

update:
	@poetry update

test:
	@make lint
	@make unit
	@make cov

lint:
	@echo "Checking code style ..."
	poetry run ruff check .

style:
	@echo "Applying code style ..."
	poetry run ruff  format .
	poetry run isort --jobs -1 .

unit:
	@echo "Running unit tests ..."
	poetry run coverage run -m pytest synthea

cov:
	poetry run coverage report -m
	@poetry run coverage html

run:
	poetry run python -m synthea.main

clean:
	docker system prune -f

build:
	docker build -t synthea-api:latest . 

deploy:
	docker run --name synthea-api --net=host -d -p ${PORT}:${PORT} synthea-api:latest

dev: clean build deploy
	clear