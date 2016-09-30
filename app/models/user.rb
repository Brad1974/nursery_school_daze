class User < ApplicationRecord
  has_many :children
  accepts_nested_attributes_for :children, reject_if: :all_blank, allow_destroy: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :guide, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  def name
    self.first_name + " " +self.last_name
  end

end
