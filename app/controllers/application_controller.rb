class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :detect_device_format
  before_filter :set_layout_variables

  layout :set_layout

private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @current_user ||= User.find_by_authentication_token(cookies[:auth_token]) if cookies[:auth_token] && @current_user.nil?
    @current_user
  end
  helper_method :current_user

  def authorize 
    redirect_to '/login' unless current_user
  end

  # def detect_device_format
  #   case request.user_agent
  #     when /iPad/i
  #       request.variant = :tablet
  #     when /iPhone/i
  #       request.variant = :phone
  #     when /Android/i && /mobile/i
  #       request.variant = :phone
  #     when /Android/i
  #       request.variant = :tablet
  #     when /Windows Phone/i
  #       request.variant = :phone
  #     else
  #       request.variant = :desktop
  #   end
  # end

  def detect_device_format
    case request.user_agent
        when /iPhone/i, /Android/i && /mobile/i, /Windows Phone/i
          request.variant = :phone
        else
          request.variant = :desktop
      end
  end

  def set_layout
      case request.user_agent
        when /iPhone/i, /Android/i && /mobile/i, /Windows Phone/i
            "application_phone"
        else
            "application"
      end
  end

  def set_layout_variables
    @sitename ||= "CrystalData"
    @sitename.concat(" v0.7")
  end


end
