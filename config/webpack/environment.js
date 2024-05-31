const { environment } = require('@rails/webpacker');
const webpack = require('webpack');

environment.loaders.append('css', {
  test: /\.css$/,
  use: ['style-loader', 'css-loader']
});

const config = environment.toWebpackConfig();
if (config.node) {
  delete config.node.dgram;
  delete config.node.fs;
  delete config.node.net;
  delete config.node.tls;
  delete config.node.child_process;
}

environment.config.merge({
  node: {
    __dirname: false,
    __filename: false,
    global: true,
  }
});

module.exports = environment;

