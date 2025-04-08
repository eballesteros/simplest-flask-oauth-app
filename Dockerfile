FROM python:3.13-slim

WORKDIR /app

COPY pyproject.toml poetry.lock /app/
RUN pip install poetry && \
    poetry config virtualenvs.create false && \
    poetry install --no-interaction

COPY . /app/

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
