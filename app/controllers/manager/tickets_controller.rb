class Manager::TicketsController < ApplicationController

  layout 'manager'

  before_action :authenticate_user!

  def index
    @tickets = Ticket.all.page(params[:page]).per(8)
  end

  private

  def is_manager?
    unless current_user.group.description == 'Manager'

    end
  end

  def tickets_query_type
  end

end
