# bmx

Overview
bmx is a library and set of utilities to read and write broadcasting media files. It primarily supports the MXF file format.

bmx is made up of 3 libraries:

libMXF - low-level MXF library written in C
libMXF++ - C++ wrapper for libMXF, providing simpler and more manageable processing of header metadata
bmx - C++ classes and utilities to read and write various flavours of MXF and WAVE
bmx contains these applications and tools:

bmxtranswrap - re-wrap from one format to another
mxf2raw - display MXF file metadata, extract raw essence, calculate MD5 etc.
raw2bmx - wrap raw essence in various output formats
h264dump - text dump for raw h.264 bitstreams
movdump - text dump for Quicktime files
MXFDump - AAF SDK utility to extract a detailed text dump of MXF files
The following input and output formats are supported:

AMWA AS-02 'MXF Versioning'
AMWA AS-11 'MXF for Contribution'
Avid MXF OP-Atom
MXF D-10 (MPEG IMX)
MXF OP-1A
WAVE
Raw essence
The following essence formats are supported:

AVC-Intra 50/100
D-10 30/40/50
DV 25/50/100
Avid MJPEG
MPEG-2 Long GOP 422P@HL, MP@HL (1920 and 1440) and MP@H14
Uncompressed UYVY / v210 / Avid 10-bit / Avid Alpha
VC-3 (Avid DNxHD)
WAVE PCM
The libraries have been built and tested on the following platforms:

OpenSUSE 12.1, 64-bit, gcc 4.6.2
Ubuntu 12.04, 64-bit, gcc 4.6.3
Fedora 17, 64-bit, gcc 4.7.0
Mac OS X 10.6.8, 64-bit, gcc 4.2.1
Windows XP SP3, Microsoft Visual C++ 2005 Express Edition
Linux and Mac OS X Build
The build requires the usual C/C++ build utilities such as gcc, make, etc. The pkg-config utility is used to get the compiler flags for dependency libraries.

The following external libraries are required (the OpenSUSE package names are shown in brackets):

libuuid (libuuid-devel)
uriparser >= v0.7.2 (liburiparser-devel)
Homebrew can be used to on Mac OS X to install git, pkg-config and uriparser.

Using the latest code from the git repositories is recommended. Alternatively, download the latest release or snapshot.

1) libMXF

cd libMXF
./configure --disable-examples
make
make check
sudo make install
sudo /sbin/ldconfig

2) libMXF++

cd libMXF++
./configure --disable-examples
make
make check
sudo make install
sudo /sbin/ldconfig

3) bmx

cd bmx
./configure
make
make check
sudo make install
sudo /sbin/ldconfig

Note: run ./autogen.sh first when using the code from the git repositories for the first time. On Mac OS X the pkg-config m4 files may be installed in a location that is not in the search path of aclocal. To add it to the search path edit or create /usr/share/aclocal/dirlist and add a line to the location of the pkg-config m4 files, e.g. '/usr/local/share/aclocal'

Note: the '--disable-examples' configure option can be used to avoid building and installing example applications that have been replaced by code in bmx.

Note: pkg-config on Fedora and Mac OS X may not include /usr/local/lib/pkgconfig in the search path. This results in a failure in the libMXF++ and bmx configure steps to find the libMXF and libMXF++ pkg-config files. In that case the pkg-config environment variable can be set as part of the configure command, ./configure PKG_CONFIG_PATH=/usr/local/lib/pkgconfig ...

Note: the sudo /sbin/ldconfig line ensures that the runtime linker cache is updated and avoids the library link error ...error while loading shared libraries...*

Windows Build
Microsoft Visual C++ 2005 solution and project files are provided in the msvc_build/vs8 directories in the source trees.

The bmx/msvc_build/vs8/bmx.sln solution file includes all the necessary project files to compile the bmx library and applications. The solution files in the libMXF and libMXF++ source trees also include project files for legacy applications such as writeavidmxf.

The bmx library depends on the uriparser library. Download the latest version (>= v0.7.2) from here, unzip and rename the directory to uriparser/

The project files assume the following directories are present: libMXF/, libMXF++/, bmx/ and uriparser/.

The project files depend on a header file (mxf_scm_version.h, mxfpp_scm_version.h and bmx_scm_version.h) to provide the most recent git commit identifier. This file is generated automatically using the gen_scm_version.sh script on Linux and is included in the source distribution package. If you are using the source code directly from the git repository then you are likely missing this file and you need to create it manually.

License
The libMXF, libMXF++ and bmx libraries are provided under the BSD 3-clause
license. See the COPYING file provided with each library for more details.
