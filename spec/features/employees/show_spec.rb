require 'rails_helper'

RSpec.describe 'the employee show page' do
  it 'shows the employees name and their department' do
    dept1 = Department.create!(name: 'IT', floor: 'Basement')
    dept2 = Department.create!(name: 'Sales', floor: 'First')
    dept3 = Department.create!(name: 'Marketing', floor: 'Second')

    emp1 = Employee.create!(name: 'Dani Coleman', level: 3, department_id: dept2.id)
    emp2 = Employee.create!(name: 'Mike Dao', level: 4, department_id: dept1.id)
    emp3 = Employee.create!(name: 'Chris Simmons', level: 2, department_id: dept3.id)

    visit "/employees/#{emp1.id}"

    expect(page).to have_content('Name: Dani Coleman')
    # expect(page).to have_content('Level: 3')
    expect(page).to have_content('Department: Sales')
    expect(page).to_not have_content('Name: Mike Dao')
    expect(page).to_not have_content('Department: IT')
    expect(page).to_not have_content('Name: Chris Simmons')
    expect(page).to_not have_content('Department: Marketing')

    visit "/employees/#{emp2.id}"

    expect(page).to have_content('Name: Mike Dao')
    expect(page).to have_content('Department: IT')
    expect(page).to_not have_content('Name: Dani Coleman')
    expect(page).to_not have_content('Department: Sales')
    expect(page).to_not have_content('Name: Chris Simmons')
    expect(page).to_not have_content('Department: Marketing')

    visit "/employees/#{emp3.id}"

    expect(page).to have_content('Name: Chris Simmons')
    expect(page).to have_content('Department: Marketing')
    expect(page).to_not have_content('Name: Dani Coleman')
    expect(page).to_not have_content('Department: Sales')
    expect(page).to_not have_content('Name: Mike Dao')
    expect(page).to_not have_content('Department: IT')
  end

  it 'also shows the employees tickets oldest to newest' do
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

    visit "/employees/#{emp1.id}"

    expect(page).to have_content('Name: Dani Coleman')
    expect(page).to have_content('Department: Sales')

    within '#ticket-0' do
      expect(page).to have_content('Ticket: pos is a pos')
    end

    within '#ticket-1' do
      expect(page).to have_content('Ticket: warranty')
    end

    expect(page).to have_content('Oldest Ticket: ["pos is a pos"]')
    expect(page).to_not have_content('Ticket: printers broken')
    expect(page).to_not have_content('Ticket: client issue')
    expect(page).to_not have_content('Ticket: software failure')

    visit "/employees/#{emp2.id}"

    expect(page).to have_content('Name: Mike Dao')
    expect(page).to have_content('Department: IT')

    within '#ticket-0' do
      expect(page).to have_content('Ticket: pos is a pos')
    end

    within '#ticket-1' do
      expect(page).to have_content('Ticket: printers broken')
    end

    within '#ticket-2' do
      expect(page).to have_content('Ticket: software failure')
    end

    expect(page).to have_content('Oldest Ticket: ["pos is a pos"]')
    expect(page).to_not have_content('Ticket: client issue')
    expect(page).to_not have_content('Ticket: warranty')

    visit "/employees/#{emp3.id}"

    expect(page).to have_content('Name: Chris Simmons')
    expect(page).to have_content('Department: Marketing')

    within '#ticket-0' do
      expect(page).to have_content('Ticket: client issue')
    end

    within '#ticket-1' do
      expect(page).to have_content('Ticket: warranty')
    end

    expect(page).to have_content('Oldest Ticket: ["client issue"]')
    expect(page).to_not have_content('Ticket: printers broken')
    expect(page).to_not have_content('Ticket: software failure')
    expect(page).to_not have_content('Ticket: pos is a pos')
  end

  it 'can add a ticket to an employee' do
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

    visit "/employees/#{emp1.id}"

    expect(page).to have_button('Search')

    fill_in('Find Ticket', with: "#{ticket1.id}")
    click_on('Search')

    expect(page).to have_content('printers broken')
    expect(page).to have_button("Add #{ticket1.subject}")

    click_on("Add #{ticket1.subject}")

    expect(current_path).to eq("/employees/#{emp1.id}")
    expect(page).to have_content('Ticket: printers broken')
  end
end
