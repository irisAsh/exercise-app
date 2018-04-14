class EventJob < ActiveJob::Base
  queue_as :default

  def perform
    sleep 5
    puts '======== run Event Worker !!!! =============='
  end
end
