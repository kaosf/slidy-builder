# Slidy HTML Builder

Version 1.1.0

## Example

http://kaosf.github.io/slidy-example

## Prerequisites

* GHC
* Cabal
* Pandoc

### Example on Ubuntu

```sh
sudo apt-get install haskell-platform
cabal update
cabal install cabal-install
export PATH=$HOME/.cabal/bin:$PATH
cabal install pandoc
```

If you fail to install `cabal-install`, try the following command to clean up.

```sh
rm -rf ~/.cabal ~/.ghc
```

### Example on CentOS

```sh
```

TODO: Write

### Example on Arch

```sh
sudo pacman -S pandoc
```

## Installation

```sh
./configure
# or
# ./configure --prefix=$HOME/local

sudo make install
# or
# make install
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

```sh
slidybuild --http < input.md > index.html
```

You can keep `slidy.css` and `slidy.js` URLs *http* with `--http` option.

## References

* https://github.com/igrep/igreque.info/blob/b880fbf9ce0443f4c756a9843dc065fa7e67ac6f/main.hs#L64-L69
* https://gist.github.com/kaosf/860356ad729221f8729a
* https://www.mathjax.org/
* http://docs.mathjax.org/en/latest/start.html
* http://pandoc.org/demos.html
* https://twitter.com/ggkuron/status/625329701066665984

## License

[MIT](http://opensource.org/licenses/MIT)

Copyright (C) 2015-2017 ka
