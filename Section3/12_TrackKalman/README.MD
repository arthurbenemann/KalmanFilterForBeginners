How to run this example
=======================
You need to get the "image" package for octave, which contains the necessary image processing librarys. To do it run the following commands (Tested on Ubuntu 13.10):

```
wget ftp://ftp.gnu.org/gnu/octave/octave-3.8.0.tar.bz2
tar -xvf octave-3.8.0.tar.bz2
cd octave-3.8.0
sudo apt-get build-dep octave
./configure
make
sudo make install
octave
```

And inside octave run:
```
pkg install -forge general
pkg install -forge control
pkg install -forge specfun
pkg install -forge signal
pkg install -forge image
pkg load general control specfun signal image
```


