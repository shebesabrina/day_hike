class Trip < ApplicationRecord
  has_many :trip_trails
  has_many :trails, throug: :trip_trails
end
