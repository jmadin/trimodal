# Production

    $ bundle exec rake db:migrate RAILS_ENV="production"
    $ rake tmp:clear
    $ bundle exec rake assets:precompile RAILS_ENV=production RAILS_GROUPS=assets
    $ rails s -e production -p 3009

