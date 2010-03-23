namespace :db do
  desc "Creates base settings for app"
  task :create_base_settings => :environment do 
    
    Setting.create({
      :setting_name => "twitter_username", 
      :setting_value => "engineyard"
    })

    Setting.create({
      :setting_name => "facebook_url", 
      :setting_value => "http://facebook.com/engineyard"
    })


  end
end
