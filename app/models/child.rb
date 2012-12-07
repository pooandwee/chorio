class Child < ActiveRecord::Base
  attr_accessible :bank, :dob, :image, :name, :total
  
  before_save :calculate_bank
  before_save :running_total
  
  validates :name, presence: true
  
  has_many :rewards
  has_many :chores
  
  mount_uploader :image, ImageUploader
  
  
  # sort this out in the morning so you're not repeating but this will work as quick hack
  # then use it to calculate levels showing an alert saying kids can have 
  
  def running_total
    run_total = 0
    self.chores.where(completed: true).each do |chore|
      run_total += chore.points
    end
    
    self.total = run_total
  end
  
  
  def calculate_bank
    # reset the score to zero
    b = 0

    # for each chore where it's completed, loop over each chore
    # and add it to variable b
    self.chores.where(completed: true).each do |chore|
      b += chore.points
    end

    self.rewards.where(rewarded: true).each do |reward|
      b -= reward.costs
    end
    # set the bank to the total
    self.bank = b
  end
  
  def age
     now = Time.now.utc.to_date
     now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end
  
end
