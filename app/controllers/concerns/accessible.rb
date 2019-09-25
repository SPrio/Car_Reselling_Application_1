module Accessible
  extend ActiveSupport::Concern
  included do
    #before_action :check_user
  end

  protected
  def check_user
    if current_admin
      #flash.clear
      # if you have rails_admin. You can redirect anywhere really
      #redirect_to(admins_index_path) && return
    elsif current_user
      #flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      #redirect_to(user_index_path) && return
    end
  end
end