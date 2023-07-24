FROM python:3.10.11
LABEL maintainer="juliustuliao"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./app /app
WORKDIR /app
EXPOSE 7000


ARG DEV=true
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    adduser --disabled-password --no-create-home gpt-user

ENV PATH="/py/bin:$PATH"

USER gpt-user