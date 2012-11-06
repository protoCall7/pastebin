#!/usr/bin/perl 
#===============================================================================
#
#         FILE: Makefile.pl
#
#        USAGE: ./Makefile.pl
#
#  DESCRIPTION: ExtUtils::MakeMaker Makefile
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Peter H. Ezetta (PE), protoCall7@gmail.com
# ORGANIZATION:
#      VERSION: 0.1
#      CREATED: 11/06/2012 12:50:48
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use version; our $VERSION = qv('0.1');
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'Pastebin',
    VERSION_FROM => 'Pastebin.pm',
);
