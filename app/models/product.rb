class Product < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :quantity, presence: true, numericality: true
  validates :user_id, presence: true
end
