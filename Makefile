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

lint:
	@echo "Checking code style ..."
	poetry run ruff check .

style:
	@echo "Applying code style ..."
	poetry run ruff  format .
	poetry run isort --jobs -1 .

unit:
	@echo "Running unit tests ..."
	cd synthea && poetry run  pytest .

run:
	poetry --group dev run python -m synthea.main