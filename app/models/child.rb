class Child < ApplicationRecord
  belongs_to :user, :optional => true
  has_many :daily_reports, dependent: :destroy
  has_many :kind_acts, :class_name => KindAct, :foreign_key => 'giver_id'
  has_many :gifts, :class_name => KindAct, :foreign_key => 'recipient_id'

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

  def nap_average
    nap_array = (self.daily_reports.collect{|d| d.nap_duration})
    total = (nap_array.inject(0){|sum, x| sum + x })
    if total > 0
      return total / nap_array.count
    end
  end

  def reported_today
    return true if self.daily_reports.find_by(date: Date.today, emailed: true)
  end

end
