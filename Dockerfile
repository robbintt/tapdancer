FROM ubuntu:focal

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl vim git 
RUN apt-get install -y build-essential libssl-dev libreadline-dev libsqlite3-dev liblzma-dev libbz2-dev zlib1g-dev libffi-dev
# hack to avoid the above, didn't work in focal
#RUN apt-get install -y python3-dev

RUN mkdir /app
WORKDIR /app

#COPY Pipfile /app/Pipfile
#COPY Pipfile.lock /app/Pipfile.lock
COPY .python-version /app/.python-version

ENV PYENV_ROOT /.pyenv

RUN curl https://pyenv.run | bash
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN eval "$(pyenv init --path)"

RUN pyenv install -s $(cat /app/.python-version)

# set up pipenv
RUN pyenv exec pip install pipenv
RUN pyenv exec pipenv lock
RUN pyenv exec pipenv sync
