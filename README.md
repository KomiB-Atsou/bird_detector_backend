Install poetry

Linux
curl -sSL https://install.python-poetry.org | python3 -

Windows
pip install poetry

Add to windows path

poetry env info : to check python version used py poetry

poetry env use C:\chemin\vers\python37\python.exe

pip install --upgrade pip setuptools wheel
pip install numpy==1.21.6 --only-binary=:all:

poetry install --no-root

poetry env activate

poetry run flask run