class SearchAnalyticsChannel < ApplicationCable::Channel
    def subscribed
      stream_from "search_analytics_channel"
    end
  
    def unsubscribed
      # Any cleanup needed when channel is unsubscribed
    end
end
  