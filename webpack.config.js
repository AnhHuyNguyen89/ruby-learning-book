// webpack.config.js
const path = require("path");
const webpack = require("webpack");

const isProd = process.env.NODE_ENV === "production";

module.exports = {
  mode: isProd ? "production" : "development",
  devtool: isProd ? "source-map" : "eval-source-map",
  entry: { application: "./app/javascript/application.js" },
  output: {
    filename: "[name].js",
    path: path.resolve(__dirname, "app/assets/builds"),
    clean: true,
  },
  resolve: { extensions: [".js"] },
  plugins: [
    new webpack.optimize.LimitChunkCountPlugin({ maxChunks: 1 }),
    new webpack.ProvidePlugin({
      $: "jquery",
      jQuery: "jquery",
      "window.jQuery": "jquery",
    }),
  ],
};
