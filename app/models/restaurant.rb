class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: ["chinese", "italian", "japanese","french","belgian"] }


  def average_rating
    sum = 0
    self.reviews.each do |review|
      sum += review.rating
    end
    average_rating = sum/self.reviews.count
  end

  def map
    url = "https://api.mapbox.com/geocoding/v5/mapbox.places/#{address}.json?access_token=#{apiKey}"
  end

  private

  def apiKey
    "pk.eyJ1IjoiamFjZWtiYXN0aW45MyIsImEiOiJjbHNpeG83YzQyOTBtMmpubzk4bGU0Y2I3In0.3LU7cAxgIwWOqfEeFV2nHA"
  end



end
