class Admin::ApplicationController < ApplicationController
  before_action :check_for_admin

  private

  def check_for_admin
    redirect_to root_path, alert: 'You are not authorized!' unless current_user.admin?
  end
end
