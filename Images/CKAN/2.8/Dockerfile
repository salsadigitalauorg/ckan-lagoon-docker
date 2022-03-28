FROM uselagoon/python:2.7

RUN apk update \
    && apk upgrade \
    && apk add --no-cache git \
    libpq \
    postgresql-dev \
    gcc \
    musl-dev \
    file-dev \
    libxslt-dev \
    libxml2-dev \
    libffi-dev

RUN mkdir -p /app/ckan/default \
    && mkdir -p /app/ckan/default/src/ \
    && fix-permissions /app/ckan/default

RUN virtualenv --no-site-packages /app/ckan/default \
    && . /app/ckan/default/bin/activate \
    && pip install setuptools==36.1

# Set CKAN version to build
ENV GIT_URL=https://github.com/ckan/ckan.git
ENV GIT_BRANCH=ckan-2.8.5

RUN . /app/ckan/default/bin/activate \
	&& cd /app/ckan/default/src/ \
	&& pip install -e git+${GIT_URL}@${GIT_BRANCH}#egg=ckan \
	&& pip install -r '/app/ckan/default/src/ckan/requirements.txt' \
	&& ln -s /app/ckan/default/src/ckan/who.ini /app/ckan/default/who.ini \
	&& deactivate


ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz