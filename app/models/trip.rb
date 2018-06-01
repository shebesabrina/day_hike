class Trip < ApplicationRecord

  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def trails_length
    trails.sum(:length)
  end

  def trails_average
    trails.average(:length)
  end

  def longest_distance
    trails.maximum(:length)
  end

  def shortest_distance
    trails.minimum(:length)
  end
end
