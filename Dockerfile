FROM ubuntu:focal

# timezone
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# apt
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl vim git
RUN apt-get install -y build-essential libssl-dev libreadline-dev libsqlite3-dev liblzma-dev libbz2-dev zlib1g-dev libffi-dev

# app pre setup
RUN mkdir /app
WORKDIR /app

# python pyenv config
COPY Pipfile /app/Pipfile
COPY Pipfile.lock /app/Pipfile.lock
COPY .python-version /app/.python-version
ENV PYENV_ROOT /.pyenv
RUN curl https://pyenv.run | bash
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN eval "$(pyenv init --path)"
RUN pyenv install -s $(cat /app/.python-version)

# python pipenv config
RUN pyenv exec pip install pipenv
RUN pyenv exec pipenv lock
RUN pyenv exec pipenv sync

# app setup
RUN mkdir -p /run/uwsgi
COPY uwsgi.ini /app/uwsgi.ini

# socket for nginx reverse proxy (also update in run.sh)
RUN mkdir -p /var/run/nginx_sidecar
