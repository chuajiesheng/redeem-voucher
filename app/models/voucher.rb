class Voucher < ApplicationRecord
  before_create :create_uuid
  before_create :set_to_not_used

  private
  def create_uuid
    self.uuid = SecureRandom.uuid
  end

  def set_to_not_used
    self.used = false
  end

end
