class User < ActiveRecord::Base
  has_many :pledges
  has_many :projects
  has_many :pledged_projects through: :pledges, source: :projects
  

end
