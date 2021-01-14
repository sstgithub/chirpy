require 'httparty'

class ChirpNotificationService
  include HTTParty
  base_uri 'https://bellbird.joinhandshake-internal.com'

  def initialize(id)
    @chirp_id = id
  end

  def send_push_notification
    self.class.post('/push', body: { chirp_id: @chirp_id })
  end
end