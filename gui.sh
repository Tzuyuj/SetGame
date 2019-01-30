sudo apt install autoconf bison libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev libsdl2-dev libsdl2-image-dev ibsdl2-mixer-dev libsdl2-ttf-dev
wget "https://github.com/simple2d/simple2d/archive/v1.1.0.tar.gz"
tar -xf v1.1.0.tar.gz
cd simple2d-1.1.0
make && sudo make install
gem install ruby2d
cd ..