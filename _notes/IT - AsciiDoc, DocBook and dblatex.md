---
title: AsciiDoc, DocBook and dblatex
season: summer
toc: false
category: IT
tags: IT
---
#### AsciiDoc
AsciiDoc is a human-readable document format, using plain-text mark-up conventions. AsciiDoc documents can be created using any text editor and read “as-is”, or rendered to HTML or any other format supported by a DocBook tool-chain, i.e. PDF, TeX, Unix manpages, e-books, slide presentations, etc. [^1]

** From the Asciidoc homepage ** [^2]
You write an AsciiDoc document the same way you would write a normal text document; there are no markup tags or weird format notations. AsciiDoc files are designed to be viewed, edited and printed directly or translated to other presentation formats using the `asciidoc(1)` command.

The `asciidoc(1)` command translates AsciiDoc files to HTML, XHTML and DocBook markups. DocBook can be post-processed to presentation formats such as HTML, PDF, EPUB, DVI, LaTeX, roff, and Postscript using readily available Open Source tools.

The two most popular open eBook formats are EPUB and PDF. The AsciiDoc `a2x` toolchain wrapper makes it easy to publish EPUB and PDF eBooks with AsciiDoc.

AsciiDoc can be installed with MacPorts or Homebrew.

#### DocBook
DocBook is a semantic markup language for technical documentation. It was originally intended for writing technical documents related to computer hardware and software, but it can be used for any other sort of documentation.

As a semantic language, DocBook enables its users to create document content in a presentation-neutral form that captures the logical structure of the content; that content can then be published in a variety of formats, including HTML, EPUB, PDF, man pages, Web help and HTML Help, without requiring users to make any changes to the source. In other words, when a document is written in DocBook format it becomes easily portable into other formats, rather than needing to be rewritten. [^3]
DocBook files are used to prepare output files in a wide variety of formats. Nearly always, this is accomplished using DocBook XSL stylesheets. These are XSLT stylesheets that transform DocBook documents into a number of formats (HTML, XSL-FO for later conversion into PDF, etc).

Homebrew installs DocBook as a dependency of AsciiDoc.

#### dblatex
DocBook to LaTeX Publishing transforms SGML/XML DocBook documents to DVI, PostScript or PDF by translating them in pure LaTeX as a first process. MathML 2.0 markups are also supported. [^4]

dblatex can be installed via MacPorts.
<br>

** References **

[^1]: AsciiDoc. In: _Wikipedia_. ; 2020. Accessed January 22, 2021. [ ](https://en.wikipedia.org/w/index.php?title=AsciiDoc&oldid=991052781)

[^2]: AsciiDoc Home Page. Accessed January 22, 2021. [https://asciidoc.org/](https://asciidoc.org/)

[^3]: DocBook. In: _Wikipedia_. ; 2020. Accessed January 22, 2021. [https://en.wikipedia.org](https://en.wikipedia.org/w/index.php?title=DocBook&oldid=993274990)

[^4]: DocBook to LaTeX Publishing. SourceForge. Accessed January 23, 2021. [https://sourceforge.net/projects/dblatex/](https://sourceforge.net/projects/dblatex/)