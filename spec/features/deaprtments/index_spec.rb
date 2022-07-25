require 'rails_helper'

RSpec.describe 'the department index' do
  it 'lists all departments with their attributes' do
    dept1 = Department.create!(name: 'IT', floor: 'Basement')
    dept2 = Department.create!(name: 'Sales', floor: 'First')
    dept3 = Department.create!(name: 'Marketing', floor: 'Second')

    emp1 = Employee.create!(name: 'Dani Coleman', level: 3, department_id: dept2.id)
    emp2 = Employee.create!(name: 'Mike Dao', level: 4, department_id: dept1.id)
    emp3 = Employee.create!(name: 'Chris Simmons', level: 2, department_id: dept3.id)

    visit '/departments'

    within '#department-0' do

      expect(page).to have_content('Name: IT')
      expect(page).to have_content('Floor: Basement')
      expect(page).to_not have_content('Name: Sales')
      expect(page).to_not have_content('Floor: First')
      expect(page).to_not have_content('Name: Marketing')
      expect(page).to_not have_content('Floor: Second')
    end

    within '#department-1' do

      expect(page).to have_content('Name: Sales')
      expect(page).to have_content('Floor: First')
      expect(page).to_not have_content('Name: IT')
      expect(page).to_not have_content('Floor: Basement')
      expect(page).to_not have_content('Name: Marketing')
      expect(page).to_not have_content('Floor: Second')
    end

    within '#department-2' do

      expect(page).to have_content('Name: Marketing')
      expect(page).to have_content('Floor: Second')
      expect(page).to_not have_content('Name: IT')
      expect(page).to_not have_content('Floor: Basement')
      expect(page).to_not have_content('Name: Sales')
      expect(page).to_not have_content('Floor: First')
    end
  end

  it 'lists all employees for that department as well' do
    dept1 = Department.create!(name: 'IT', floor: 'Basement')
    dept2 = Department.create!(name: 'Sales', floor: 'First')
    dept3 = Department.create!(name: 'Marketing', floor: 'Second')

    emp1 = Employee.create!(name: 'Dani Coleman', level: 3, department_id: dept2.id)
    emp2 = Employee.create!(name: 'Mike Dao', level: 4, department_id: dept1.id)
    emp3 = Employee.create!(name: 'Chris Simmons', level: 2, department_id: dept3.id)

    visit '/departments'

    within '#department-0' do

      expect(page).to have_content('Name: IT')
      expect(page).to have_content('Floor: Basement')
      expect(page).to have_content('Employee Name: Mike Dao')
    end

    within '#department-1' do

      expect(page).to have_content('Name: Sales')
      expect(page).to have_content('Floor: First')
      expect(page).to have_content('Employee Name: Dani Coleman')
    end

    within '#department-2' do

      expect(page).to have_content('Name: Marketing')
      expect(page).to have_content('Floor: Second')
      expect(page).to have_content('Employee Name: Chris Simmons')
    end
  end
end
