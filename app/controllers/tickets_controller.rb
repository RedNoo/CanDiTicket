class TicketsController < ApplicationController

  before_action :set_tickets, only:[:edit, :update, :show, :destroy]
  before_action :require_member#, except: [:new]
  before_action :require_same_member, except: [:index,:new, :create]#, only: [:edit, :update, :destroy]


  def index
    @tickets = current_member.tickets.paginate(page: params[:page], per_page: 5) if current_member.tickets
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    #render plain: params[:ticket].inspect
    @ticket = Ticket.new(ticket_params)
    @ticket.member = current_member
    if @ticket.save

      flash[:success] = "Ticket was successfully created."
      redirect_to ticket_path(@ticket)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @ticket.destroy
    flash[:success] = "Ticket was successfully deleted."
    redirect_to tickets_path
  end

  def update
    if @ticket.update(ticket_params)
      flash[:success] = "Ticket was successfully updated."
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

  def require_same_member
    if current_member != @ticket.member
      flash[:danger] = "You can only edit or delete your own tickets"
      redirect_to root_path
    end
  end

end
