class Person < ApplicationRecord
  belongs_to(:house, {
    :class_name => 'House',
    :primary_key => :id,
    :foreign_key => :house_id
  })

  validates :name, presence: true 
end
