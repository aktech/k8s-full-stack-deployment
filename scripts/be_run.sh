#!/usr/bin/env bash

echo "ENVIRONMENT: $ENVIRONMENT"
if [ "$ENVIRONMENT" = "development" ]; then
  #  Development build
  echo "Development Server"
  python manage.py
else
  #  Production build
  echo "Production Server"
  gunicorn -c gunicorn.conf.py manage:app
fi
