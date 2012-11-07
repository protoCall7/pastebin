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

my @exe_files = ('bin/pastebin.pl');

WriteMakefile(
    NAME         => 'Pastebin',
    VERSION_FROM => 'lib/Pastebin.pm',
    EXE_FILES    => \@exe_files,
    PREREQ_PM    => {
        "App::Cmd"    => 0,
        "LWP::Curl"   => 0,
		"Test::More"  => 0,
    }
);
