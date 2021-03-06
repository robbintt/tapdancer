from flask import Flask
from healthcheck import HealthCheck, EnvironmentDump

app = Flask(__name__)

app.debug = True
#app.secret_key = 'development key'

health = HealthCheck()
envdump = EnvironmentDump()

# add your own check function to the healthcheck
def redis_available():
    #client = _redis_client()
    #info = client.info()
    return True, "redis ok"

health.add_check(redis_available)

# add your own data to the environment dump
def application_data():
    return {"maintainer": "Luis Fernando Gomes",
            "git_repo": "https://github.com/ateliedocodigo/py-healthcheck"}

envdump.add_section("application", application_data)

# Add a flask route to expose information
app.add_url_rule("/healthcheck", "healthcheck", view_func=lambda: health.run())
app.add_url_rule("/environment", "environment", view_func=lambda: envdump.run())

#if __name__ == '__main__':
#    app.run()
