class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Devise is validating email and password presence,
  # (amongst other validations) this is here just as a reminder
  # validates :email, presence: true
  # validates :password, presence: true
  validates :username, presence: true

  has_many :participants
  has_many :managed_groups, foreign_key: :manager_id, class_name: 'Group'
  has_many :groups, through: :participants

end
