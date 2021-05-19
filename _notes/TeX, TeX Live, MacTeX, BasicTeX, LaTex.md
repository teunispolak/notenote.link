---
title: TeX, TeX Live, MacTeX, BasicTeX, and LaTex
season: summer
toc: false
category: IT
tags: IT
---
How does LaTeX compare to the various TeX packages around? I've cut and pasted fragments from Wikipedia to get an overview.

#### TeX
[[Wikipedia: [TeX](https://en.wikipedia.org/w/index.php?title=TeX&oldid=1000199070)::rmn]]
TeX is a typesetting or formatting system designed by Ronald Knuth and released in 1978. 

TeX was designed with two main goals in mind: to allow anybody to produce high-quality books with minimal effort, and to provide a system that would give exactly the same results on all computers, at any point in time. [^1] 


#### TeX Live
[[Wikipedia: [TeX Live](https://en.wikipedia.org/w/index.php?title=TeX_Live&oldid=998469763)::rmn]]
TeX Live is a cross-platform, free software distribution for the TeX typesetting system that includes major TeX-related programs, macro packages, and fonts. It is the replacement of its no-longer supported counterpart teTeX. It is now the default TeX distribution for several Linux distributions. [^2]

For macOS, TeX Live is distributed via MacPorts. As an alternative route, the MacTeX site describes a TeX Live Unix install script.
[[TeX Live [install script](https://www.tug.org/mactex/mactex-unix-download.html)::rmn]]
Once installed, TeX Live is maintained with tlmgr,[[[tlmgr](https://www.tug.org/texlive/tlmgr.html)::rmn]]
the TeX Live package and configuration manager. It operates completely separate from any regular package manager the OS may provide.


#### MacTeX
MacTeX is a free redistribution of TeX Live. While TeX Live is designed to be cross-platform, MacTeX includes Mac-specific utilities and front-ends such as the editor TeXShop and the bibliography manager BibDesk. 

MacTeX is pre-configured to work out-of-the-box with macOS. It provides defaults for configuration options that, in TeX Live, are left up to the user to allow for its cross-platform compatibility. [^3]

For macOS, MacTeX can be installed directly from download,[](https://tug.org/mactex/mactex-download.html) or via MacPorts or Homebrew.


#### BasicTeX
BasicTeX is a smaller version of MacTeX. It does not contain Ghostscript or the BasicTeX GUI programs and can be used in its stead along with a TeX editor as well.

For macOS, BasicTeX can be installed directly from download, or via MacPorts or Homebrew.


#### LaTeX
LaTeX was originally written in the early 1980s by Leslie Lamport. The current version is LaTeX2e, released in 1994, but updated in 2020.

LaTeX is intended to provide a high-level, descriptive markup language that accesses the power of TeX in an easier way for writers. In essence, TeX handles the layout side, while LaTeX handles the content side for document processing. LaTeX comprises a collection of TeX macros and a program to process LaTeX documents. It provides authors with ready-made commands for formatting and layout requirements such as chapter headings, footnotes, cross-references and bibliographies. [^4]
<br>

** References **

[^1]: TeX. In: _Wikipedia_. ; 2021. Accessed January 22, 2021. Wikipedia: [TeX](https://en.wikipedia.org/w/index.php?title=TeX&oldid=1000199070)

[^2]: TeX Live. In: _Wikipedia_. ; 2021. Accessed January 22, 2021. Wikipedia: [TeX Live](https://en.wikipedia.org/w/index.php?title=TeX_Live&oldid=998469763)

[^3]: MacTeX. In: _Wikipedia_. ; 2020. Accessed January 22, 2021. [](https://en.wikipedia.org/w/index.php?title=MacTeX&oldid=994171736)

[^4]: LaTeX. In: _Wikipedia_. ; 2021. Accessed January 22, 2021. [](https://en.wikipedia.org/w/index.php?title=LaTeX&oldid=998209608)