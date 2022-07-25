class EmployeeTicketsController < ApplicationController
  def create
    @employee = Employee.find(params[:employee_id])
    @ticket = Ticket.find(params[:ticket_id])
    @employee_ticket = EmployeeTicket.create!(ticket_id: @ticket.id, employee_id: @employee.id)

    redirect_to("/employees/#{@employee.id}")
  end
end
