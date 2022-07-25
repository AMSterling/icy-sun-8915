class Employee < ApplicationRecord
  belongs_to :department
  has_many :employee_tickets
  has_many :tickets, through: :employee_tickets

  def oldest_ticket
    self.tickets.order(age: :desc).limit(1).pluck(:subject)
  end
end
