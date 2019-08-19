class Employee < ActiveRecord::Base
  belongs_to :store

  validates :last_name, :first_name, presence: true

  validates_associated :store

  validate :hourly_rate_between_40_to_200, on: :create
 
  def hourly_rate_between_40_to_200
    if hourly_rate > 200 || hourly_rate < 40
      errors.add(:hourly_rate, "can't be less than 40 or greater than 200")
    end
  end
  
end
