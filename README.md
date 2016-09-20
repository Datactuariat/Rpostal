# Rpostal
R package (wrap up) to libpostal (https://github.com/openvenues/libpostal) for fast international address parsing/normalization

Usage
-----

<img align="center" src="http://www.datactuariat.fr/Rpostal2.gif" />



```R
# install from github
devtools::install_github("datactuariat/Rpostal")
library(Rpostal)

# Postal Expand
postal_expand("Quatre vignt douze Ave des Champs-Élysées")


# Postal Parse
postal_parse("Quatre vignt douze Ave des Champs-Élysées")

```

Installation
------------

Before using the Rpostal, you must install the libpostal C library. Make sure you have the following prerequisites:

**On Linux (Ubuntu)**
```
sudo apt-get install libsnappy-dev autoconf automake libtool python-dev pkg-config
```

**On Mac OSX**
```
sudo brew install snappy autoconf automake libtool pkg-config
```

**Installing libpostal**

```
git clone https://github.com/openvenues/libpostal
cd libpostal
./bootstrap.sh
./configure
# or : ./configure --datadir=[...some dir with a few GB of space...] see https://github.com/Datactuariat/Rpostal/issues/1#issuecomment-248175897
make
sudo make install

# On Linux it's probably a good idea to run
sudo ldconfig
```

To use Rpackage, make sure to use the `libpostal_path` parameter :

```R
Rpostal::postal_parse("Adress",libpostal_path="/path/to/libpostal/src")
Rpostal::postal_expand("Adress",libpostal_path="/path/to/libpostal/src")
```
