class Distance < ApplicationRecord
  belongs_to :origin_city , :class_name => "City"
  belongs_to :destiny_city , :class_name => "City"
end
