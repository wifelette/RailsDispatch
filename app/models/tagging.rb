class Tagging < ActiveRecord::Base
  belongs_to :answer
  belongs_to :tag
end
