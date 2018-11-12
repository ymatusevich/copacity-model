# frozen_string_literals: true

require 'google/apis/calendar_v3'
require 'google/api_client/client_secrets.rb'

module Google
  class BaseService
    APPLICATION_NAME = 'capacity-model'
    CALENDAR_ID = 'b2b2dot0.com_rhn8suffclrkhqjusnb42lnibk@group.calendar.google.com'


    def initialize(user, params)
      @user = user
      @params = params
    end

    def call
      raise NotImplementedErrors
    end

    private

    def credentials
      ::Google::APIClient::ClientSecrets.new(
        'web' => { 'access_token'  => @user.token,
                   'refresh_token' => @user.refresh_token,
                   'client_id'     => Rails.application.secrets.google_client_id,
                   'client_secret' => Rails.application.secrets.google_client_secret })
    end

    def client
      @client ||= ::Google::Apis::CalendarV3::CalendarService.new.tap do |client|
        client.authorization = credentials.to_authorization
        client.authorization.grant_type = 'refresh_token'
        if @user.token_expired?
          client.authorization.refresh!
          @user.update_attributes(
            token:         client.authorization.access_token,
            refresh_token: client.authorization.refresh_token,
            expires_at:    client.authorization.expires_at.to_i
          )
        end
      end
    end
  end
end
