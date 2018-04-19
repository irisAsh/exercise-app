class WatchStoreJob < ApplicationJob
  queue_as :default

  def perform
    p '========== Start WatchStoreJob =========='

    uri = URI.parse 'https://rss.itunes.apple.com/api/v1/jp/ios-apps/new-apps-we-love/all/10/explicit.json'

    http = Net::HTTP.new uri.host, uri.port
    http.use_ssl = true if uri.scheme == 'https'

    req = Net::HTTP::Get.new uri.request_uri

    res = http.request req

    newAppJson = res.body
    parsedJson = JSON.parse(newAppJson)

    feed = parsedJson["feed"]
    results = feed["results"]

    notifier = Slack::Notifier.new('https://hooks.slack.com/services/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')
    notifier.ping <<-EOS.strip_heredoc

      ~~~~~~~~~~~~~~~~~~~~ IOS #{feed["title"]} 10選 ~~~~~~~~~~~~~~~~~~~~
    EOS

    results.each { |result| showResult notifier, result }

    p '========== End WatchStoreJob =========='
  end

  def showResult(notifier, result)
    detial = <<-EOS.strip_heredoc
    ===========================================================================================================
    ```
      name:       #{result["name"]}
      developer:  #{result["artistName"]}
      genres:     #{result["genres"].first["name"]}
      url:        #{result["url"]}
    ```

    EOS

    notifier.ping detial

    notifier.ping "#{result["artworkUrl100"]}"
  end
end
