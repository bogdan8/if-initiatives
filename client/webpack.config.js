const webpack = require('webpack');
const CompressionPlugin = require('compression-webpack-plugin');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const path = require('path');

const config = {
  mode: 'development',
  entry: {
    library: ['babel-polyfill'],
    app: './src/index.jsx'
  },

  output: {
    filename: '[name].[hash].js',
    path: __dirname + '../../public/assets',
    publicPath: '/assets/'
  },

  module: {
    rules: [{
      test: /\.scss$/,
      use: [{
          loader: "style-loader" // creates style nodes from JS strings
      }, {
          loader: "css-loader" // translates CSS into CommonJS
      }, {
          loader: "sass-loader" // compiles Sass to CSS
      }]
    },
    {
      loader: "babel-loader",

      // Skip any files outside of your project's `src` directory
      include: [
        path.resolve(__dirname, "src"),
      ],

      // Only run `.js` and `.jsx` files through Babel
      test: /\.jsx?$/,

      // Options to configure babel with
      query: {
        plugins: ['transform-runtime'],
        presets: ['es2015', 'stage-1', 'react'],
      }
    }]
  },

  plugins: [
    new webpack.HotModuleReplacementPlugin(),
    new CompressionPlugin({
        asset: "[path].gz[query]",
        algorithm: "gzip",
        test: /\.(js|html)$/,
        threshold: 10240,
        minRatio: 0.8
      }),
    new HtmlWebpackPlugin({
      filename: '../index.html',
      template: 'index.ejs',
      chunks: ['app']
    })
  ]
};

module.exports = config;
