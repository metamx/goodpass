{expect} = require('chai')
goodpass = require('../goodpass.coffee')

prefix = 'Too short to not contain'
errorLength = (n) -> "Too short (must be #{n} characters or more)"
errorUpper  = (n) -> "#{prefix} uppercase letter (must be #{n} characters or more)"
errorLower  = (n) -> "#{prefix} lowercase letter (must be #{n} characters or more)"
errorNumber = (n) -> "#{prefix} number (must be #{n} characters or more)"
errorSymbol = (n) -> "#{prefix} symbol (must be #{n} characters or more)"
blank       = 'Empty password'

describe 'goodpass', ->
  describe 'passwords', ->
    it 'should not be valid if blank', ->
      expect(goodpass('')).to.eql([blank])

    it 'should not be valid if fewer than 8 chars', ->
      expect(goodpass('abcdefg')).to.eql([errorLength(8)])

    it 'should not be valid if fewer than 12 chars with no lowercase letter', ->
      expect(goodpass('ABCDEFGH1*')).to.eql([errorLower(20)])
    it 'should not be valid if fewer than 12 chars with no uppercase letter', ->
      expect(goodpass('abcdefgh1*')).to.eql([errorUpper(20)])
    it 'should not be valid if fewer than 12 chars with no number', ->
      expect(goodpass('abcdefgH*')).to.eql([errorNumber(16)])
    it 'should not be valid if fewer than 12 chars with no symbol', ->
      expect(goodpass('abcdefgH1')).to.eql([errorSymbol(12)])

    it 'should not be valid if fewer than 16 chars with no lowercase letter', ->
      expect(goodpass('ABCDEFGHIJKL1*')).to.eql([errorLower(20)])
    it 'should not be valid if fewer than 16 chars with no uppercase letter', ->
      expect(goodpass('abcdefghijkl1*')).to.eql([errorUpper(20)])
    it 'should not be valid if fewer than 16 chars with no number', ->
      expect(goodpass('abcdefghijkL*')).to.eql([errorNumber(16)])

    it 'should not be valid if fewer than 20 chars with no lowercase letter', ->
      expect(goodpass('ABCDEFGHIJKL12345')).to.eql([errorLower(20)])
    it 'should not be valid if fewer than 20 chars with no uppercase letter', ->
      expect(goodpass('abcdefghijkl12345')).to.eql([errorUpper(20)])

    it 'should be valid if 8+ chars with symbols, mixed case letters, and numbers', ->
      expect(goodpass('abcdefgH1*')).to.eql([])
    it 'should be valid if 12+ chars with mixed case letters, and numbers', ->
      expect(goodpass('abcdefghijK1')).to.eql([])
    it 'should be valid if 16+ chars with mixed case letters', ->
      expect(goodpass('abcdefghijklmnoP')).to.eql([])
    it 'should be valid if 20+ chars', ->
      expect(goodpass('abcdefghijklmnopqrst')).to.eql([])
