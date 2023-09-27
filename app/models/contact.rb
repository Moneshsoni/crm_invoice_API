class Contact < ApplicationRecord
  validates:first_name, presence: true,uniqueness: true
  validates:last_name, presence: true
  validates:email, presence: true
end
