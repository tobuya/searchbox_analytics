const { environment } = require('@rails/webpacker')

environment.config.entry = {
    application: './app/javascript/packs/application.js'
}

environment.config.node = {
    __dirname: false,
    __filename: false
  }

module.exports = environment
