# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
dept1 = Department.create(name: 'IT', floor: 'Basement')
dept2 = Department.create(name: 'Sales', floor: 'First')
dept3 = Department.create(name: 'Marketing', floor: 'Second')

emp1 = Employee.create(name: 'Dani Coleman', level: 3, department_id: dept2.id)
emp2 = Employee.create(name: 'Mike Dao', level: 4, department_id: dept1.id)
emp3 = Employee.create(name: 'Chris Simmons', level: 2, department_id: dept3.id)

ticket1 = Ticket.create(subject: 'printers broken', age: 5)
ticket2 = Ticket.create(subject: 'pos is a pos', age: 6)
ticket3 = Ticket.create(subject: 'software failure', age: 4)

EmployeeTicket.create(employee_id: emp1.id, ticket_id: ticket1.id)
EmployeeTicket.create(employee_id: emp1.id, ticket_id: ticket2.id)
EmployeeTicket.create(employee_id: emp1.id, ticket_id: ticket3.id)
EmployeeTicket.create(employee_id: emp2.id, ticket_id: ticket1.id)
EmployeeTicket.create(employee_id: emp2.id, ticket_id: ticket2.id)
EmployeeTicket.create(employee_id: emp2.id, ticket_id: ticket3.id)
EmployeeTicket.create(employee_id: emp3.id, ticket_id: ticket1.id)
EmployeeTicket.create(employee_id: emp3.id, ticket_id: ticket2.id)
EmployeeTicket.create(employee_id: emp3.id, ticket_id: ticket3.id)
