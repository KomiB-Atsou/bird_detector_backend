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

# Quick start with Docker using poetry for dependancy management

Install and configure Docker  
https://docs.docker.com/get-started/get-docker/

Dockerize
```
docker build -t bird-detector-backend -f Dockerfile-poetry .
```

Run with Docker

```
docker run -d -p 5000:5000 --name bird-backend -e SECRET_KEY=myPrivateKey -e UPLOAD_FOLDER=static bird-detector-backend
```

# Deploy Docker image to GCP Cloud Run

In the following commands, always replace PROJECT_ID with your GCP project id.

Install gcloud CLI

https://cloud.google.com/sdk/docs/install?authuser=1#linux 

Authenticate to Google Cloud

```
gcloud auth login
```

Create an Artifact Repository repo and configure authentification

```

gcloud artifacts repositories create quickstart-docker-repo --repository-format=docker \
    --location=us-west1 --description="Docker repository" \
    --project=PROJECT_ID

gcloud auth configure-docker us-west1-docker.pkg.dev

```

Update the tag of the image

```
docker tag bird-detector-backend:latest \
us-west1-docker.pkg.dev/PROJECT_ID/quickstart-docker-repo/bird-detector-backend-image:tag1
```

Then push to Artifact Registry

```
docker push us-west1-docker.pkg.dev/PROJECT_ID/quickstart-docker-repo/bird-detector-backend-image:tag1
```


Deploy the image to Cloud Run

```
gcloud run deploy bird-detector-backend-app \
  --image us-west1-docker.pkg.dev/<PROJECT_ID>/quickstart-docker-repo/bird-detector-backend-image:tag1 \
  --platform managed \
  --region europe-west1 \
  --allow-unauthenticated \
  --port 5000 \
  --memory 2Gi \
  --cpu 2
```