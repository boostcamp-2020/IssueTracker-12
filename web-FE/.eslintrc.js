module.exports = {
  env: {
    browser: true,
    commonjs: true,
    es2021: true,
  },
  extends: ['airbnb', 'eslint:recommended', 'airbnb/hooks'],
  parserOptions: {
    ecmaVersion: 12,
  },
  ignorePatterns: ['node_modules/'],
  rules: {},
};
