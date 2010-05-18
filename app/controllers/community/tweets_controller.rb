class Community::TweetsController < ApplicationController 
  
  def index
    @tweets = Twitter::Search.new('railsdispatch')
  end
  
end
