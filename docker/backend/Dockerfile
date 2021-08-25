FROM python:3.8-slim

RUN apt-get update && \
      apt-get install -y --no-install-recommends \
      wget \
      curl \
      build-essential \
      libpq-dev \
      && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/app

COPY requirements.txt ./
RUN pip3 install -r requirements.txt

COPY . ./
ENV PYTHONPATH='.'
CMD ["./scripts/be_run.sh"]
