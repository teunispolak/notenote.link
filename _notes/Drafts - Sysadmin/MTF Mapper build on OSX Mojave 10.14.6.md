


### Background
MTF Mapper does not provide OSX packages. A custom build procedure for 10.13.6 High Sierra and 10.14.6 Mojave is available via the MTF Mapper forum. [^1]  [^2]

My build instruction is different from the example on two aspects. First, it is based on Homebrew as a package manager. Second, it is for macOS Mojave only. 

The reason for using Homebrew is twofold: it is my current package manager and having macPorts and Homebrew installed at the same time is not recommended.

The build instruction is for Mojave (10.14.6) only partly because Homebrew no longer actively supports High Sierra (10.13.6) anymore. Catalina (10.15) on the other hand would require adjusting the build instruction for dblatex and Python.

A slight complication from using Homebrew as the package manager is that we have to create the Homebrew package (formula in Homebrew speak) ourselves.

Note: Homebrew doesn't have a so-called Homebrew core formula for dblatex so I created one myself, using examples on Github. See [[Homebrew create dblatex formula]].

Using the macPorts-based build instruction [^2]  as a starting point, the homebrew version is as follows

```sh

# Instructions for building and installing mtfmapper 0.7.32 on macOS Mojave (10.14.6).


# Prerequisites
# ===========================================================
# Install Homebrew
# Run brew doctor, brew clean(?), brew upgrade and follow the recommendations
# In case you have to ugrade XCode or the XCode command line tools, look here


````

```sh

# Install aciidoc
brew install --formula asciidoc

# Install basictex LaTeX
brew install --cask basictex

# Install LaTeX packages in basictex required by dblatex and mtfmapper
sudo chown -R "$(id -un):$(id -gn)" /usr/local/texlive
tlmgr update --self
tlmgr install collection-fontsextra
tlmgr install collection-latexextra
tlmgr install collection-mathscience
tlmgr install epstopdf
tlmgr install eepic

# Build and install dblatex
brew install --build-from-source --formula ~/Documents/dblatex.rb

# Build and install mtfmapper
brew install --build-from-source --formula ~/Documents/mtfmapper.rb

# Configure automatic launch of dbus, a mtfmapper dependency
brew services start dbus

# start mtf_mapper_gui and adjust path to dcraw, gnuplot, exiv2 in Settings, helpers tab

mtf_mapper_gui
      
Of, netter vanuit the /Applications folder:
mkdir -p "./Applications/mtf_mapper_gui.app/Contents/MacOS"

cp /usr/local/bin/mtf_mapper_gui "/Applications/mtf_mapper_gui.app/Contents/MacOS"

en dan nog even het icon vervangen (open .png uit src/gui in Preview, ctl a, ctl c, dan get info van de app, linksboven ctl v)

````


```sh

Create a Homebrew formula for dblatex (see note ..)
brew install --build-from-source ~/Documents/dblatex.rb   # depends only on cmake

daarmee kan het volgende vervallen:
	# change editor if you don't want to use Vim
	nano ~/.bash_profile
	# add export HOMEBREW_EDITOR="/usr/bin/nano" 
	source ~/.bashrc     (to activate)

	brew create http://downloads.sourceforge.net/project/dblatex/dblatex/dblatex-		     0.3.10/dblatex-0.3.10.tar.bz2
	brew install ...

```


```sh
de dependencies van dblatex volgens macports

Ik denk dat dit het lijstje voor 3.10 is. Versie 3.11 is voor python3 als ik het goed begrijp. En die heb je dan nodig voor Catalina en hoger want t/m Mojave installeert macOS python 2.7 by default.

[ImageMagick]				(https://ports.macports.org/port/ImageMagick/), 
[dejavu-fonts]				(https://ports.macports.org/port/dejavu-fonts/), 
[docbook-xml]				(https://ports.macports.org/port/docbook-xml/), 
[docbook-xsl-nons]			(https://ports.macports.org/port/docbook-xsl-nons/), 
[python27]					(https://ports.macports.org/port/python27/), 
[texlive-latex-extra]		(https://ports.macports.org/port/texlive-latex-extra/), 
[texlive-latex-recommended]	(https://ports.macports.org/port/texlive-latex-recommended/), [texlive-math-science]	  (https://ports.macports.org/port/texlive-math-science/)

#imagemagick is required for image conversion
brew install imagemagick

# Make yourself the owner of the tex installation directory:
#     $ sudo chown -R "$(id -un):$(id -gn)" /usr/local/texlive
# Update tlmgr and install required packages
#     $ tlmgr update --self

# dejavu-fonts is part of one of the optional collections of texlive
tlmgr install collection-fontsextra
	
brew install docbook
brew install docbook-xsl

tlmgr install collection-latexextra
tlmgr install collection-latexrecommended  # probably already installed with basictex, see /usr/local/texlive/2020basic/install-tl.log
tlmgr install collection-mathscience
tlmgr install eepic 						# to solve a "epic.sty not found" error in make

What has been installed with basictex?
cat /usr/local/texlive/2020basic/install-tl.log


```


