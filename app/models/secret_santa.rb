class SecretSanta < ActiveRecord::Base

  belongs_to :group
  belongs_to :participant
  belongs_to :friend, class_name: 'Participant'

  validates :group, presence: true
  validates :participant, presence: true
  validates :friend, presence: true

end