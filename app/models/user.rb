class User < ApplicationRecord
  validates :first_name, presence: { message: "You must enter the parent's first name" }
  validates :last_name, presence: { message: "You must enter the parent's last name" }
  validates :last_name, uniqueness: {scope: :first_name, message: "A parent with that name is already registered" }
  validates :email, presence: { message: "Email can't be blank"}
  validates :email, uniqueness: { message: "Email already taken"}
  validates_format_of :email, { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Email is invalid" }
  validates :password, presence: { message: "Password can't be blank"}
  validates :password, confirmation: { message: "Password and password confirmation don't match"}
  validates :password, length: { in: 6..20, message: "Password must be between 6 and 20 characters"}

  has_many :children
  accepts_nested_attributes_for :children, reject_if: :all_blank, allow_destroy: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  enum role: [:user, :guide, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  def name
    self.first_name + " " +self.last_name
  end

end
