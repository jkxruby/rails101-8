class WelcomeController < ApplicationController
  def index
    flash[:notice] = "改变世界！快速开发！"
  end


end
