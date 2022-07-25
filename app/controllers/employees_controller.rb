class EmployeesController < ApplicationController
  def show
    @employee = Employee.find(params[:id])
    @tickets = Ticket.search(params[:search]) if params[:search].present?
  end
end
