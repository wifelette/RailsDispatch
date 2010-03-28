APP_CONFIG = YAML.load_file("#{Rails.root}/config/content.yml")
S3_CONFIG = YAML::load(File.read("#{Rails.root}/config/s3.yml"))
