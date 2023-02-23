FROM python:alpine

WORKDIR /cos-archive-restore

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

CMD [ "python", "restore_script.py" ]