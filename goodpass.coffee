prefix = 'Too short to not contain'
errorLength = (n) -> "Too short (must be #{n} characters or more)"
errorUpper  = (n) -> "#{prefix} uppercase letter (must be #{n} characters or more)"
errorLower  = (n) -> "#{prefix} lowercase letter (must be #{n} characters or more)"
errorNumber = (n) -> "#{prefix} number (must be #{n} characters or more)"
errorSymbol = (n) -> "#{prefix} symbol (must be #{n} characters or more)"

goodpass = (password) ->
  if not password return ['Empty password']

  msgs = []
  symbolRegex = /[-!$%^&*()_+|~=`{}\[\]:";'<>?,.\/]/g
  hasSymbol = symbolRegex.test(password)
  hasNumber = /[0-9]/g.test(password)
  hasUpper = /[A-Z]/g.test(password)
  hasLower = /[a-z]/g.test(password)

  if password.length < 8
    msgs.push(errorLength(8))
  else if password.length < 12
    msgs.push(errorSymbol(12)) if hasSymbol
    msgs.push(errorNumber(16)) if hasNumber
    msgs.push(errorUpper(20)) if hasUpper
    msgs.push(errorLower(20)) if hasLower
  else if password.length < 16
    msgs.push(errorNumber(16)) if hasNumber
    msgs.push(errorUpper(20)) if hasUpper
    msgs.push(errorLower(20)) if hasLower
  else if password.length < 20
    msgs.push(errorUpper(20)) if hasUpper
    msgs.push(errorLower(20)) if hasLower

  return msgs

module.exports = goodpass
