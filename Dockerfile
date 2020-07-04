FROM 		python:2-slim-buster

RUN 		apt-get update && apt-get install -y build-essential dos2unix\
            && pip install --no-cache-dir diamond j2cli \
            && apt-get remove -y --purge build-essential \
            && apt-get autoremove -y \
            && rm -rf /var/lib/apt/lists/* \
            && mkdir -p /etc/diamond/configs \
            && mkdir -p /var/log/diamond/


COPY		config/diamond.conf.j2 /etc/diamond/diamond.conf.j2
COPY		scripts/run.sh /opt/diamond/run.sh

RUN 		dos2unix /opt/diamond/run.sh

ENTRYPOINT  ["./opt/diamond/run.sh"]