class SulabhUserRole < ActiveRecord::Base
  belongs_to :username
  belongs_to :role
end
