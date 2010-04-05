namespace :db do
  desc "Replacement for default seeds"
  task :seed => :environment do
    require 'active_support'

    tasks = %w{create_base_settings create_contributors create_admin_users
               create_initial_page}

    tasks.each do |task|
      Rake::Task["db:#{task}"].invoke
    end

    puts "[ " + ANSI.color(:green) { "✓ Successfully ran tasks: #{tasks.to_sentence}" } + " ]\n\n"
  end
end
