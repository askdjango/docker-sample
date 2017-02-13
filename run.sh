#!/bin/bash
set -e

if [ "$ENV" = "DEV" ]; then
    echo "Running Development Server"
    exec python3 manage.py runserver 0.0.0.0:8080 2>&1
else
    echo "Running Production Server"
    exec uwsgi --http "0.0.0.0:$PORT" --wsgi-file /app/askdjango/wsgi.py --master --stats 0.0.0.0:8081
fi

