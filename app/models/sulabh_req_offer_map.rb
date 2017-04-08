class SulabhReqOfferMap < ActiveRecord::Base
  belongs_to :request
  belongs_to :offer
end
