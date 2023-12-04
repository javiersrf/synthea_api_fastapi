# Fastapi Patient CRUD

This project is a comprehensive example of a CRUD (Create, Read, Update, Delete) application with soft delete functionality for data listing. It features a ready-to-use API designed for microservices, built using FastAPI. This setup not only demonstrates the essential operations of a web service but also integrates advanced features like soft deletion, which allows for non-destructive data handling. The architecture is optimized for scalability and efficiency, making it an ideal starting point for developing microservices in Python with FastAPI.

## Data Source

The data for this project is sourced from Synthea, an open-source synthetic patient generator that models the medical histories of synthetic patients. More information can be found on their [website](https://synthea.mitre.org/).

Sample data can be downloaded from the following URL: [Synthea Sample Data](https://synthetichealth.github.io/synthea-sample-data/downloads/latest/synthea_sample_data_ccda_latest.zip).

## Prerequisites

- Python 3.11
- Poetry for Python dependency management
- docker
- docker-compose

## Installation

### Docker-Compose Setup

To install and start PostgreSQL:

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```
Verify the result of installation
```bash
docker-compose --version
```
### Application Setup

#### Install Dependencies

```bash
make dependencies
```

This will set up your Python environment and install necessary dependencies.

## Usage

To start the tests, run:

```bash
make run
```

## Running Tests

#### Only Tests

```bash
make unit
```

#### Full Tests Setup
To run tests, linting, and style checks:
```bash
make test
```

#### Coverage
To run coverage:
```bash
make cov
```

### Building and Deploying with Docker

#### Deploying the Application

To deploy the application using Docker, execute:

```bash
make build
```

This will run the `synthea-api` image in a Docker container. The container will be named `synthea-api`, and the application will be accessible on the specified port set by the `${PORT}` environment variable. Ensure that the `PORT` environment variable is set before running this command, or modify the Makefile to use a default port. The database will be placed in a container named postgres on the port `${DB_PORT}`

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
