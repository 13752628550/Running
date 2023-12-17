module.exports = {
  plugins: {
    autoprefixer: {
      overrideBrowserslist: ['last 3 versions'],
      grid: true,
    },
    'postcss-pxtorem': {
      rootValue({ file }) {
        return file.indexOf('vant') !== -1 ? 37.5 : 75
      },
      propList: ['*'],
      unitPrecision: 5,
    },
  },
}
