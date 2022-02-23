---
title: dblatex Homebrew formula
season: summer
toc: false
category: IT
tags: IT
---
#### Background
Homebrew has no formula to install dblatex, which is one of the dependencies for MTF Mapper.

The homebrew site [^2] describes a generic workflow to create formula. I used the steps in [^1].

#### Steps
<br>

1. Create Homebrew formula for dblatex. Save the text below as ~/Documents/dblatex.rb
```md
# source: https://gist.github.com/phracker/70c29891f38494675170

require 'formula'

# BEFORE INSTALLING THIS FORMULA:
# 1.) Install MacTex or BasicTex from https://www.tug.org/mactex/

# well, why not use brew install --cask basictex?

# 2.) Make yourself the owner of the tex installation directory:
#     $ sudo chown -R "$(id -un):$(id -gn)" /usr/local/texlive
# 3.) Update tlmgr and install required packages
#     $ tlmgr update --self
#     $ tlmgr install appendix changebar footmisc multirow overpic stmaryrd subfigure titlesec wasysym

class Dblatex < Formula
#  env :userpaths
#  url 'http://downloads.sourceforge.net/project/dblatex/dblatex/dblatex-0.3.7/dblatex-0.3.7.tar.bz2'
#  homepage 'http://dblatex.sourceforge.net'
#  sha256 '59ce3fdfd4d6cf44beb8705d9267b7be7cb32d4f826834c861c5b7016c7e722e'

# replace v0.3.7 by 0.3.10
# source: https://gist.github.com/jj1bdx/cd021cc7883300162de7  
  env :userpaths
  url 'http://downloads.sourceforge.net/project/dblatex/dblatex/dblatex-0.3.10/dblatex-0.3.10.tar.bz2'
  homepage 'http://dblatex.sourceforge.net'
  sha256 '6fd696b740e0044ae1caf843d225d98c01b6ed916550384544e7e31c0c6a2cfa'
  
  def install
    system "python", "setup.py", "install", "--prefix=#{prefix}", "--install-scripts=#{bin}"
  end
  
end
```
<br>

```rb
# mojave version: dblatex 3.10 installed with (Mojave) python 2.7.10

require 'formula'

class Dblatex < Formula
  env :userpaths
  url 'http://downloads.sourceforge.net/project/dblatex/dblatex/dblatex-0.3.10/dblatex-0.3.10.tar.bz2'
  homepage 'http://dblatex.sourceforge.net'
  sha256 '6fd696b740e0044ae1caf843d225d98c01b6ed916550384544e7e31c0c6a2cfa'
 
  depends-on "cmake" => :build
  depends-on "imagemagick"
  depends-on "docbook"
  depends-on "docbook-xsl"

  def install
    system "python", "setup.py", "install", "--prefix=#{prefix}", "--install-scripts=#{bin}"
  end
  
end

```
<br>

2. Use the formula to run a local build from source:
```sh
$ brew install --build-from-source ~/Documents/dblatex.rb
```

#### Result 

```sh
==> **Downloading http://downloads.sourceforge.net/project/dblatex/dblatex/dblatex-0.3.10/dblatex-0.3.10.tar.bz2**
==> **Downloading from https://versaweb.dl.sourceforge.net/project/dblatex/dblatex/dblatex-0.3.10/dblatex-0.3.10.tar.bz2**
######################################################################## 100.0%
==> **python setup.py install --prefix=/usr/local/Cellar/dblatex/0.3.10 --install-scripts=/usr/local/Cellar/dblatex/0.3.10/bin**
🍺 /usr/local/Cellar/dblatex/0.3.10: 701 files, 7.6MB, built in 8 seconds
```
<br>

** References **


[^1]: Creating Homebrew Formulae. Kazoo It! Published November 1, 2018. Accessed January 16, 2021.[ ](https://kazoo.ga/create-homebrew-formulae/)
[^2]: Formula Cookbook. Homebrew Documentation. Accessed January 16, 2021.[ ](https://docs.brew.sh/Formula-Cookbook)