```sh
# MTF Mapper 0.7.32

# Build notes for MacOS 10.14.6 Mojave, derived from Ubuntu 17.10 build notes

# Works for Mojave
# For Catalina: python3 and dblatex version for python3
# For High Sierra: no formula for opencv, not even for opencv@3 or opencv@2



# Install all the dependencies
# ===========================================================
# Note the new dependencies compared to earlier MTF; with version
# 0.7.32, MTF Mapper now requires qt5-qtcharts and asciidoc.

brew install cmake
brew install opencv 
sudo port install qt5-qtbase  			--> brew install qt

# dbus has the following notes:
# Startup items (named 'dbus-system, dbus-session') have been generated that will aid in starting dbus with launchd.
# They are disabled by default. Execute the following command to start them, and to cause them to launch at startup:
    sudo port load dbus  				--> brew install dbus ; brew services start dbus

sudo port install qt5-qtcharts 														(assumed to be part of qt, already installed)
sudo port install tclap					--> brew install tclap
sudo port install eigen3				--> brew install eigen

# check out the source code from the repository
sudo mkdir -p /usr/local/src
cd /usr/local/src
sudo chown $(whoami) .
svn co svn://svn.code.sf.net/p/mtfmapper/code/trunk mtfmapper-code

# make a build directory for cmake
mkdir mtfmapper
cd mtfmapper

# configure with cmake
cmake ../mtfmapper-code       			-->      brew info qt om QT5Widgets not found error te voorkomen; cmake ../mtfmapper-code -DCMAKE\_PREFIX\_PATH=/usr/local/Cellar/qt/5.15.2

# the actual build
make

# and you are done!
# executables can be found in mtfmapper/bin

# create symbolic links to the executables
sudo mkdir -p /usr/local/bin might already exist)
cd /usr/local/bin
sudo ln -s ../src/mtfmapper/bin/mtf_mapper
sudo ln -s ../src/mtfmapper/bin/mtf_mapper_gui
sudo ln -s ../src/mtfmapper/bin/mtf_generate_rectangle
sudo ln -s ../src/mtfmapper/bin/mtf_generate_test_chart

# you will also need some of the runtime dependencies, 
sudo port install dcraw gnuplot exiv2         don't need luarocks, as suggested by  Homebrew after installing gnuplots
start mtf_mapper_gui and adjust path to dcraw, gnuplot, exiv2 in Settings, helpers tab
```

```

Why the cmake prefix-path? 
=======================================================

CMake Warning at bin/CMakeLists.txt:32 (find\package):
 By not providing "FindQt5Widgets.cmake" in CMAKE\MODULE\PATH this project
 has asked CMake to find a package configuration file provided by
 "Qt5Widgets", but CMake did not find one. 

 Could not find a package configuration file provided by "Qt5Widgets" with
 any of the following names:
  
 Qt5WidgetsConfig.cmake
 qt5widgets-config.cmake
  
 Add the installation prefix of "Qt5Widgets" to CMAKE\PREFIX\PATH or set
 "Qt5Widgets\DIR" to a directory containing one of the above files. If
 "Qt5Widgets" provides a separate development package or SDK, be sure it has
 been installed.
```


<br>

** References **


[^1]: MTF mapper / Discussion / General Discussion: Compiling MTF Mapper on MacOS Mojave. Accessed January 16, 2021. [https://sourceforge.net](https://sourceforge.net/p/mtfmapper/discussion/general/thread/c45b1421ff/?limit=25#693d)

[^2]: mojave_build_notes.txt retrieved from Dropbox via the above forum thread [https://www.dropbox.com](https://www.dropbox.com/report_abuse?ssu=https%3A%2F%2Fwww.dropbox.com%2Fsh%2Fswq7g5wg5tz2ki5%2FAADZ1dXEzbaHLm1fdZJPaIwda%2Fmojave_build_notes.txt%3Fdl%3D0 "Report as issue")
