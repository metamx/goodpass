#goodpass

Looking for a simple, standard method of password validation? Look no further!
The `goodpass` utility enforces Stanford's password validation policy:

- 1-7 character passwords are invalid
- 8-11 character passwords require 1 or more:
  - uppercase letters
  - lowercase letters
  - numbers
  - symbols
- 12-15 character passwords require 1 or more:
  - uppercase letters
  - lowercase letters
  - numbers
- 16-19 character passwords require 1 or more:
  - uppercase letters
  - lowercase letters
- 20+ character passwords have no requirements

Returns an array of all unmet conditions found while validating the password (or empty array if valid password).



Getting Started
---------------

Install `goodpass` using npm
##### Local:
```
$ npm install goodpass
```

#####Use in bash:
```bash
$ node_modules/goodpass/bin/goodpass [max length] <password>
```

##### Global:
```
$ npm install -g goodpass
```

#####Use in bash:
```bash
$ goodpass [max length] <password>
```

###Basic usage in Javascript:
```javascript
goodpass(password, {maxLength})
```

####Example:
```javascript
var goodpass = require('goodpass')
console.log(goodpass('hello123*', {maxLength: 250}));
// --> [ 'Must contain an uppercase letter, if fewer than 20 characters.' ]
```
