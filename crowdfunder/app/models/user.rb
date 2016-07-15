class User < ActiveRecord::Base
  has_many :pledges
  has_many :projects
  has_many :pledged_projects, through: :pledges, source: :projects

  def has_funded?(project_id)

    if self.pledges.find_by project_id: project_id
      true
    else
      false
    end

  end
end
