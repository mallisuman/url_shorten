class ApplicationController < ActionController::Base
    # protect_from_forgery with: :exception
    # before_action :track_analytic, if: proc { link_signed_in? }


    # def track_analytic
    #   current_link.app_analytics.create(event_type: params[:event_type], url: params[:url]) if  params[:click_type].present?
    # end
end
