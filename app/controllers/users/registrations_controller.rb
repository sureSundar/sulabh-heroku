class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  skip_before_filter :authenticate_user!

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:phoneno, :aadhar, :password) }
  end
  
  def after_sign_up_path_for(resource)
     # Or :prefix_to_your_route
	 @sulabh_user_profile = SulabhUserProfile.new
	  
	 @sulabh_user_profile.mobile = resource.phoneno
	 @sulabh_user_profile.aadhar = resource.aadhar
	  
	 @sulabh_user_profile.sulabh_addresses.build
	 @sulabh_user_profile.sulabh_addresses[0].country="India"
	 @sulabh_user_profile.sulabh_addresses[0].city="Chennai"
	 @sulabh_user_profile.sulabh_addresses[0].pincode="600088"
	 @sulabh_user_profile.sulabh_addresses[0].save
	 @sulabh_user_profile.save
 	 @sulabh_user_profile.sulabh_user_roles.build.role_id=1
 	 @sulabh_user_profile.sulabh_user_roles.build.role_id=2
 	 @sulabh_user_profile.save
 	 
 	 edit_sulabh_user_profile_path(@sulabh_user_profile)
  end
  
end
