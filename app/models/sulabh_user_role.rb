class SulabhUserRole < ActiveRecord::Base
  belongs_to :sulabh_user_profile
  has_many :sulabh_role
end

