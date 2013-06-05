class Url < ActiveRecord::Base
  before_save :get_short_url
  validates :long_url, presence: true

  def get_short_url
    self.short_url = SecureRandom.hex(5)
  end
end
