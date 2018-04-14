class ContentsController < ApplicationController
  def index
    @hello = 'Hello World!'
  end

  def test
    EventJob.perform_later
  end
end
