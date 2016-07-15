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
      total_funds += pledge.amount
    end
    total_funds
  end


  def percent_completion

    percent = self.pledged_funds.to_f/self.goal*100.0

    # if percent == self.goal
    #   puts "Target Reached!"
    # else
    #   puts "Keep Pledging!!"
    # end
      percent.round(2)
  end



  # checks to see if a project is fully funded
  def fully_funded?
    if self.pledged_funds >= self.goal
      true
    else
      false
    end
  end

  def count_pledges

    self.pledges.all.count

  end

end
