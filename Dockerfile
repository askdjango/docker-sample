FROM python:3.6

WORKDIR /app
COPY app /app
COPY reqs /reqs
COPY run.sh /

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN python3 -m pip install -r /reqs/prod.txt

EXPOSE 8080 8081
USER uwsgi

CMD ["/run.sh"]

