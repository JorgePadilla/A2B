class City < ApplicationRecord
    #has_one :trip
    #has_one :origin, class_name: "Trip", foreign_key: "trip_id"
   # has_one :destiny, class_name: "Trip", foreign_key: "trip_id"
 #  has_one :origen, :class_name => "City"
  # has_one :destiny, :class_name => "City"
 # has_one :origin_cities, :class_name => "City"
  #has_one :destiny_cities, :class_name => "City"
  has_many :distance
end
