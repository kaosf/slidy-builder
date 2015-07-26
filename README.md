# Slidy HTML Builder

Version 1.0.2

## Example

http://kaosf.github.io/slidy-example

## Prerequisites

* GHC
* Cabal
* Pandoc

### Example on Ubuntu

```sh
sudo apt-get install haskell-platform
export PATH=$HOME/.cabal/bin:$PATH
cabal update
cabal install pandoc
```

## Installation

```sh
./configure
# or
# ./configure --prefix=$HOME/local

make install
```

## Usage

```sh
slidybuild < input.md > index.html
```

`index.html` is the destination file.

```sh
slidybuild -l < input.md > index.html
```

In this case, `slidy.css`, `slidy.js` and MathJax files are downloaded once,
and the `index.html` that is generated refers them. So you can check the slides
offline.

## References

* https://github.com/igrep/igreque.info/blob/b880fbf9ce0443f4c756a9843dc065fa7e67ac6f/main.hs#L64-L69
* https://gist.github.com/kaosf/860356ad729221f8729a
* https://www.mathjax.org/
* http://docs.mathjax.org/en/latest/start.html
* http://pandoc.org/demos.html

## License

[MIT](http://opensource.org/licenses/MIT)

Copyright (C) 2015 ka
