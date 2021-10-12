docker run --rm -it -v `pwd`:/app/tapdancer -p 3000:3000 tapdancer bash -c "FLASK_DEBUG=true FLASK_APP=tapdancer.tapdancer.tapdancer:app pyenv exec pipenv run python -m flask run --port=3000 --host=0.0.0.0"

