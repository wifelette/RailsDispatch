namespace :bundle do
  task :install do
    system "bundle install"
  end
end

task :setup => ["bundle:install", "db:setup", "db:seed"]