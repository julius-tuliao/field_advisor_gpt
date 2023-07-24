FROM python:3.9-alpine3.13
LABEL maintainer="juliustuliao"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./app /app
WORKDIR /app
EXPOSE 7000

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = true ]; then /py/bin/pip install -r /tmp/requirements.dev.txt; fi && \
    adduser --disabled-password --no-create-home gpt-user

ENV PATH="/py/bin:$PATH"

USER gpt-user