class Project < ActiveRecord::Base
  has_many :pledges
  belongs_to :user
  has_many :rewards
  has_many :pledgies, through: :pledges, source: :users
end
