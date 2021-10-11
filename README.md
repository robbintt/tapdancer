# Tapdancer: Health Checks

Small flask health check service.


## Goals

- Configure endpoints
- Health metrics
- FaaS or container (dockerized locally vs. zappa + aws lambda)
- Web view

## Resources

- https://pypi.org/project/py-healthcheck/


## Managing Pipfile && Pipfile.lock

If you change these files, you must copy them back out: `$ docker run -it -v `pwd`:/code tapdancer bash` ten copy them to `/code`.
