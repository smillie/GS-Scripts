# Makefile for GeekSoc LDAP utilities
#
# Copyright (c) 2011 Andrew Smillie <asmillie@geeksoc.org>


DESTDIR =
PREFIX = /usr/local

# Identity
SHELL= /bin/sh
NAME = ldapscripts
#SUFFIX = -devel

# Default installation paths
SBINDIR = $(PREFIX)/sbin
MANDIR = $(PREFIX)/man
ETCDIR = $(PREFIX)/etc/$(NAME)
LIBDIR = $(PREFIX)/lib/$(NAME)

install: install-adduser install-listuser

install-adduser: 
	@install -m 750 "gsadduser" "$(DESTDIR)$(SBINDIR)/gsadduser"
	@install -m 640 "gsuser.template" "$(DESTDIR)$(ETCDIR)/gsuser.template"
	@install -m 640 "gsruntime" "$(DESTDIR)$(ETCDIR)/gsruntime"

install-listuser:
	@install -m 755 "gslistusers" "$(DESTDIR)$(SBINDIR)/gslistusers"
	@install -m 755 "gsparseldif" "$(DESTDIR)$(SBINDIR)/gsparseldif"

uninstall:
	@rm -rf "$(DESTDIR)$(SBINDIR)/gsadduser" "$(DESTDIR)$(ETCDIR)/gsuser.template" "$(DESTDIR)$(ETCDIR)/gsruntime"
	@rm -rf "$(DESTDIR)$(SBINDIR)/gslistusers" "$(DESTDIR)$(SBINDIR)/gsparseldif"

