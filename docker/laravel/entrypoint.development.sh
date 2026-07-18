#!/bin/bash
set -e

composer install || true
php artisan key:generate || true
php artisan migrate --step || true
php artisan storage:link || true

exec php artisan serve --host=0.0.0.0 --port=8000
