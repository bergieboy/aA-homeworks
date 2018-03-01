class People < ApplicationRecord
  validates :name, :house_id, presence: true

  belongs_to :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'House'
end
