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
    # expect(page).to have_content('Level: 4')
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
    # expect(page).to have_content('Level: 4')
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
end
