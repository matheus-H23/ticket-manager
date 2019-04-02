class Manager::TicketsController < ApplicationController

  layout 'manager'

  before_action :authenticate_user!

  def index
    #code
  end

end
