namespace :db do
  desc "Creates admin user, or resets if one is already present"
  task :create_admin_users => :environment do 
    
    username = "admin"
    email = "admin@newgoldleaf.com"
    password = Base64.encode64(Digest::SHA1.digest("#{rand(1<<64)}/#{Time.now.to_f}/#{Process.pid}"))[0..7]
    
    User.destroy_all(:email => email)
    user = User.new({:email => email, :password => password, :password_confirmation => password  })
    
    if user.save!  
      puts "\n"
      puts "[ #{ANSI.color(:green) { '✓ Created admin user' }} ]"
      puts "\n"
      puts "login at /admin with:"
      puts "email: #{email}"
      puts "password: #{ANSI.color(:light_blue) {password}}"
      puts "\n"
      puts "Change this password immediately to something that you'll"
      puts "remember, there is no way to change if it is forgotten."
      puts "\n"
    end

  end
end

