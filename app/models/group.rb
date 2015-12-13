class Group < ActiveRecord::Base

  belongs_to :manager, required: true, class_name: 'User'
  has_many :participants, inverse_of: :group
  has_many :users, through: :participants
  has_many :secret_santas, inverse_of: :group

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true

  before_validation :set_code, on: :create
  accepts_nested_attributes_for :participants, reject_if: :all_blank
  accepts_nested_attributes_for :secret_santas, reject_if: :all_blank

  private

  def set_code
    self.code = generate_code
  end

  def generate_code
    [*('A'..'Z'),*('0'..'9')].shuffle[0,8].join
  end

end
