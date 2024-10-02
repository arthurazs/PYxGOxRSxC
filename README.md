# PYxGOxRSxC

A simple (bad) fibonacci algorithm was implemented in Python, Go, Rust and C.

The goal here is to compare the performance of all languages while compiled with some optimization flags, such as:
- Go `-ldflags "-s -w"`
- Rust `-C debuginfo=0 -C opt-level=3`
- C `-O3`

See the [Makefile](Makefile) for more information.

## Benchmark

Ubuntu 24.04, i5-9300H CPU, 8 GB RAM.

table

| Language | Time | Version |
| --- | --- | --- |
| Python | 4.14 s | 3.12.3 |
| Go | 117.80 ms | go1.23.0 |
| Rust | 73.05 ms | 1.80.1 |
| C | 43.33 ms | 13.2.0 |

```bash
$ cat /proc/meminfo | grep MemTotal
MemTotal:        7962968 kB

$ cat /proc/cpuinfo | grep name
model name      : Intel(R) Core(TM) i5-9300H CPU @ 2.40GHz
model name      : Intel(R) Core(TM) i5-9300H CPU @ 2.40GHz
model name      : Intel(R) Core(TM) i5-9300H CPU @ 2.40GHz
model name      : Intel(R) Core(TM) i5-9300H CPU @ 2.40GHz
model name      : Intel(R) Core(TM) i5-9300H CPU @ 2.40GHz
model name      : Intel(R) Core(TM) i5-9300H CPU @ 2.40GHz
model name      : Intel(R) Core(TM) i5-9300H CPU @ 2.40GHz
model name      : Intel(R) Core(TM) i5-9300H CPU @ 2.40GHz

$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 24.04.1 LTS
Release:        24.04
Codename:       noble

$ uname -a
Linux nitro5 6.8.0-45-generic #45-Ubuntu SMP PREEMPT_DYNAMIC Fri Aug 30 12:02:04 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux

$  python3 -V
Python 3.12.3

$ go version
go version go1.23.0 linux/amd64

$ rustc -V
rustc 1.80.1 (3f5fd8dd4 2024-08-06)

$ gcc -v
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/libexec/gcc/x86_64-linux-gnu/13/lto-wrapper
OFFLOAD_TARGET_NAMES=nvptx-none:amdgcn-amdhsa
OFFLOAD_TARGET_DEFAULT=1
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Ubuntu 13.2.0-23ubuntu4' --with-bugurl=file:///usr/share/doc/gcc-13/README.Bugs --enable-languages=c,ada,c++,go,d,fortran,objc,obj-c++,m2 --prefix=/usr --with-gcc-major-version-only --program-suffix=-13 --program-prefix=x86_64-linux-gnu- --enable-shared --enable-linker-build-id --libexecdir=/usr/libexec --without-included-gettext --enable-threads=posix --libdir=/usr/lib --enable-nls --enable-clocale=gnu --enable-libstdcxx-debug --enable-libstdcxx-time=yes --with-default-libstdcxx-abi=new --enable-libstdcxx-backtrace --enable-gnu-unique-object --disable-vtable-verify --enable-plugin --enable-default-pie --with-system-zlib --enable-libphobos-checking=release --with-target-system-zlib=auto --enable-objc-gc=auto --enable-multiarch --disable-werror --enable-cet --with-arch-32=i686 --with-abi=m64 --with-multilib-list=m32,m64,mx32 --enable-multilib --with-tune=generic --enable-offload-targets=nvptx-none=/build/gcc-13-uJ7kn6/gcc-13-13.2.0/debian/tmp-nvptx/usr,amdgcn-amdhsa=/build/gcc-13-uJ7kn6/gcc-13-13.2.0/debian/tmp-gcn/usr --enable-offload-defaulted --without-cuda-driver --enable-checking=release --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu
Thread model: posix
Supported LTO compression algorithms: zlib zstd
gcc version 13.2.0 (Ubuntu 13.2.0-23ubuntu4)

$ make all

time python3 src/python.py
24157817
True

________________________________________________________
Executed in    4.14 secs    fish           external
   usr time    4.12 secs  317.00 micros    4.12 secs
   sys time    0.01 secs  124.00 micros    0.01 secs

go build -o target/go.out -ldflags "-s -w" src/go.go
time target/go.out
24157817
true

________________________________________________________
Executed in  117.80 millis    fish           external
   usr time  118.23 millis  145.00 micros  118.08 millis
   sys time    0.04 millis   36.00 micros    0.00 millis

rustc -o target/rust.out -C debuginfo=0 -C opt-level=3 src/rust.rs
time target/rust.out
24157817
true

________________________________________________________
Executed in   73.05 millis    fish           external
   usr time   71.83 millis  272.00 micros   71.56 millis
   sys time    1.07 millis   68.00 micros    1.01 millis

gcc -o target/c.out -O3 src/c.c
time target/c.out
24157817
true

________________________________________________________
Executed in   43.33 millis    fish           external
   usr time   43.18 millis  154.00 micros   43.03 millis
   sys time    0.04 millis   39.00 micros    0.00 millis
```
