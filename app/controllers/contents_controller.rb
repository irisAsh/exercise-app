class ContentsController < ApplicationController
  def index
    @hello = 'Hello World!'
  end

  def test
    p "AAAAAAAAAAAAAA"
    WatchStoreJob.perform_later
  end
end
