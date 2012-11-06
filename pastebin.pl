#!/usr/bin/perl 
#===============================================================================
#
#         FILE: pastebin.pl
#
#        USAGE: ./pastebin.pl
#
#  DESCRIPTION: A CLI interface to pastebin.com
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Peter H. Ezetta (PE), protoCall7@gmail.com
# ORGANIZATION:
#      VERSION: 0.1
#      CREATED: 11/06/2012 09:35:41
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use version; our $VERSION = qv('0.1');
use Pastebin;

#-------------------------------------------------------------------------------
#  Dispatch our application class via the run method.
#-------------------------------------------------------------------------------
Pastebin->run;

__END__

=pod

=head1 NAME

pastebin.pl - A CLI Interface to pastebin.com

=head1 VERSION

This documentation refers to pastebin.pl version 0.1

=head1 USAGE

Display list of commands:
	
	$ ./pastebin.pl commands

Get help for a command:
	
	$ ./pastebin.pl help <command>

Display user information and settings:

	$ ./pastebin.pl info --user <username> --pass <password>

=head1 REQUIRED ARGUMENTS

info command:

	--user | -u
	--pass | -p

=cut
