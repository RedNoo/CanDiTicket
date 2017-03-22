class TicketsController < ApplicationController

  before_action :set_tickets, only:[:edit, :update, :show, :destroy,:showticket_for_user]
  before_action :require_member, except: [:allticket_for_user,:showticket_for_user,:update_tickets_user]
  before_action :require_same_member, except: [:index,:new, :create,:allticket_for_user,:showticket_for_user,:update_tickets_user]#, only: [:edit, :update, :destroy]
  before_action :require_user, only:[:allticket_for_user,:showticket_for_user,:update_tickets_user]

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

  def allticket_for_user
    @tickets = Ticket.paginate(page: params[:page], per_page: 5)
  end


  def update_tickets_user
      @ticket =Ticket.find(params[:ticket][:id])
      if @ticket.update(user_id: params[:ticket][:user_id])
        flash[:success] = "Ticket was successfully updated."
        redirect_to showticket_for_user_path(@ticket)
      else
        render :showticket_for_user
      end
  end

  def showticket_for_user
    @users = User.all
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
