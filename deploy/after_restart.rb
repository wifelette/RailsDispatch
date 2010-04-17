run "HOME=/home/deploy cd #{release_path} && bundle install"
run "cd /data/engineyardrailsdispatch/current/ && whenever --update-crontab"