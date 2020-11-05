const result = 'access_token=227f73ab192575cec7476b86831c61908a48e749&scope=&token_type=bearer'
const reg = /access_token=(.*)&scope/
const token = reg.exec(result)[1]
console.log(token)