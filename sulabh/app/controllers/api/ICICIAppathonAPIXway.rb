require 'httparty'
require 'json'

class ICICIAppathonAPIXway
  include HTTParty

  def initialize(apikey)

  @c_id="suresundar@gmail.com"
  @password="4RV6JENO"

  if (@token === nil)
	@token = ""
  end
	if (apikey === "authToken")
		@base_uri = 'https://corporateapiprojectwar.mybluemix.net'
		@endpoint = '/corporate_banking/mybank/authenticate_client'
		@options = { query: { client_id: @c_id, password: @password } }
	elsif (apikey === "metaData")
		@base_uri = 'https://retailbanking.mybluemix.net'
		@endpoint = '/banking/icicibank/participantmapping'
		@options = { query: { client_id: @c_id } }	
	elsif (apikey === "balanceEnquiry")
		@base_uri = 'https://retailbanking.mybluemix.net/banking'
		@endpoint = '/icicibank/balanceenquiry'		
	elsif (apikey === "actSummary")
		@base_uri = 'https://retailbanking.mybluemix.net'
		@endpoint = '/banking/icicibank/account_summary'
	elsif (apikey === "miniStatement")
		
		@base_uri = 'https://retailbanking.mybluemix.net'
		@endpoint = '/banking/icicibank/recenttransaction'
	elsif (apikey === "behaviourScore")
		@base_uri = 'https://retailbanking.mybluemix.net'
		@endpoint = '/banking/icicibank/behaviour_score'
	elsif (apikey === "listRegisteredPayee")
		
		@base_uri = 'https://retailbanking.mybluemix.net'
		@endpoint = '/banking/icicibank/listpayee'
	elsif (apikey === "fundTransfer")
		@base_uri = 'https://retailbanking.mybluemix.net'
		@endpoint = '/banking/icicibank/fundTransfer'
	end

  end

  def getResponse
     puts "Insite getResponse : Options = "
     puts @options

    self.class.get(@base_uri + @endpoint, @options)
  end  
  def getResponseWithOptions(options)
	puts "Insite getResponseWithOptions : " 
	puts @base_uri
	puts @endpoint
	puts options
	 
	self.class.get(@base_uri + @endpoint, options)
  end
end
=begin
puts "Triggering AuthToken API"
authToken = ICICIAppathonAPIXway.new("authToken")
@aT = JSON.parse(authToken.getResponse)[0]["token"]
@token = @aT
@c_id = 'suresundar@gmail.com'
@password = '4RV6JENO'

puts @aT

puts "Triggering Account Meta Data API"
metaData = ICICIAppathonAPIXway.new("metaData")
puts metaData.getResponse
@mData = JSON.parse(metaData.getResponse)
act_no = @mData[0]["account_no"]
act_no1 = @mData[2]["account_no"]
cusid = @mData[0]["cust_id"]
puts "Ac No :"
puts act_no


puts "Triggering Balance Enquiry API"
puts "self.Token = "+ @token
balEnq = ICICIAppathonAPIXway.new("balanceEnquiry")
puts "Act No :" + act_no
puts "C ID : " + @c_id
options_cta = { query: { client_id: @c_id , token: @token , account_no: act_no }}
@result = balEnq.getResponseWithOptions(options_cta) 
puts @result

puts "Triggering Account Summary API..."
options_ctca = {query: { client_id: @c_id , token: @token, custid: cusid, accountno: act_no}}
actSummaryObj = ICICIAppathonAPIXway.new("actSummary")
@actSummaryResult = actSummaryObj.getResponseWithOptions(options_ctca)
puts @actSummaryResult

puts ""
puts "Triggering Ministatement API..."
miniStatementObj = ICICIAppathonAPIXway.new("miniStatement")
options_ctano = { query: { client_id: @c_id , token: @token , accountno: act_no }}
@miniStatementResult = miniStatementObj.getResponseWithOptions(options_ctano)
puts @miniStatementResult

puts ""
puts "Triggering BehaviourScore API..."
bScoreObj= ICICIAppathonAPIXway.new("behaviourScore")
@bScoreResult = bScoreObj.getResponseWithOptions(options_ctano)
puts @bScoreResult

puts ""
puts "Triggering ListRegisteredPayee API..."
lRPayee = ICICIAppathonAPIXway.new("listRegisteredPayee")
options_ctc = {query: { client_id: @c_id , token: @token, custid: cusid }}
@lRPayeeResult = lRPayee.getResponseWithOptions(options_ctc)
puts @lRPayeeResult


puts ""
puts "Triggering FundTransfer API..."
fundTransferObj = ICICIAppathonAPIXway.new("fundTransfer")
options_ft = {query: { client_id: @c_id , token: @token , srcAccount: act_no, destAccount: act_no1, amt: 200,payeeDesc: "NA",payeeId: "1", type_of_transaction: "school fee payment"}}
@fTResult = fundTransferObj.getResponseWithOptions(options_ft)
puts @fTResult
=end
