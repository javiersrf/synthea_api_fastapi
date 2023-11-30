# Fastapi Patient CRUD

This project is a comprehensive example of a CRUD (Create, Read, Update, Delete) application with soft delete functionality for data listing. It features a ready-to-use API designed for microservices, built using FastAPI. This setup not only demonstrates the essential operations of a web service but also integrates advanced features like soft deletion, which allows for non-destructive data handling. The architecture is optimized for scalability and efficiency, making it an ideal starting point for developing microservices in Python with FastAPI.

## Description

Provide a more detailed explanation of your project. Explain the purpose and functionality of the project, and how it relates to the Synthea dataset.

## Data Source

The data for this project is sourced from Synthea, an open-source synthetic patient generator that models the medical histories of synthetic patients. More information can be found on their [website](https://synthea.mitre.org/).

Sample data can be downloaded from the following URL: [Synthea Sample Data](https://synthetichealth.github.io/synthea-sample-data/downloads/latest/synthea_sample_data_ccda_latest.zip).

## Prerequisites

List any prerequisites, libraries, OS version, tools, etc., needed before installing the program.

For example:
- PostgreSQL
- Python 3.11
- Poetry for Python dependency management

## Installation

### Database Setup

To install and start PostgreSQL:

```bash
sudo apt-get -y install postgresql
sudo service postgresql start
```

#### Creating the Database

Access PostgreSQL CLI and create a database named `synthea`:

```sql
CREATE DATABASE synthea;
```

#### Importing Data

To import data from a file:

```bash
sudo -u postgres psql synthea < path/to/dump.sql
```

Replace `path/to/dump.sql` with the actual path to your SQL dump file (placed in the repository).

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

To run tests, linting, and style checks:

```bash
make test
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
