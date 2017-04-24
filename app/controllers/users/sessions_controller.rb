class Users::SessionsController < Devise::SessionsController
  skip_before_filter :authenticate_user!

  def default_url_options(options={})
  logger.debug "default_url_options is passed options: #{options.inspect}\n"
  { locale: I18n.locale }
end
   
end