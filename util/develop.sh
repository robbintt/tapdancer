docker run --rm -it -v `pwd`:/app/tapdancer -p 3000:3000 tapdancer "pyenv exec pipenv run uwsgi --ini uwsgi.ini"
