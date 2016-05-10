class Family < ActiveRecord::Base
  has_many :users
  has_many :events
  has_many :posts

  def create_family_code
    self.family_code = SecureRandom.hex(8)
    self.save
  end

end
