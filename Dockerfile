FROM python:3.9-slim-buster

LABEL Name="Python Flask Demo App" Version=1.4.2
LABEL org.opencontainers.image.source = "https://github.com/pavankumarindian/FlaskApp-Deployment-Pipeline-with-Jenkins-and-EC2.git"

ARG srcDir=src
WORKDIR /app

COPY src/requirements.txt .
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY src/run.py .
COPY src/app ./app

EXPOSE 5000

CMD ["gunicorn", "-b", "0.0.0.0:5000", "run:app"]
