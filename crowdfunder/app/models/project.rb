class Project < ActiveRecord::Base
  has_many :pledges
  belongs_to :user
  has_many :rewards
  has_many :pledgies, through: :pledges, source: :users

  def pledged_funds
    #
    # self.pledges.all.reduce do |sum, pledge|
    #   sum + pledge.amount
    # end

    result = 0

    self.pledges.all.each do |pledge|
      result += pledge.amount
    end

    result

  end


end
