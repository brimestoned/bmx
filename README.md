<div>
  
<div><div class="markdown_content"><h2 id="overview">Overview</h2>
<p>bmx is a library and set of utilities to read and write broadcasting media files. It primarily supports the MXF file format.</p>
<p>bmx is made up of 3 libraries:</p>
<ul>
<li>libMXF - low-level MXF library written in C</li>
<li>libMXF++ - C++ wrapper for libMXF, providing simpler and more manageable processing of header metadata</li>
<li>bmx - C++ classes and utilities to read and write various flavours of MXF and WAVE</li>
</ul>
<p>bmx contains these applications and tools:</p>
<ul>
<li>bmxtranswrap - re-wrap from one format to another</li>
<li>mxf2raw - display MXF file metadata, extract raw essence, calculate MD5 etc.</li>
<li>raw2bmx - wrap raw essence in various output formats</li>
<li>h264dump - text dump for raw h.264 bitstreams</li>
<li>movdump - text dump for Quicktime files</li>
<li>MXFDump - <a class="" href="http://sourceforge.net/projects/aaf/">AAF SDK</a> utility to extract a detailed text dump of MXF files</li>
</ul>
<p>The following input and output formats are supported:</p>
<ul>
<li><a class="" href="http://www.amwa.tv/projects/AS-02.shtml" rel="nofollow">AMWA AS-02</a> 'MXF Versioning'</li>
<li><a class="" href="http://www.amwa.tv/projects/AS-11.shtml" rel="nofollow">AMWA AS-11</a> 'MXF for Contribution'</li>
<li>Avid MXF OP-Atom</li>
<li>MXF D-10 (MPEG IMX)</li>
<li>MXF OP-1A</li>
<li>WAVE</li>
<li>Raw essence</li>
</ul>
<p>The following essence formats are supported:</p>
<ul>
<li>AVC-Intra 50/100</li>
<li>D-10 30/40/50</li>
<li>DV 25/50/100</li>
<li>Avid MJPEG</li>
<li>MPEG-2 Long GOP 422P@HL, MP@HL (1920 and 1440) and MP@H14</li>
<li>Uncompressed UYVY / v210 / Avid 10-bit / Avid Alpha</li>
<li>VC-3 (Avid DNxHD)</li>
<li>WAVE PCM</li>
</ul>
<p>The libraries have been built and tested on the following platforms:</p>
<ul>
<li>OpenSUSE 12.1, 64-bit, gcc 4.6.2</li>
<li>Ubuntu 12.04, 64-bit, gcc 4.6.3</li>
<li>Fedora 17, 64-bit, gcc 4.7.0</li>
<li>Mac OS X 10.6.8, 64-bit, gcc 4.2.1</li>
<li>Windows XP SP3, Microsoft Visual C++ 2005 Express Edition</li>
</ul>
<h2 id="linux-and-mac-os-x-build">Linux and Mac OS X Build</h2>
<p>The build requires the usual C/C++ build utilities such as gcc, make, etc. The <a class="" href="http://www.freedesktop.org/wiki/Software/pkg-config" rel="nofollow">pkg-config</a> utility is used to get the compiler flags for dependency libraries.</p>
<p>The following external libraries are required (the OpenSUSE package names are shown in brackets):</p>
<ul>
<li>libuuid (libuuid-devel)</li>
<li><a class="" href="http://uriparser.sourceforge.net/">uriparser</a> &gt;= v0.7.2 (liburiparser-devel)</li>
</ul>
<p><a class="" href="http://mxcl.github.com/homebrew/" rel="nofollow">Homebrew</a> can be used to on Mac OS X to install git, pkg-config and uriparser.</p>
<p>Using the latest code from the git repositories is recommended. Alternatively, <a class="" href="https://sourceforge.net/projects/bmxlib/files/">download</a> the latest release or snapshot.</p>
<p>1) libMXF</p>
<blockquote>
<p>cd libMXF<br>
./configure --disable-examples<br>
make<br>
make check<br>
sudo make install<br>
sudo /sbin/ldconfig #osx use "sudo update_dyld_shared_cache"</p>
</blockquote>
<p>2) libMXF++</p>
<blockquote>
<p>cd libMXF++<br>
./configure --disable-examples<br>
make<br>
make check<br>
sudo make install<br>
sudo /sbin/ldconfig #osx use "sudo update_dyld_shared_cache"</p>
</blockquote>
<p>3) bmx</p>
<blockquote>
<p>cd bmx<br>
./configure<br>
make<br>
make check<br>
sudo make install<br>
sudo /sbin/ldconfig #osx use "sudo update_dyld_shared_cache"</p>
</blockquote>
<p><em>Note: run ./autogen.sh first when using the code from the git repositories for the first time. On Mac OS X the pkg-config m4 files may be installed in a location that is not in the search path of aclocal. To add it to the search path edit or create /usr/share/aclocal/dirlist and add a line to the location of the pkg-config m4 files, e.g. '/usr/local/share/aclocal'</em></p>
<p><em>Note: the '--disable-examples' configure option can be used to avoid building and installing example applications that have been replaced by code in bmx.</em></p>
<p><em>Note: pkg-config on Fedora and Mac OS X may not include /usr/local/lib/pkgconfig in the search path. This results in a failure in the libMXF++ and bmx configure steps to find the libMXF and libMXF++ pkg-config files. In that case the pkg-config environment variable can be set as part of the configure command, ./configure PKG_CONFIG_PATH=/usr/local/lib/pkgconfig ...</em></p>
<p><em>Note: the sudo /sbin/ldconfig line ensures that the runtime linker cache is updated and avoids the library link error </em>...error while loading shared libraries...*</p>
<h2 id="windows-build">Windows Build</h2>
<p>Microsoft Visual C++ 2005 solution and project files are provided in the msvc_build/vs8 directories in the source trees.</p>
<p>The bmx/msvc_build/vs8/bmx.sln solution file includes all the necessary project files to compile the bmx library and applications. The solution files in the libMXF and libMXF++ source trees also include project files for legacy applications such as writeavidmxf.</p>
<p>The bmx library depends on the <a class="" href="http://uriparser.sourceforge.net/">uriparser</a> library. Download the latest version (&gt;= v0.7.2) from <a class="" href="https://sourceforge.net/projects/uriparser/files/">here</a>, unzip and rename the directory to uriparser/</p>
<p>The project files assume the following directories are present: libMXF/, libMXF++/, bmx/ and uriparser/.</p>
<p>The project files depend on a header file (mxf_scm_version.h, mxfpp_scm_version.h and bmx_scm_version.h) to provide the most recent git commit identifier. This file is generated automatically using the gen_scm_version.sh script on Linux and is included in the source distribution package. If you are using the source code directly from the git repository then you are likely missing this file and you need to create it manually.</p>
<h2 id="license">License</h2>
<p>The libMXF, libMXF++ and bmx libraries are provided under the <a class="" href="http://www.opensource.org/licenses/BSD-3-Clause" rel="nofollow">BSD 3-clause<br>
license</a>. See the COPYING file provided with each library for more details.</p></div></div>

  <div id="create_wiki_page_holder" title="Create New Page" style="display:none">
    <form>
        <label class="grid-2">Name</label>
        <div class="grid-7"><input type="text" name="name" tabindex="6"></div>
    </form>
  </div>

                    </div>
