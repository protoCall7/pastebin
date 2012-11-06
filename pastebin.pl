#!/usr/bin/perl 
#===============================================================================
#
#         FILE: pastebin.pl
#
#        USAGE: ./pastebin.pl
#
#  DESCRIPTION:
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Peter H. Ezetta (PE), peter.ezetta@zonarsystems.com
# ORGANIZATION:
#      VERSION: 1.0
#      CREATED: 11/06/2012 09:35:41
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use version; our $VERSION = qv('0.1');
use Pastebin;

Pastebin->run;

__END__

=pod

=head1 NAME
pastebin.pl - A CLI Interface to pastebin.com

=cut
