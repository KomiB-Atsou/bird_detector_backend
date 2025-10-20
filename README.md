Flask backend serving the bird detector model. A request with an audio file to the server returns associated predictions.

# Quick start

Requires Python 3.7  

Install poetry

```
sudo apt update
sudo apt install python3.7 python3.7-venv python3.7-distutils -y

# Add to path
export PATH="$HOME/.local/bin:$PATH"
```

Install dependencies

```
poetry install --no-root
```

Start the server:

```
poetry run flask run
```

The web app will show "Hello" on a blank web page
