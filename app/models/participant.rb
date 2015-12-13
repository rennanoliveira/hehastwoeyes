class Participant < ActiveRecord::Base

  belongs_to :user, required: true
  belongs_to :group, required: true

  delegate :username, to: :user, prefix: nil

end