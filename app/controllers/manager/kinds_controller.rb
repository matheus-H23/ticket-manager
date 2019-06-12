class Manager::KindsController < ApplicationController

  layout "manager"

  before_action :authenticate_user!
  before_action :set_kind, only: [:show, :edit, :update, :destroy]
  #before_action :options_for_select, only: [:new, :create, :edit, :update, :show]
  before_action :uncategorize_tickets, only: [:destroy]

  # GET /kinds
  # GET /kinds.json
  def index
    @kinds = Kind.order(:id).page(params[:page]).per(10)
  end

  # GET /kinds/1
  # GET /kinds/1.json
  def show
    @ticketlogs = TicketLog.where(ticket: @ticket).order(updated_at: :desc)
  end

  # GET /kinds/new
  def new
    @kind = Kind.new
  end

  # GET /kinds/1/edit
  def edit
  end

  # POST /kinds
  # POST /kinds.json
  def create
    @kind = Kind.new(kind_params)
    respond_to do |format|
      if @kind.save
        format.html { redirect_to manager_kinds_path, notice: 'Kind was successfully created.' }
        format.json { render :show, status: :created, location: @kind }
      else
        format.html { render :new }
        format.json { render json: @kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kinds/1
  # PATCH/PUT /kinds/1.json
  def update
    respond_to do |format|
      if @kind.update(kind_params)
        format.html { redirect_to manager_kinds_path, notice: 'Kind was successfully updated.' }
        format.json { render :show, status: :ok, location: @kind }
      else
        format.html { render :edit }
        format.json { render json: @kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy

    if @kind.destroy
      redirect_to manager_kinds_path, notice: 'Kind deleted successfully'
    else
      redirect_to manager_kinds_path, notice: 'Kind cannot be deleted!'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kind
      @kind = Kind.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kind_params
      params.require(:kind).permit(:title, :description)
    end

    def uncategorize_tickets
      @tickets = Ticket.where(kind: @kind)
      @tickets.each do |ticket|
        ticket.kind = Kind.first
        ticket.save!
      end
    end
end
