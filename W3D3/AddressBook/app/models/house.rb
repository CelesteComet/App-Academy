class House < ApplicationRecord
  has_many(:people, {
    :class_name => 'Person',
    :primary_key => :id,
    :foreign_key => :house_id
  })
end
