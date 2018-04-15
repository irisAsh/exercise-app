class ContentsController < ApplicationController
  def index
    @hello = 'Hello World!'
  end

  def test
    p "AAAAAAAAAAAAAA"
    p ENV['REDIS_URL']
    WatchStoreJob.perform_later
  end
end
