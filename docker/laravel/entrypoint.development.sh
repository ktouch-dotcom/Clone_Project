#!/bin/bash
set -e

php artisan key:generate || true
php artisan migrate --step || true
exec supervisord -c /etc/supervisor/conf.d/supervisord.development.conf
