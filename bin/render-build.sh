# exit on error
set -o errexit

bundle install
RAILS_ENV=production rails db:migrate