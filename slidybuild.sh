#!/bin/bash

if [[ $1 = '-v' || $1 = '--version' ]]; then
  echo 'Slidy Builder version 1.0.1'
  exit 0
fi

if [[ $1 = '-l' ]]; then
  LOCALCHECK=1
else
  LOCALCHECK=
fi

CACHEDIR=$HOME/.slidy-builder

if [ ! -z $LOCALCHECK ]; then
  mkdir -p $CACHEDIR/slidy/{styles,scripts}
  [ -f $CACHEDIR/slidy/styles/slidy.css ] || \
    wget http://www.w3.org/Talks/Tools/Slidy2/styles/slidy.css \
      -O $CACHEDIR/slidy/styles/slidy.css
  [ -f $CACHEDIR/slidy/scripts/slidy.js ] || \
    wget http://www.w3.org/Talks/Tools/Slidy2/scripts/slidy.js \
      -O $CACHEDIR/slidy/scripts/slidy.js

  [ -f $CACHEDIR/2.5.3.tar.gz ] || \
    wget https://github.com/mathjax/MathJax/archive/2.5.3.tar.gz -O $CACHEDIR
  [ -d $CACHEDIR/MathJax-2.5.3 ] || \
    tar xzf $CACHEDIR/2.5.3.tar.gz -C $CACHEDIR
fi

if [ -z $LOCALCHECK ]; then
  $PREFIX/libexec/slidy-builder/pandoc -i -t slidy -s --mathjax \
    | sed 's|//cdn.mathjax.org|https://cdn.mathjax.org|'
  echo '<!-- Pandoc version:'
  $PREFIX/libexec/slidy-builder/pandoc --version \
    | sed 's/^Default user data directory: .*/Default user data directory: <DELETED>/'
  echo '-->'
else
  $PREFIX/libexec/slidy-builder/pandoc -i -t slidy -s --mathjax -V slidy-url="file://${CACHEDIR}/slidy" \
    | sed "s|//cdn.mathjax.org/mathjax/latest|file://${CACHEDIR}/MathJax-2.5.3|"
  echo '<!-- Pandoc version:'
  $PREFIX/libexec/slidy-builder/pandoc --version \
    | sed 's/^Default user data directory: .*/Default user data directory: <DELETED>/'
  echo '-->'
fi
