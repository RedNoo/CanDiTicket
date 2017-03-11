class TicketsController < ApplicationController

  before_action :set_tickets, only:[:edit, :update, :show, :destroy]

  def index
    @tickets = Ticket.all
  end


  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    #render plain: params[:ticket].inspect
    @ticket = Ticket.new(ticket_params)
    if @ticket.save

      flash[:notice] = "Ticket was successfully created."
      redirect_to ticket_path(@ticket)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @ticket.destroy
    flash[:notice] = "Ticket was successfully deleted."
    redirect_to tickets_path
  end

def update
  if @ticket.update(ticket_params)
    flash[:notice] = "Ticket was successfully updated."
    redirect_to ticket_path(@ticket)
  else
    render :edit
  end
end


  private
  def set_tickets
     @ticket = Ticket.find(params[:id])
  end
  def ticket_params
    params.require(:ticket).permit(:subject,:description )
  end
end
