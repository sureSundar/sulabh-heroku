class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :two_factor_authenticatable, :database_authenticatable,:registerable,
         :recoverable, :rememberable, :trackable,:authentication_keys => [:phoneno]
#has_one_time_password
validates :email, :presence => false, :email => false
#validates_presence_of :phoneno
validates_uniqueness_of :phoneno
#validates_presence_of :aadhar
#validates_uniqueness_of :aadhar
#validates :aadhar, length: { is: 12 }

def send_two_factor_authentication_code
  # Send code via SMS, etc.
    client = Twilio::REST::Client.new 'ACd4ebc9a9c7af111d8c71bf821fc05649', 
'fd2a9a4708fd06c06a771b5b3b96baba'

    client.messages.create(
      from: "+14157023684",
      to:   "+918056149278",
      body: "Sulabh OTP :#{self.otp_code}"      
    ) 
end
	 
end
