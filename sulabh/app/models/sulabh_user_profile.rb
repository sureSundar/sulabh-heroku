class SulabhUserProfile < ActiveRecord::Base
  #belongs_to :address
  has_one :sulabh_address
  accepts_nested_attributes_for :sulabh_address
end
