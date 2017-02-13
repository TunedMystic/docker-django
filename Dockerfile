FROM python:3.6-alpine

LABEL maintainer="TunedMystic"

ENV INSTALL_PATH /app
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY ./requirements.txt $INSTALL_PATH

# RUN apk update && \
#     apk add --no-cache --virtual build-deps gcc python3-dev musl-dev && \
#     apk add postgresql-dev && \
#     apk del build-deps

RUN apk update \
  && apk add --no-cache --virtual build-deps gcc python3-dev musl-dev \
  && apk add postgresql-dev \
  && pip install -r requirements.txt \
  && apk del build-deps

# RUN pip install -r requirements.txt

COPY ./app $INSTALL_PATH
