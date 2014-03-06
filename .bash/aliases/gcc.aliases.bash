CC=gcc
CXX=g++
if type "colorgcc" > /dev/null; then
    CC="colorgcc"
    CXX="colorgcc"
fi
alias gcc="$CC -Wall -Wextra -pedantic -Wshadow -Wpointer-arith -Wcast-qual -Wformat=2"
alias g++="$CXX  -Wall -Wextra -pedantic -Wshadow -Wpointer-arith -Wcast-qual -Wformat=2"
alias cc=$CC
alias c++=$CXX
