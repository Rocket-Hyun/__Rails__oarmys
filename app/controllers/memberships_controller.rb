class MembershipsController < ApplicationController
  def mambership_params
    params.require(:membership).permit(:name, :tag_list) ## Rails 4 strong params usage
  end
end
