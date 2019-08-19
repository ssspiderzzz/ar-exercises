class Store < ActiveRecord::Base
  has_many :employees

  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: true
  validates :mens_apparel, :womens_apparel, inclusion: { in: [ true, false ], 
    message: "only allows true or false" }
  validate  :annual_revenue_must_greater_than_zero, :must_carry_at_least_one_apparel, on: :create

  def annual_revenue_must_greater_than_zero
    if !(annual_revenue.to_i >= 0)
      errors.add(:annual_revenue, "must be 0 or more.")
    end
  end

  def must_carry_at_least_one_apparel 
    if mens_apparel == false && womens_apparel == false
      errors.add(:store_id, "must has at least one of the men's or women's apparel.")
    end
  end

end
