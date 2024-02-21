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

end
