#goodpass

The "goodpass" utility enforces Stanford's password validation policy.

Returns an array of all errors yielded while validating the password (or empty array if valid password).

###Use in bash:
```bash
$ goodpass [max length] <password>
```

###Use is Javascript

```javascript
	goodpass(password, {maxLength})
```

####Example
```javascript
	console.log(goodpass('hello123*', {maxLength: 250}));
	// --> [ 'Must contain an uppercase letter, if fewer than 20 characters.' ]
```
