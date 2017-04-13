require 'json'
require 'api/ICICIAppathonAPIXway.rb'

# Controller and action definition for uri say/hello
# See routing configuration in config/routes.rb
class SayController < ApplicationController
  layout false
  def hello
    # get user ip from request
    @yourip = request.remote_ip
    
    # use params[:name] to get request parameter value by name
     @parameter = params[:name]
    
    # get Ruby version and Rails version
    @ruby_version = RUBY_VERSION
    @rails_version = Rails::VERSION::STRING
    
    # environment variable 'VCAP_SERVICES' is in JSON format. You may use JSON.parse() to get Ruby hash
    # 'VCAP_SERVICES' is empty if your didn't bind any service to the application
    # @vcap_services = ENV['VCAP_SERVICES']
    # @home = ENV['HOME']
    # @memory_limit = ENV['MEMORY_LIMIT']
    # @port = ENV['PORT']
    # @pwd = ENV['PWD']
    # @tmpdir = ENV['TMPDIR']
    # @user = ENV['USER']
    # 'VCAP_APPLICATION' is in JSON format, use JSON.parse() to get Ruby hash
    # @vcap_app = JSON.parse(ENV['VCAP_APPLICATION'])
    
    # Variables Defined by Ruby Buildpack
    # @bundle_bin_path = ENV['BUNDLE_BIN_PATH']
    # @bundle_gemfile = ENV['BUNDLE_GEMFILE']
    # @bundle_without = ENV['BUNDLE_WITHOUT']
    # @database_url = ENV['DATABASE_URL']
    # @gem_home = ENV['GEM_HOME']
    # @rack_env = ENV['RACK_ENV']
    # @rails_env = ENV['RAILS_ENV']
    
    env = {}
    # loop to parse all JSON object
    # @env is available in the view: views/say/hello.html.erb
    ENV.each do |key, value|
        begin
            obj = JSON.parse(value)
            env[key] = JSON.pretty_generate(obj)
        rescue
            env[key] = value
        end
      end
    @env = env

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
options_cta = { query: { client_id: @c_id , token: @token , accountno: act_no }}
@balEnqResult = balEnq.getResponseWithOptions(options_cta)
puts @balEnqResult

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


  end
end

