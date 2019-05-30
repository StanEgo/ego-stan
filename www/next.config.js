const withCss = require("@zeit/next-css")
const withSass = require("@zeit/next-sass")

let config = {
  webpack: config => {
    // Fixes npm packages that depend on `fs` module
    config.node = {
      fs: 'empty'
    }

    return config
  }
}

config = withSass(config);
config = withCss(config);

module.exports = config;
