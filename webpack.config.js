const path = require("path");

module.exports = {
  mode: "production", // ou "development", dependendo do ambiente
  entry: "./app/javascript/application.js", // ponto de entrada
  output: {
    filename: "application.js",
    path: path.resolve(__dirname, "app/assets/builds"),
  },
  module: {
    rules: [
      {
        test: /\.css$/i, // Processa arquivos .css
        use: ["style-loader", "css-loader"], // Aplica os loaders
      },
    ],
  },
  resolve: {
    extensions: [".js", ".css"], // Resolve JS e CSS
  },
};
