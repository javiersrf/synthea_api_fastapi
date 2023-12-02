FROM python:3.11.6-alpine3.18

WORKDIR /usr/src/app

RUN pip install poetry

# Install Make
RUN apk add --no-cache make

COPY . /usr/src/app

RUN make dependencies

EXPOSE 8000

# Define environment variable
ENV SQLALCHEMY_DATABASE_URL=postgresql://api:jw8s0F4@localhost:5432/synthea

CMD ["make", "run"]
