const { environment } = require('@rails/webpacker');

environment.config.entry = {
    application: './app/javascript/packs/application.js'
};

environment.config.node = {
    __dirname: false,
    __filename: false
};

// Add babel-loader configuration
const babelLoader = {
    test: /\.js$/,
    exclude: /node_modules/,
    use: {
        loader: 'babel-loader',
        options: {
            presets: ['@babel/preset-env']
        }
    }
};

environment.loaders.append('babel', babelLoader);

module.exports = environment;
