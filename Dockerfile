FROM python:alpine

WORKDIR /icos-object-restorer

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

CMD [ "python", "restore_script.py" ]