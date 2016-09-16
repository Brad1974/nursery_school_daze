class Child < ApplicationRecord
  has_many :daily_reports, dependent: :destroy
end
