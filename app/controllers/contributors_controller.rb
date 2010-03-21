class ContributorsController < ApplicationController
  def index
    @contributors = Contributor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contributors }
    end
  end
end
