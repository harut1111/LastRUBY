class Admin::HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.status != 'admin' && current_user.status != 'editor'
      redirect_to root_path
      
    end
  end
end
