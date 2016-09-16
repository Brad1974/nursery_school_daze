class Child < ApplicationRecord
  has_many :daily_reports, dependent: :destroy
  validates :first_name, presence: { message: "You must enter a first name" }
  validates :last_name, presence: { message: "You must enter a last name" }
  validates :last_name, uniqueness: {scope: :first_name, message: "A child with that name is already enrolled" }
  validate :proper_age

  def proper_age
    if (DateTime.now - birthdate < 365)
      errors.add(:birthdate, "Children must be at least one year old to enroll")
    end
  end

  def name
    self.first_name + " " +self.last_name
  end

end
