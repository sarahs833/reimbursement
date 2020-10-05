class Account < ApplicationRecord
  belongs_to :user
  has_many :expenses
  accepts_nested_attributes_for :expenses
end
