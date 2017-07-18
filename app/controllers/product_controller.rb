class ProductController < ApplicationController
  def index
        @users = User.order(:id)
        @membership = Membership.order(:id)
        
        respond_to do |format|
            format.html
            format.csv { render text: @users.to_csv }
        end
  end
end
