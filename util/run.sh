docker run --rm -it -v `pwd`/tapdancer:/app/tapdancer -p 3000:3000 tapdancer bash -c "pyenv exec pipenv run uwsgi --ini uwsgi.ini"
