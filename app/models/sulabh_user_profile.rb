class SulabhUserProfile < ActiveRecord::Base
  #belongs_to :address
  has_many :sulabh_addresses
  has_many :sulabh_loan_requests
  has_many :sulabh_loan_offers
  has_many :sulabh_user_roles
  has_many :sulabh_savings

  accepts_nested_attributes_for :sulabh_loan_requests
  accepts_nested_attributes_for :sulabh_loan_offers
  accepts_nested_attributes_for :sulabh_addresses
  accepts_nested_attributes_for :sulabh_user_roles
  accepts_nested_attributes_for :sulabh_savings 
  
  validates_presence_of :mobile,:aadhar
  
  validates_uniqueness_of :mobile
  validates_uniqueness_of :aadhar


end
