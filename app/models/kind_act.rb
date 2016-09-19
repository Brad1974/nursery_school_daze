class KindAct < ApplicationRecord
  belongs_to :giver, :class_name => 'Child'
  belongs_to :recipient, :class_name => 'Child', optional: true
  belongs_to :daily_report, :optional => true

  validates :recipient_id, presence: { message: "If you add a kind act then you must select a recipient" }
  validates :act, presence: { message: "If you add a kind act then you must describe the kind act" }

  end
