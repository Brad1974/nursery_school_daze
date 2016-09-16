class Child < ApplicationRecord
  has_many :daily_reports, dependent: :destroy

  def name
    self.first_name + " " +self.last_name
  end
  
end
