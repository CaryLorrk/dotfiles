export CPPFLAGS="-O2 -Wall -Wextra -pedantic -fdiagnostics-color=auto -Wfloat-equal -Wundef -Wshadow -Wpointer-arith -Wcast-align -Wcast-qual -Wwrite-strings -Wformat=2 -Winit-self -Wlogical-op -Wunreachable-code -Wredundant-decls -Wswitch-default -Wswitch-enum -Wconversion -Wsign-conversion -Wstrict-overflow=5 -Wdisabled-optimization"
export CFLAGS="-std=c11"
export CXXFLAGS="-std=c++11 -Wctor-dtor-privacy -Wnoexcept -Wold-style-cast -Woverloaded-virtual -Wsign-promo -Wstrict-null-sentinel -Weffc++"

alias gcc="gcc $CPPFLAGS $CFLAGS"
alias g++="g++ $CPPFLAGS $CXXFLAGS"
