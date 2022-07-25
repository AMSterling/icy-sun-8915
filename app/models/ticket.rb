class Ticket < ApplicationRecord
  has_many :employee_tickets
  has_many :employees, through: :employee_tickets

  def self.oldest_to_newest
    order(age: :desc)
  end

  def self.oldest_ticket
    order(age: :desc).limit(1)
  end
end
