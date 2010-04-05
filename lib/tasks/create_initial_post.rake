namespace :db do
  desc "Creates the initial Page"
  task :create_initial_page => :environment do

    Page.create({
      :title => "About Us",
      :sidebar_title => "About Us",
      :body => "lorem ipsum",
      :published => true,
      :publish_date => Date.today,
      :slug => "about-us"
    })

  end
end
