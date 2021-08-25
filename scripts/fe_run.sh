#!/usr/bin/env bash


echo "ENVIRONMENT: $ENVIRONMENT"
if [ "$ENVIRONMENT" = "development" ]; then
  #  Development build
  echo "Development Server"
  npm start
else
  #  Production build
  echo "Production Server"
  echo "Files in prod-build"
  ls prod-build
  serve -s -n -p 3000 prod-build
fi

