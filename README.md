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

Set environment variables

```
export SECRET_KEY="myPrivateKey"
export UPLOAD_FOLDER="static"
```

Start the server:

```
poetry run flask run
```

The web app will show "Hello" on a blank web page





Librairies complémentaires

poetry run pip install "librosa==0.7.2" "numba==0.48" "numpy==1.18.5"
poetry run pip install "h5py==2.10.0"

Générer requirements.txt
poetry run pip freeze > requirements-poetry-2025-10-23.txt
