class Group < ActiveRecord::Base

  validates :name, presence: true
  validates :manager, presence: true
  validates :code, presence: true

  before_validation :generate_code, on: :create

  private

  def generate_code
    self.code = '1234'
  end

end
