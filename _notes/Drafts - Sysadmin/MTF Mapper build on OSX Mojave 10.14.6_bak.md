


### Background
MTF Mapper does not provide OSX packages. A custom build procedure for 10.13.6 High Sierra and 10.14.6 Mojave is available via the MTF Mapper forum. [^1]  [^2]

My build instruction is different from the example on two aspects. First, it is based on Homebrew as a package manager. Second, it is for macOS Mojave only. 

The reason for using Homebrew is twofold: it is my current package manager and having macPorts and Homebrew installed at the same time is not recommended.

The build instruction is for Mojave (10.14.6) only partly because Homebrew no longer actively supports High Sierra (10.13.6) anymore. Catalina (10.15) on the other hand would require adjusting the build instruction for dblatex and Python.

A slight complication from using Homebrew as the package manager is that we have to create the Homebrew package (formula in Homebrew speak) ourselves.

Note: Homebrew doesn't have a so-called Homebrew core formula for dblatex so I created one myself, using examples on Github. See [[Homebrew create dblatex formula]].

Using the macPorts-based build instruction [^2]  as a starting point, the homebrew version is as follows

```sh
# Prerequisites
# ===========================================================
# Install Homebrew
# Run brew doctor, brew upgrade and follow the recommendations

# Check Python
# for python, first look what is installed on your mac: 
which python
/usr/bin/python

python --version
Python 2.7.10 		# probably default installed with High Sierra

python3 --version
Python 3.9.1

brew list python
# quite a list, all folders in /usr/local/Cellar/python@3.9/3.9.1/bin

# So, in this case python2.7 and python3.9 co-exist. No additional action is needed.

# As a sidestep: once dblatex is installed successfully, you might want to make python3 
# the default python version. An instruction is provided 
# 	- [here] (https://docs.python-guide.org/starting/install3/osx/) and
#   - [here] (https://opensource.com/article/19/5/python-3-default-mac)
````

```sh

brew install --formula asciidoc
brew install --cask basictex
brew install --build-from-source --formula ~/Documents/dblatex.rb

sudo chown -R "$(id -un):$(id -gn)" /usr/local/texlive
tlmgr update --self
tlmgr install collection-latexextra
tlmgr install collection-latexrecommended  	# probably already installed with basictex, see /usr/local/texlive/2020basic/install-tl.log
tlmgr install collection-mathscience
tlmgr install eepic 						# to solve a "epic.sty not found" error in make

brew install opencv
brew install qt

brew install dbus
brew services start dbus

brew install tclap
brew install eigen
brew install dcraw
brew install gnuplot
brew install exiv2

# check out the source code from the repository
sudo mkdir -p /usr/local/src
cd /usr/local/src
sudo chown $(whoami) .
svn co svn://svn.code.sf.net/p/mtfmapper/code/trunk mtfmapper-code

# make a build directory for cmake
mkdir mtfmapper
cd mtfmapper

# configure with cmake
# even uitvinden waar qt staat: brew --prefix qt
# $  /usr/local/opt/qt

## 2021 02 07: en nu ineens brew link pkg-config nodig?

cmake ../mtfmapper-code -DCMAKE\_PREFIX\_PATH=/usr/local/Cellar/qt/5.15.2

# the actual build
make  # 2021 02 07: als een speer

# and you are done!
# executables can be found in mtfmapper/bin

# create symbolic links to the executables
sudo mkdir -p /usr/local/bin (might already exist)
cd /usr/local/bin
sudo ln -s ../src/mtfmapper/bin/mtf_mapper
sudo ln -s ../src/mtfmapper/bin/mtf_mapper_gui
sudo ln -s ../src/mtfmapper/bin/mtf_generate_rectangle
sudo ln -s ../src/mtfmapper/bin/mtf_generate_test_chart

# start mtf_mapper_gui and adjust path to dcraw, gnuplot, exiv2 in Settings, helpers tab

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
	
brew install docbook       	ehh, die zit in asciidoc formula
brew install docbook-xsl	ehh, die zit in asciidoc formula

tlmgr install collection-latexextra
tlmgr install collection-latexrecommended  # probably already installed with basictex, see /usr/local/texlive/2020basic/install-tl.log
tlmgr install collection-mathscience
tlmgr install eepic 						# to solve a "epic.sty not found" error in make

What has been installed with basictex?
cat /usr/local/texlive/2020basic/install-tl.log


```


```sh

# Install with homebrew	
	sudo port install asciidoc
	
# Install basictex with homebrew
# Install the basictex packages and other dependencies listed in macport dblatex
# Install via dblatex homebrew formula
	sudo port install cmake
	sudo port install dblatex
	
# Install via mtfmapper homebrew formula
	sudo port install opencv
	sudo port install qt5-qtbase
	sudo port install qt5-qtcharts
	sudo port install tclap
	sudo port install eigen3
	sudo mkdir -p /usr/local/src
	cd /usr/local/src
	sudo chown $(whoami) .
	svn co svn://svn.code.sf.net/p/mtfmapper/code/trunk mtfmapper-code
	mkdir mtfmapper
	cd mtfmapper
	cmake ../mtfmapper-code
	make
	sudo mkdir -p /usr/local/bin
	cd /usr/local/bin
	sudo ln -s ../src/mtfmapper/bin/mtf_mapper
	sudo ln -s ../src/mtfmapper/bin/mtf_mapper_gui
	sudo ln -s ../src/mtfmapper/bin/mtf_generate_rectangle
	sudo ln -s ../src/mtfmapper/bin/mtf_generate_test_chart
	sudo port install dcraw gnuplot exiv2
	
# Use homebrew to launch dbus after installing dbus as a mtmfmapper dependency 
	sudo port load dbus

```



<br>

** References **


[^1]: MTF mapper / Discussion / General Discussion: Compiling MTF Mapper on MacOS Mojave. Accessed January 16, 2021. [https://sourceforge.net](https://sourceforge.net/p/mtfmapper/discussion/general/thread/c45b1421ff/?limit=25#693d)

[^2]: mojave_build_notes.txt retrieved from Dropbox via the above forum thread [https://www.dropbox.com](https://www.dropbox.com/report_abuse?ssu=https%3A%2F%2Fwww.dropbox.com%2Fsh%2Fswq7g5wg5tz2ki5%2FAADZ1dXEzbaHLm1fdZJPaIwda%2Fmojave_build_notes.txt%3Fdl%3D0 "Report as issue")
