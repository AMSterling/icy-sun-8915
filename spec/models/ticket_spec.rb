require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'relationships' do
    it { should have_many :employee_tickets }
    it { should have_many(:employees).through(:employee_tickets) }
  end

  describe 'model methods' do
    it 'sorts tickets oldest to newest' do
      dept1 = Department.create!(name: 'IT', floor: 'Basement')
      dept2 = Department.create!(name: 'Sales', floor: 'First')
      dept3 = Department.create!(name: 'Marketing', floor: 'Second')

      emp1 = Employee.create!(name: 'Dani Coleman', level: 3, department_id: dept2.id)
      emp2 = Employee.create!(name: 'Mike Dao', level: 4, department_id: dept1.id)
      emp3 = Employee.create!(name: 'Chris Simmons', level: 2, department_id: dept3.id)

      ticket1 = Ticket.create!(subject: 'printers broken', age: 5)
      ticket2 = Ticket.create!(subject: 'pos is a pos', age: 6)
      ticket3 = Ticket.create!(subject: 'software failure', age: 4)
      ticket4 = Ticket.create!(subject: 'warranty', age: 2)
      ticket5 = Ticket.create!(subject: 'client issue', age: 3)

      EmployeeTicket.create!(employee_id: emp1.id, ticket_id: ticket2.id)
      EmployeeTicket.create!(employee_id: emp1.id, ticket_id: ticket4.id)
      EmployeeTicket.create!(employee_id: emp2.id, ticket_id: ticket1.id)
      EmployeeTicket.create!(employee_id: emp2.id, ticket_id: ticket2.id)
      EmployeeTicket.create!(employee_id: emp2.id, ticket_id: ticket3.id)
      EmployeeTicket.create!(employee_id: emp3.id, ticket_id: ticket4.id)
      EmployeeTicket.create!(employee_id: emp3.id, ticket_id: ticket5.id)

      expect(Ticket.oldest_to_newest).to eq([ticket2, ticket1, ticket3, ticket5, ticket4])
    end
  end

  it 'is the oldest ticket' do
    dept1 = Department.create!(name: 'IT', floor: 'Basement')
    dept2 = Department.create!(name: 'Sales', floor: 'First')
    dept3 = Department.create!(name: 'Marketing', floor: 'Second')

    emp1 = Employee.create!(name: 'Dani Coleman', level: 3, department_id: dept2.id)
    emp2 = Employee.create!(name: 'Mike Dao', level: 4, department_id: dept1.id)
    emp3 = Employee.create!(name: 'Chris Simmons', level: 2, department_id: dept3.id)

    ticket1 = Ticket.create!(subject: 'printers broken', age: 5)
    ticket2 = Ticket.create!(subject: 'pos is a pos', age: 6)
    ticket3 = Ticket.create!(subject: 'software failure', age: 4)
    ticket4 = Ticket.create!(subject: 'warranty', age: 2)
    ticket5 = Ticket.create!(subject: 'client issue', age: 3)

    EmployeeTicket.create!(employee_id: emp1.id, ticket_id: ticket2.id)
    EmployeeTicket.create!(employee_id: emp1.id, ticket_id: ticket4.id)
    EmployeeTicket.create!(employee_id: emp2.id, ticket_id: ticket1.id)
    EmployeeTicket.create!(employee_id: emp2.id, ticket_id: ticket2.id)
    EmployeeTicket.create!(employee_id: emp2.id, ticket_id: ticket3.id)
    EmployeeTicket.create!(employee_id: emp3.id, ticket_id: ticket4.id)
    EmployeeTicket.create!(employee_id: emp3.id, ticket_id: ticket5.id)

    expect(Ticket.oldest_ticket).to eq([ticket2])
  end
end
