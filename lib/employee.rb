class Employee < ActiveRecord::Base
  belongs_to :store

  validates_associated :store
  validates :last_name, :first_name, presence: true
  validate :hourly_rate_between_40_to_200, on: :create

  before_create do
    self.password = [*('a'..'z'),*('0'..'9')].shuffle[0,8].join
  end
 
  def hourly_rate_between_40_to_200
    if hourly_rate > 200 || hourly_rate < 40
      errors.add(:hourly_rate, "can't be less than 40 or greater than 200")
    end
  end
  
end
