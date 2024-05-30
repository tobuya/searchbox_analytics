import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'
import "channels"
import "@hotwired/turbo-rails"
import "controllers"

// Start Rails, Turbolinks, and ActiveStorage
Rails.start()
Turbolinks.start()
ActiveStorage.start()

// Import and start Stimulus application
import { Application } from '@hotwired/stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'

// Start Stimulus application
const application = Application.start()
const context = require.context('controllers', true, /\.js$/)
application.load(definitionsFromContext(context))

document.addEventListener('DOMContentLoaded', () => {
  const searchForm = document.getElementById('search-form')
  const searchTermInput = document.getElementById('search-term')
  const searchTermsList = document.getElementById('search-terms')

  let debounceTimer

  // Function to log search term in real-time
  const logSearchTerm = (term) => {
    fetch('/search_terms', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
      },
      body: JSON.stringify({ term: term })
    })
    .then(response => response.json())
    .then(data => {
      if (data.message === "Search term processed") {
        const li = document.createElement('li')
        li.innerText = term
        // Check if the term is already in the list to avoid duplicates
        if (!Array.from(searchTermsList.children).some(child => child.innerText === term)) {
          searchTermsList.prepend(li)
        }
      } else {
        console.log("Incomplete search term")
      }
    })
    .catch(error => console.error('Error:', error))
  }

  // Event listener for real-time search logging
  searchTermInput.addEventListener('input', () => {
    const term = searchTermInput.value.trim()
    clearTimeout(debounceTimer)
    debounceTimer = setTimeout(() => {
      if (term) {
        logSearchTerm(term)
      }
    }, 300)
  })

  // Event listener for form submission
  searchForm.addEventListener('submit', (event) => {
    event.preventDefault()
    const term = searchTermInput.value.trim()
    if (term) {
      logSearchTerm(term)
    }
  })
})
