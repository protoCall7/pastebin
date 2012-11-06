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

=head2 Display list of commands:
	
	$ ./pastebin.pl commands

=head2 Get help for a command:
	
	$ ./pastebin.pl help <command>

=head2 Display user information and settings:

	$ ./pastebin.pl info --user <username> --pass <password>

=head1 REQUIRED ARGUMENTS

info command:

	--user | -u
	--pass | -p

=head1 DESCRIPTION

=head1 OPTIONS

=head1 DIAGNOSTICS

=head1 EXIT STATUS

=head1 CONFIGURATION

=head1 DEPENDENCIES

=head1 INCOMPATIBILITIES

=head1 BUGS AND LIMITATIONS

=head1 AUTHOR

Peter H. Ezetta (PE), protoCall7@gmail.com

=head1 LICENSE AND COPYRIGHT

(c) 2012 Peter H. Ezetta

This software is licensed under the BSD 3 Clause license.

http://opensource.org/licenses/BSD-3-Clause

=cut
