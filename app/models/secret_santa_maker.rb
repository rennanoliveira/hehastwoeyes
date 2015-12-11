# Responsible for receiving an array of objects
#  and returning a linked-list-ish array of 2 by 2 elements
class SecretSantaMaker

  def initialize(participants)
    @participants = participants.shuffle
  end

  def generate
    participants.map.with_index do |participant, index|
      if participant == participants.last
        [participant, participants[0]]
      else
        [participant, participants[index + 1]]
      end
    end
  end

  private

  attr_accessor :participants

end
