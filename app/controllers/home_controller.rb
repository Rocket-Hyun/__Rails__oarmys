class HomeController < ApplicationController
  def index
  end
  
  def mindex
  end
    
  
  def checking
    redirect_to "/home/check"
  end
end
