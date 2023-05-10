FROM python:3.10-alpine
# pull official base image

# set work directory
WORKDIR /app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies
RUN apk update \
   && apk add postgresql-dev gcc musl-dev jpeg-dev zlib-dev

RUN pip install pipenv

COPY Pipfile Pipfile.lock /app/

RUN pipenv install --deploy --system

COPY . .