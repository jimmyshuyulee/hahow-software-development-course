init:
	pip install pipenv
	pipenv install
	pipenv check

setupMongo:
	pipenv run python setup_mongo.py

format:
	pipenv run black order_system

format-check:
	pipenv run black --check --diff order_system

lint:
	pipenv run pylint order_system

test-unit:
	pipenv run pytest -v tst/unit

test-inte:
	pipenv run pytest -v tst/integration

test-all: test-unit test-inte

run:
	FLASK_APP=order_system pipenv run flask run

all: init format lint test-all run