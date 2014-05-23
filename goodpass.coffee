prefix = 'Too short to not contain'
errorLength = (n) -> "Too short (must be #{n} characters or more)"
errorUpper  = (n) -> "#{prefix} uppercase letter (must be #{n} characters or more)"
errorLower  = (n) -> "#{prefix} lowercase letter (must be #{n} characters or more)"
errorNumber = (n) -> "#{prefix} number (must be #{n} characters or more)"
errorSymbol = (n) -> "#{prefix} symbol (must be #{n} characters or more)"

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
