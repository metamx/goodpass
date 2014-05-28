_ = require('underscore')

isVowel = (char) -> _.contains(['a', 'e', 'i', 'o', 'u'], char)
getArticle = (word) -> if isVowel(word.charAt(0)) then "an" else "a"
needs = (type, n) -> "Must contain #{getArticle(type)} #{type}, if fewer than #{n} characters."
errorLength = (n) -> "Too short (must be #{n} characters or more)."
errorUpper  = (n) -> needs("uppercase letter", n, "an")
errorLower  = (n) -> needs("lowercase letter", n)
errorNumber = (n) -> needs("number", n)
errorSymbol = (n) -> needs("symbol", n)

goodpass = (password) ->
  if not password
    return ['Empty password']

  msgs = []
  symbolRegex = /[-!$%^&*()_+|~=`{}\[\]:";'<>?,.\/]/g
  hasNoSymbol = not symbolRegex.test(password)
  hasNoNumber = not /[0-9]/g.test(password)
  hasNoUpper = not /[A-Z]/g.test(password)
  hasNoLower = not /[a-z]/g.test(password)

  if password.length < 8
    msgs.push(errorLength(8))
  else if password.length < 12
    msgs.push(errorSymbol(12)) if hasNoSymbol
    msgs.push(errorNumber(16)) if hasNoNumber
    msgs.push(errorUpper(20)) if hasNoUpper
    msgs.push(errorLower(20)) if hasNoLower
  else if password.length < 16
    msgs.push(errorNumber(16)) if hasNoNumber
    msgs.push(errorUpper(20)) if hasNoUpper
    msgs.push(errorLower(20)) if hasNoLower
  else if password.length < 20
    msgs.push(errorUpper(20)) if hasNoUpper
    msgs.push(errorLower(20)) if hasNoLower

  return msgs

module.exports = goodpass
