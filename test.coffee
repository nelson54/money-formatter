Money = require('./Money')

val = '$1.99'

money = Money.valueOf(val)

console.log('created instance: ' + money.toString())

console.log('currency is: ' + money.getCurrency()) # > 'USD'
console.log('value is: ' + money.getValue()) # > '1.99'

if money.toString() != val
  console.log('nope')
else
  console.log('all clear')
