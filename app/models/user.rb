class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable, :recoverable,
         :rememberable, :trackable,
         :omniauthable, omniauth_providers: [:facebook]

  # Devise is validating email and password presence,
  # (amongst other validations) this is here just as a reminder
  # validates :email, presence: true
  # validates :password, presence: true
  validates :username, presence: true

  has_many :participants
  has_many :managed_groups, foreign_key: :manager_id, class_name: 'Group'
  has_many :groups, through: :participants

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.name.split.join.downcase
      user.image = auth.info.image
    end
  end

  private

  # for devise
  def email_required?
    false
  end

end
