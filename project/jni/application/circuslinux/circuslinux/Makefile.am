# Makefile.am for circuslinux

# by S.Vikram 
# upender@vsnl.com
# May 28, 2000

# Original Makefile
# by Bill Kendrick
# bill@newbreedsoftware.com
# http://www.newbreedsoftware.com/
# December 11, 1999 - April 11, 2000


PACKAGE = @PACKAGE@
VERSION = @VERSION@

# User-definable stuff:
CC=@CC@
DATA_PREFIX=$(pkgdatadir)/data/
JOY=@JOY@
SHARED_SCOREFILE=@SHARED_SCOREFILE@
TARGET_DEF=@TARGET_DEF@


CFLAGS  = @CFLAGS@ -Wall -O2 -DDATA_PREFIX=\"$(DATA_PREFIX)\" \
	  -D$(TARGET_DEF) -DJOY_$(JOY) -DSHARED_SCOREFILE_$(SHARED_SCOREFILE)
LIBS    = @LIBS@ 


bin_PROGRAMS = circuslinux

circuslinux_SOURCES = circuslinux.c
circuslinux_CFLAGS  = CFLAGS
circuslinux_LIBS    = LIBS

docdir = $(prefix)/share/doc/$(PACKAGE)-$(VERSION)

doc_DATA = AUTHORS.txt \
	   COPYING.txt \
	   INSTALL.txt \
           CHANGES.txt \
	   FAQ.txt \
	   README.txt \
	   README-SDL.txt \
	   TODO.txt

# Other files to be in source build
EXTRA_DIST = autogen.sh \
	   AUTHORS.txt \
	   COPYING.txt \
	   INSTALL.txt \
           CHANGES.txt \
	   FAQ.txt \
	   README.txt \
	   Makefile-win32 \
	   README-SDL.txt \
	   TODO.txt

SUBDIRS = data


uninstall-local:
	rm -rf $(prefix)/share/doc/$(PACKAGE)-$(VERSION)

# Main executable:
#circuslinux:	circuslinux.o
#	$(CC) circuslinux.o $(LIBS) -o circuslinux

#circuslinux.o:	circuslinux.c
#	$(CC) -c circuslinux.c $(CFLAGS)

clean:
	-rm -f circuslinux
	-rm -f *.o *~


