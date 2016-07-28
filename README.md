# docker-airflow

This repository contains **Dockerfile** of [airflow](https://github.com/apache/incubator-airflow) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/jbfavre/airflow-light/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).

## Informations

* Based on Debian Jessie official Image [debian:jessie](https://registry.hub.docker.com/_/debian/) and uses SQLite as backend
* Install [Docker](https://www.docker.com/)
* Install [Docker Compose](https://docs.docker.com/compose/install/)
* Following the Airflow release from [Python Package Index](https://pypi.python.org/pypi/airflow)

## Installation

Pull the image from the Docker repository.

        docker pull jbfavre/airflow-light

## Build

For example, if you need to install [Extra Packages](http://pythonhosted.org/airflow/installation.html#extra-package), edit the Dockerfile and than build-it.

        docker build --rm -t jbfavre/airflow-light .

## Usage

Start the stack (postgres, rabbitmq, airflow-webserver, airflow-scheduler airflow-flower & airflow-worker):

        docker run -p 8080:8080 -p 5555:5555 -p 8793:8793 -ti jbfavre/airflow-light

Check [Airflow Documentation](http://pythonhosted.org/airflow/)

## UI Links

- Airflow: [localhost:8080](http://localhost:8080/)
- Flower: [localhost:5555](http://localhost:5555/)

When using OSX with boot2docker, use: open http://$(boot2docker ip):8080

## Run the test "tutorial"

        docker exec dockerairflow_webserver_1 airflow backfill tutorial -s 2015-05-01 -e 2015-06-01

## Scale the number of workers

Easy scaling using docker-compose:

        docker-compose scale worker=5

This can be used to scale to a multi node setup using docker swarm.

## Links

 - Airflow on Kubernetes [kube-airflow](https://github.com/mumoshu/kube-airflow)

# Wanna help?

Fork, improve and PR. ;-)
