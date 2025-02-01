FROM python:3.9-alpine
MAINTAINER Greg Taylor <gtaylor@gc-taylor.com>

RUN pip install --upgrade pip setuptools wheel
# These are copied and installed first in order to take maximum advantage
# of Docker layer caching (if enabled).
COPY *requirements.txt /opt/app/src/
RUN pip install -r /opt/app/src/requirements.txt
RUN pip install -r /opt/app/src/test-requirements.txt

COPY . /opt/app/src/
WORKDIR /opt/app/src
RUN python setup.py install

EXPOSE 5000
CMD dronedemo
