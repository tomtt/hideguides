class Wall < ActiveRecord::Base
  belongs_to :point_of_interest
  has_many :postings
end
