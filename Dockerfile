# This is the dockerfile that builds an image from this package that we
# can use for testing.
FROM jupyterhub/jupyterhub:1.0.0
MAINTAINER Rasmus Munk <rasmus.munk@nbi.ku.dk>

ENV JHUB_SRV_DIR=/srv/jupyterhub

ADD jhub SwarmSpawner/jhub
ADD setup.py SwarmSpawner/setup.py
ADD requirements.txt SwarmSpawner/requirements.txt
ADD requirements-dev.txt SwarmSpawner/requirements-dev.txt
ADD tests/requirements.txt SwarmSpawner/tests/requirements.txt
ADD version.py SwarmSpawner/version.py

RUN cd SwarmSpawner \
    && touch README.rst \
    && python3 setup.py install \
    && cd .. \
    && rm -r SwarmSpawner

WORKDIR $JHUB_SRV_DIR

CMD ["jupyterhub"]
