#!/bin/bash
set -e

php artisan key:generate || true
php artisan migrate --step || true
exec supervisord -c /etc/supervisor/conf.d/supervisord.development.conf
php artisan serve --host=0.0.0.0 --port=8000

php artisan queue:work --tries=3 --timeout=90