class ContentsController < ApplicationController
  def index
    @hello = 'Hello World!'
  end

  def test
    WatchStoreJob.perform_later
  end
end
