requidir
========

you can require all modules in a specified directory.

How to Install
--------------

```sh
npm install requidir
```

Usage Example
--------------

If you have a following directory structure,

    .
    ├── app.js
    └── mydir
        ├── bar.js
        └── foo.js

and you want to require bar.js and foo.js from app.js, then you can write your
code like below with ``requidir``.

```javascript
// app.js

var requidir = require('requidir');
var mydir = requidir('./mydir');

expect(mydir.foo).toBeDefined();
expect(mydir.bar).toBeDefined();
```

``requidir`` can resolve relative path based on caller's file.

API
---

``requidir(dir, callback)``

- dir: String

  directory which contains modules to require.

- callback: (Object) -> Object

  callback which is applied with each module (first argument) in the directory.

License
-------

The MIT License (MIT)

Copyright (c) 2014 daylilyfield

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
