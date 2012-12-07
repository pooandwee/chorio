class Reward < ActiveRecord::Base
  attr_accessible :child_id, :costs, :image, :name, :rewarded
  
  validates :costs, presence: true
  validates :name, presence: true
  
  belongs_to :child
  
  mount_uploader :image, ImageUploader
  
  scope :completed, where(:rewarded => true)
  scope :incomplete, where(:rewarded => false)
  
  after_save :update_bank
  
  def update_bank
    # this will call calculate_bank on before save
    child.save
  end
end
