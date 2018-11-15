#!/usr/bin/env bash
set -e
set -o pipefail

make boreal
make test

echo "test.au"
./boreal test/valid/test.au --output=test/valid/test.c --entrypoint=austral-user:test
gcc test/valid/test.c -o test/valid/test.bin
./test/valid/test.bin

echo "fib.au"
./boreal test/valid/fib.au --output=test/valid/fib.c --entrypoint=austral-user:main
gcc test/valid/fib.c -o test/valid/fib.bin
./test/valid/fib.bin

echo "tuple.au"
./boreal test/valid/tuple.au --output=test/valid/tuple.c --entrypoint=austral-user:main
gcc test/valid/tuple.c -o test/valid/tuple.bin
./test/valid/tuple.bin

echo "class.au"
#./boreal test/valid/class.au --output=test/valid/class.c
# clang++ -shared -fPIC -std=c++11 test/valid/class.cpp

# echo "string.au"
# ./boreal test/valid/string.au --output=test/valid/string.cpp
# clang++ -shared -fPIC -std=c++11 test/valid/string.cpp

# echo "hello-world.au"
# ./boreal test/valid/hello-world.au --output=test/valid/hello-world.cpp
# clang++ -shared -fPIC -std=c++11 test/valid/hello-world.cpp

# echo "generic.au"
# ./boreal test/valid/generic.au --output=test/valid/generic.cpp --entrypoint=austral-user:main
# clang++ -std=c++11 test/valid/generic.cpp -o test/valid/generic.bin
# ./test/valid/generic.bin

echo "size-of.au"
./boreal test/valid/size-of.au --output=test/valid/size-of.c
gcc -c test/valid/size-of.c -o test/valid/size-of.bin

# echo "cffi.au"
# ./boreal test/valid/cffi.au --output=test/valid/cffi.cpp --entrypoint=cffi-test:main
# clang++ -std=c++11 test/valid/cffi.cpp -o test/valid/cffi.bin
# ./test/valid/cffi.bin

# echo "compare.au"
# ./boreal test/valid/compare.au --output=test/valid/compare.cpp --entrypoint=austral-user:main
# clang++ -std=c++11 test/valid/compare.cpp -o test/valid/compare.bin
# ./test/valid/compare.bin

# echo "defdisjunction.au"
# ./boreal test/valid/defdisjunction.au --output=test/valid/defdisjunction.cpp
# clang++ -shared -fPIC -std=c++11 test/valid/defdisjunction.cpp

echo "bind.au"
./boreal test/valid/bind.au --output=test/valid/bind.c --entrypoint=austral-user:main
gcc test/valid/bind.c -o test/valid/bind.bin
./test/valid/bind.bin

# echo "case.au"
# ./boreal test/valid/case.au --output=test/valid/case.cpp --entrypoint=austral-user:main
# clang++ -std=c++11 test/valid/case.cpp -o test/valid/case.bin
# ./test/valid/case.bin

# echo "sqlite3.au"
# ./boreal test/valid/sqlite3.au --output=test/valid/sqlite3.cpp --entrypoint=sqlite3-test:main
#clang++ -std=c++11 test/valid/sqlite3.cpp -o test/valid/sqlite3.bin
#./test/valid/sqlite3.bin
