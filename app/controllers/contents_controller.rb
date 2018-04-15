class ContentsController < ApplicationController
  def index
    @hello = 'Hello World!'
  end

  def test
    p "AAAAAAAAAAAAAA"
    #WatchStoreJob.perform_later
    EventJob.perform_later
    p "CCCCCCCCCCC"
  end
end
