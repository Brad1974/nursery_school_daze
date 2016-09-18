class KindAct < ApplicationRecord
  belongs_to :giver, :class_name => 'Child'
  belongs_to :recipient, :class_name => 'Child', optional: true
  belongs_to :daily_report, :optional => true

end
