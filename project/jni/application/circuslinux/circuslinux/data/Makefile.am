# Makefile for installing and uninstalling data files

SHELL=@SHELL@


install:
	$(SHELL) ./../mkinstalldirs $(pkgdatadir)
	$(SHELL) ./../mkinstalldirs $(pkgdatadir)/data
	cp -r images music sounds $(pkgdatadir)/data/
	chmod -R 755 $(pkgdatadir)

# Directories in EXTRA_DIST doen't work?
dist-hook:
	cp -r -p images $(distdir)
	cp -r -p music  $(distdir)
	cp -r -p sounds  $(distdir)

uninstall:
	@echo "Removing $(pkgdatadir) ..."
	rm -rf $(pkgdatadir)
