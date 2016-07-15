class Project < ActiveRecord::Base
  has_many :pledges
  belongs_to :user
  has_many :rewards
  has_many :pledgies, through: :pledges, source: :users

  # adds up all the funds from pledges
  def pledged_funds
    #
    # self.pledges.all.reduce do |sum, pledge|
    #   sum + pledge.amount
    # end

    total_funds = 0
    self.pledges.all.each do |pledge|
      result += pledge.amount
    end
    total_funds

  end

  # checks to see if a project is fully funded
  def fully_funded?
    if self.pledged_funds >= self.goal
      true
    else
      false
    end
  end

end
