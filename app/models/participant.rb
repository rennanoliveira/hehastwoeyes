class Participant < ActiveRecord::Base

  belongs_to :user, required: true
  belongs_to :group, required: true
  has_one :secret_santa

  delegate :username, to: :user, prefix: nil

end