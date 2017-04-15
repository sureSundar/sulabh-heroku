class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale

#def set_locale
 # if defined?(params) && params[:locale]
  #  I18n.locale = params[:locale]
  #elsif current_user && current_user.language_id.present?
    #I18n.locale = current_user.language.code
  #elsif defined?(request)
   # I18n.locale = extract_locale_from_accept_language_header
  #end
  #I18n.locale ||= I18n.default_locale
  # => I18n.locale = :en unless valid_languages.include?(I18n.locale.to_sym)
#end

  #before_action :authenticate_user!  
def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      new_user_session_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
end

def after_sign_in_path_for(resource_or_scope)

  if resource_or_scope.is_a?(User) #&& resource_or_scope.locale !=  I18n.locale
    I18n.locale = SulabhUserProfile.where(:mobile => resource_or_scope.phoneno)[0].locale
    puts "locale found "
    puts I18n.locale
  end

  super
end
 
def set_locale
  I18n.locale = params[:locale] || I18n.default_locale
  #Rails.application.routes.default_url_options[:locale]= I18n.locale
end

 def default_url_options(options={})
  logger.debug "default_url_options is passed options: #{options.inspect}\n"
  { locale: I18n.locale }
end
end
