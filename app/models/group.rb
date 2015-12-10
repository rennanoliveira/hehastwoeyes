class Group < ActiveRecord::Base

  has_many :participants
  belongs_to :manager, class_name: 'User'

  validates :name, presence: true
  validates :manager_id, presence: true
  validates :code, presence: true, uniqueness: true

  before_validation :set_code, on: :create
  accepts_nested_attributes_for :participants, reject_if: :all_blank

  private

  def set_code
    self.code = generate_code
  end

  def generate_code
    [*('A'..'Z'),*('0'..'9')].shuffle[0,8].join
  end

end
