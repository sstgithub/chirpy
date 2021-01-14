class ChirpNotificationJob < ApplicationJob
  queue_as :default

  def perform(chirp)
    chirp_notification_service = ChirpNotificationService.new(chirp.id)
    chirp_notification_service.send_push_notification
  end
end
