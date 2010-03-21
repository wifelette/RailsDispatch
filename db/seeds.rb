Contributor.create({
  :firstname => "Abheek", 
  :lastname => "Anand", 
  :bio => "Abheek is the product manager responsible for Engine Yard Cloud. He has an eclectic background spanning roles at a variety of tech companies. Before Engine Yard, Abheek briefly wore a suit and worked as an early-stage investor at Lightspeed Venture Partners. He also worked as an Engineer and Product Manager, building large-scale distributed systems at VMware, Trilogy and IBM Research. Abheek has a BS in Computer Science from IIT Delhi, an MS in Computer Science from the University of Maryland, and an MBA from the Stanford.", 
  :twitter_username => "abheek" 
})

Contributor.create({
  :firstname => "Andre", 
  :lastname => "Arko", 
  :bio => "Andre Arko has been building web applications using Ruby and Rails for five years. He is a member of the Bundler team, and works at Engine Yard.", 
  :twitter_username => "indirect", 
  :github_username => "indirect"
})

Contributor.create({
  :firstname => "Carl", 
  :lastname => "Lerche", 
  :bio => "Carl Lerche is a Ruby enthusiast, and recovering PHP developer. He spent the last year working on Rails 3 at Engine Yard, and prior to that, was a core member of the Merb development team. Carl’s been working with Ruby for over four years, and has completed several large-scale commercial sites in that time. In his spare time, he works on open source projects, travels and shares his thorough knowledge of Belgian beers with any and all.", 
  :twitter_username => "carllerche", 
  :github_username => "carllerche"
})

Contributor.create({
  :firstname => "José", 
  :lastname => "Valim", 
  :bio => "José Valim (josevalim) is the lead-developer and co-founder of Plataforma Tec. He started working with Rails in late 2006 and began contributing actively after his Google Summer of Code project in 2009. After his Machine Learning master’s degree in Italy, he’s been flying constantly between Brazil and Poland. Some say that it is his “eureka” time to code and bring new open-source projects to life. Check for yourself what he’s up to on his company’s blog.", 
  :twitter_username => "josevalim",
  :github_username => "josevalim"
})

Contributor.create({
  :firstname => "Mikel", 
  :lastname => "Lindsaar", 
  :bio => "", 
  :twitter_username => "raasdnil",
  :github_username => "mikel"
})

Contributor.create({
  :firstname => "Yehuda", 
  :lastname => "Katz", 
  :bio => "Yehuda Katz is currently employed by Engine Yard, and works full time as a Core Team Member on the Rails project. He is the co-author of jQuery in Action and the upcoming Rails 3 in Action, and is a contributor to Ruby in Practice.", 
  :twitter_username => "wycats",
  :github_username => "wycats" 
})

# Post.create({:title})


username = "admin"
email = "admin@newgoldleaf.com"
password = Base64.encode64(Digest::SHA1.digest("#{rand(1<<64)}/#{Time.now.to_f}/#{Process.pid}"))[0..7]

user = User.new({:email => email, :password => password, :password_confirmation => password  })

if user.save!  
  puts "\n"
  puts "[ #{ANSI.color(:green) { '✓ Created admin user' }} ]"
  puts "\n"
  puts "login at /login with:"
  puts "email: #{email}"
  puts "password: #{ANSI.color(:light_blue) {password}}"
  puts "\n"
  puts "Change this password immediately to something that you'll"
  puts "remember, there is no way to change if it is forgotten."
  puts "\n"
end
