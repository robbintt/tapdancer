docker run --rm -it -v `pwd`:/app/tapdancer -p 8080:8080 tapdancer bash -c "FLASK_DEBUG=true FLASK_APP=tapdancer.tapdancer.tapdancer:app pyenv exec pipenv run python -m flask run --port=8080 --host=0.0.0.0"

