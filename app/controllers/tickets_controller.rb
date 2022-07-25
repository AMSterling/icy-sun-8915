class TicketsController < ApplicationController
  def index
    if params[:search].present?
      @tickets = Ticket.search(params[:search])
    else
      @tickets = Ticket.all
    end
  end 
end
