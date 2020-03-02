#!/bin/bash

cd fips
make clean
./config fips no-ec2m no-ssl2 no-ssl3 no-weak-ssl-ciphers -O3 -Ofast -march=native
make depend -j$(nproc)
make -j$(nproc)
#make install

cd ../
make clean
./config fips no-ec2m no-ssl2 no-ssl3 no-weak-ssl-ciphers -O3 -Ofast -march=native --prefix=/usr --openssldir=/usr shared
make depend -j$(nproc)
make -j$(nproc)
#make install
