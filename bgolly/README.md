# bgolly

# NOTE!!! Only on Linux systems. (only makefile-gtk is configured)
To build bgolly:

sudo apt-get install libwxgtk3.0-dev

cd gui-wx

make -f makefile-gtk bgolly

# bgolly usage:

## with stdin and stdout
./bgolly -o stdout stdin

## with fitness function
./bgolly -m {maxgen} -F {function} -o stdout stdin

note: maxgen defaults to 0 if unspecified
