rgx = /^([A-z\$]{1,3})[\s]?((\d{1,3}(\,\d{3})*|(\d+))(\.\d{2}))?$/

Money = () ->
  currency = null
  value = null

  init = (cur, val) ->
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
    else
      null

  {
    init: init,
    getCurrency: getCurrency,
    intValue: intValue,
    floatValue: floatValue,
    getValue: getValue,
    toString: toString
  }


Money.valueOf = (string) ->
  obj = Money()
  m = rgx.exec(string)
  currency = m[1]
  value = m[2]
  obj.init(currency, value)
  return obj



Object.keys(currencies).forEach( (currency) ->
    Money[currency] = currencies[currency]
)

module.exports = Money