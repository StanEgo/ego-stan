const withCss = require("@zeit/next-css");
const withTypescript = require('@zeit/next-typescript');

let config = {
  webpack: config => {
    // Fixes npm packages that depend on `fs` module
    config.node = {
      fs: 'empty'
    }

    return config
  }
}

config = withTypescript(config);
config = withCss(config);

module.exports = config;
