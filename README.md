Flask backend serving the bird detector model. A request with an audio file to the server returns associated predictions.

# Quick start without Docker

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


If necessary, install additional packages

```
poetry run pip install "librosa==0.7.2" "numba==0.48" "numpy==1.18.5"
poetry run pip install "h5py==2.10.0"
```

To generate requirements.txt from poetry's virtual environment
```
poetry run pip freeze > requirements-poetry.txt
```

Test the model with a http request
```
curl -X POST -F "file=@/home/komi/test/bird_detector_backend/static/bird1.wav" http://127.0.0.1:5000
```

# Quick start with Docker

Install and configure Docker  
https://docs.docker.com/get-started/get-docker/

Dockerize
```
docker build -t bird-detector-backend .
```

Run with Docker

```
docker run -d -p 5000:5000 --name bird-backend -e SECRET_KEY=myPrivateKey -e UPLOAD_FOLDER=static bird-detector-backend
```
