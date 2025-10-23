# --------------------------
# Étape 1 : image de base
# --------------------------
FROM python:3.7-slim

# --------------------------
# Étape 2 : dépendances système
# --------------------------
RUN apt-get update && apt-get install -y \
    build-essential \
    ffmpeg \
    libsndfile1 \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# --------------------------
# Étape 3 : installer Poetry (compatible Python 3.7)
# --------------------------
ENV POETRY_VERSION=1.5.1
RUN python3 -m pip install --upgrade pip setuptools wheel \
    && python3 -m pip install "poetry==$POETRY_VERSION"

# Ajouter Poetry au PATH
ENV PATH="/root/.local/bin:$PATH"

# --------------------------
# Étape 4 : copier le projet
# --------------------------
WORKDIR /app

# Copier uniquement les fichiers de dépendances pour tirer profit du cache Docker
COPY pyproject.toml poetry.lock* /app/

# Désactiver la création de virtualenv (on installe dans le conteneur directement)
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

# Copier tout le code source
COPY . /app

# --------------------------
# Étape 5 : exposer le port et définir la commande de lancement
# --------------------------
EXPOSE 5000

# Commande pour lancer Flask avec Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:5000", "wsgi:app"]
