class EventJob < ActiveJob::Base
  queue_as :default

  def perform
    p "BBBBBBBBB"
    sleep 5
    puts '======== run Event Worker !!!! =============='
    p "SSSSSSS"
  end
end
