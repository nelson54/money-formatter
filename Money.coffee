rgx = /^([A-z\$]{1,3})[\s]?((\d{1,3}(\,\d{3})*|(\d+))(\.\d{2}))?$/

Money = (cur, val) ->

  currency = cur
  value = val

  getCurrency = () ->
    currency

  getValue = () ->
    value

  intValue = () ->
    parseInt(value)

  floatValue = () ->
    parseFloat(value)

  toString = () ->
    if currency && value
      currency + ' ' + value

  {
    getCurrency,
    getValue,
    intValue,
    floatValue,
    toString
  }


Money.valueOf = (string) ->
  m = rgx.exec(string)

  if(m.length >= 3)
    currency = m[1]
    value = m[2]

  return Money(currency, value)

module.exports = Money