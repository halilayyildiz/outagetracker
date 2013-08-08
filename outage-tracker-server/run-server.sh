#!/bin/sh
cd outage-tracker
bundle exec rake db:migrate RAILS_ENV=production
bundle exec rake assets:precompile RAILS_ENV=production
rails server -e production

