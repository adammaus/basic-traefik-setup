# Basic set up for a Traefik proxy server with LetsEncrypt certificates
This sets up Traefik on a server allowing you to set up any number of domains connected to Docker containers, install LetsEncrypt certificates, and automatically redirects HTTP to HTTPS.

## Requires
A unique domain for each service in docker-compose.yml. Look for TODOs in **docker-compose.yml**.

## Installation
1. Provision a server with contents of **provision-script.sh**. This will install Docker and set up a directory where the LetsEncrypt certificates will be stored.
2. Build images using command below
3. Run images using command below
4. Navigate to your subdomains.

## Build images - Handles pulling Traefik, building containers without using the cache
* docker compose build --no-cache

## Run Images - Allows you to access services and to remove old containers
docker compose up -d --remove-orphans

## Possible use case
* Our server has two domains associated with it. For example, api-v1.domain.com, domain.com. api-v1.domain.com stores all the API routes for v1 of the API. domain.com is the main website.
* This allows our server to be relatively since Docker handles everything. It pulls the containers it needs to run each app.
* We can use a CI/CD pipeline and Docker Compose to inject configuration variables into the container i.e. MySQL credentials, Keys/Secrets, etc.