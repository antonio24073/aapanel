# Aapanel

Aapanel docker compose file to customize

## Dependencies

- Docker
- Docker compose

## Quick Installation

```
git clone https://github.com/antonio24073/aapanel.git
cd aapanel
docker run -d -p 7889:7800 -p 221:21 -p 222:22 -p 443:443 -p 80:80 -p 888:888 --name=aapanel antonio24073/aapanel:centos-7-preinstalled
sudo docker cp aapanel:/www ../aapanel
docker rm aapanel -f
docker compose up -d 
```

or download and extract zip

## Instructions

To run do this command in the project root folder:

```
docker compose up -d --build 
```

To stop:

```
docker compose down
```

## Read this:

https://hub.docker.com/r/antonio24073/aapanel




----------------------

# Donations

Help keep projects free: <a href="https://www.paypal.com/donate/?business=X3W3QTHS7BDW4&no_recurring=0&currency_code=USD" >Click Here</a>

For customized images call me in the github issues
