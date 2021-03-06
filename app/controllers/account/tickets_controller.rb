class Account::TicketsController < ApplicationController

  layout "account"

  before_action :authenticate_user!
  before_action :set_ticket, only: %i[show edit update destroy reopen]
  before_action :options_for_select, only: %i[new create edit update show]
  before_action :save_last_url, only: %i[destroy reopen]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets_recently = Ticket.where(reporter: current_user)
                              .where.not('status_id = (?) OR status_id = (?)', Status.closed_id, Status.cancel_id)
                              .where(updated_at: (Time.now - 24.hours)..Time.now)
                              .order(updated_at: :desc)
                              .page(params[:recently]).per(6)
    @tickets = Ticket.where(reporter: current_user).order(updated_at: :desc).page(params[:page]).per(10)
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @ticketlogs = TicketLog.where(ticket: @ticket).order(updated_at: :desc)
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    set_default_data
    respond_to do |format|
      if @ticket.save
        Account::Tickets::TicketLogs.create(@ticket)
        format.html { redirect_to account_tickets_path, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    @ticketold = Ticket.find(@ticket.id)
    respond_to do |format|
      if @ticket.update(ticket_params)
        Account::Tickets::TicketLogs.update(@ticket, @ticketold)
        format.html { redirect_to account_tickets_path, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    set_cancel_status
    @ticket.save
    Account::Tickets::TicketLogs.cancel(@ticket)
    respond_to do |format|
      format.html { redirect_to @last_page, notice: 'Ticket was successfully canceled.' }
      format.json { head :no_content }
    end
  end

  def reopen
    set_new_status
    @ticket.save
    Account::Tickets::TicketLogs.reopen(@ticket)
    respond_to do |format|
      format.html { redirect_to @last_page, notice: 'Ticket was successfully reopened.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white
  # list through.
  def ticket_params
    params.require(:ticket).permit(:title, :description)
  end

  def options_for_select
    @status_options_for_select = Status.all
    @kind_options_for_select = Kind.all
  end

  def save_last_url
    @last_page = request.referer
  end

  def set_default_data
    @ticket.kind = Kind.first
    @ticket.reporter = current_user
  end

  def set_cancel_status
    @ticket.status_id = Status.cancel_id
  end

  def set_new_status
    @ticket.status = Status.where(description: 'New').take
  end
end
