class Manager::TicketsController < ApplicationController

  layout 'manager'

  before_action :authenticate_user!

  def index

  end

  private

  def is_manager?
    unless current_user.group.description == 'Manager'

    end
  end

end
