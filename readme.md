Flask backend serving the bird detector model. A request with an audio file to the server returns associated predictions.

# Quick start

Make sure to use a pipenv compatible with Python 3.7

Create a virtual environment if your installed Python version is not 3.7

To start the server Install the dependencies with `pipenv`:

```
pipenv install
```

Install dependencies without using locked versions in Pipfile.lock

```
pipenv install --dev --skip-lock
```

Start the server:

```
pipenv run python manage.py runserver
```
