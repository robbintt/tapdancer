# Tapdancer: Health Checks

Small flask health check service.


## Goals

- Configure endpoints
- Health metrics
- FaaS or container (dockerized locally vs. zappa + aws lambda)
- Web view

## Todos

- switch to 8080 for proxying as it is the traditional usage of the port
- tune uwsgi: https://uwsgi-docs.readthedocs.io/en/latest/ThingsToKnow.html


## Future: ASGI && (FastAPI || Starlette directly)

- ASGI is much faster, 8x faster. Move towards these frameworks: https://github.com/tiangolo/uwsgi-nginx-flask-docker (also see sections on k8s replication differences.
- FastAPI replication guide: https://fastapi.tiangolo.com/deployment/docker/#replication-number-of-processes

## Resources

- https://pypi.org/project/py-healthcheck/


## Managing Pipfile && Pipfile.lock

If you change these files, you must copy them back out: `$ docker run -it -v `pwd`:/code tapdancer bash` ten copy them to `/code`.
