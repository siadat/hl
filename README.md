hl -- highlighter
=================

Installation
------------
```bash
$ ln -s hl.pl ~/bin/hl
```

Usage
-----

```bash
$ hl -e PATTERN -l 10 FILE FILE...
$ cat FILE | hl -e PATTERN
$ cat FILE | hl -l 1,2,10-20 -e PATTERN
$ ls -lash | hl -e '-([\w-]{2}x){3}' -l 2-4
```
