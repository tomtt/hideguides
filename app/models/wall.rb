class Wall < ActiveRecord::Base
  belongs_to :poi
  has_many :postings
end
