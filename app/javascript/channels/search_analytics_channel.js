import consumer from "channels/consumer"

consumer.subscriptions.create("SearchAnalyticsChannel", {
  connected() {
    console.log("Connected to SearchAnalyticsChannel")
  },

  disconnected() {
    console.log("Disconnected from SearchAnalyticsChannel")
  },

  received(data) {
    const searchTermsList = document.getElementById('search-terms')
    if (searchTermsList) {
      const li = document.createElement('li')
      li.innerText = data.search_term
      searchTermsList.prepend(li)

      // Limit the number of search terms displayed
      if (searchTermsList.children.length > 10) {
        searchTermsList.removeChild(searchTermsList.lastChild)
      }
    } else {
      console.error("Element 'search-terms' not found")
    }
  }
});
