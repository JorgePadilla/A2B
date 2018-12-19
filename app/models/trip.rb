class Trip < ApplicationRecord
  belongs_to :user
  delegate :name, to: :user, prefix: true
  #belongs_to :origin, class_name: "City"
end
