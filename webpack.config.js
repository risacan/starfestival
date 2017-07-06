var webpack = require("webpack")
require("dotenv").config()

module.exports = {
  context: __dirname + "/src",
  entry: ["./index.html", "./index.js"],
  output: {
    path: __dirname + "/build",
    filename: "bundle.js"
  },
  plugins: [
    new webpack.ProvidePlugin({ riot: "riot" }),
    new webpack.DefinePlugin({
      __FIREBASE_API_KEY: JSON.stringify(process.env.FIREBASE_API_KEY),
      __FIREBASE_AUTH_DOMAIN: JSON.stringify(process.env.FIREBASE_AUTH_DOMAIN),
      __FIREBASE_DATABASE_URL: JSON.stringify(process.env.FIREBASE_DATABASE_URL),
      __FIREBASE_STORAGE_BUCKET: JSON.stringify(process.env.FIREBASE_STORAGE_BUCKET),
      __FIREBASE_MESSAGING_SENDER_ID: JSON.stringify(process.env.FIREBASE_MESSAGING_SENDER_ID)
    })
  ],
  devtool: "inline-source-map",
  module: {
    rules: [
      {
        test: /\.tag$/,
        enforce: "pre",
        loader: "riotjs-loader",
        // query: { type: "babel" }
      },
      {
        test: /\.js$/,
        exclude: /node_modules/,
        // loader: "babel-loader"
      },
      {
        test: /\.html$/,
        loader: "file-loader",
        query: { name: "[name].[ext]" }
      }
    ]
  },
  resolve: {
    extensions: [".js", ".tag"]
  },
  devServer: { contentBase: "./public" }
}