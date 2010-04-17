run "HOME=/home/deploy cd #{release_path} && bundle install"
run "cd /data/engineyardrailsdispatch/current/ && bundle exec whenever --update-crontab"