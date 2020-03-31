class Person < ApplicationRecord
  validates :rut, presence: true, uniqueness: true, rut: true
  validates :name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 18 }

  auto_strip_attributes :rut, :name, :last_name, :course

  self.per_page = 5
end
