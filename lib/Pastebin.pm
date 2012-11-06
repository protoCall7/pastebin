#
#===============================================================================
#
#         FILE: Pastebin.pm
#
#  DESCRIPTION: App::Cmd application class for pastebin.pl
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Peter H. Ezetta (PE), protoCall7@gmail.com
# ORGANIZATION: ---
#      VERSION: 0.1
#      CREATED: 11/06/2012 09:36:08
#     REVISION: ---
#===============================================================================

package Pastebin;
use strict;
use warnings;
use version; our $VERSION = qv('0.1');
use App::Cmd::Setup -app;

#-------------------------------------------------------------------------------
#  Using App::Cmd::Setup with the -app flag automatically generates an App::Cmd
#  application class.
#-------------------------------------------------------------------------------

1;

__END__

=pod

=head1 NAME

Pastebin - application class for the pastebin application

=head1 VERSION

This documentation refers to Pastebin version 0.1.

=head1 SYNOPSIS

	use Pastebin;
	Pastebin->run();

=head1 DESCRIPTION

=head1 SUBROUTINES/METHODS

=head1 DIAGNOSTICS

=head1 CONFIGURATION AND ENVIRONMENT

=head1 DEPENDENCIES

=head1 INCOMPATIBILITIES

=head1 BUGS AND LIMITATIONS

=head1 AUTHOR

Peter H. Ezetta (PE), protoCall7@gmail.com

=head1 LICENSE AND COPYRIGHT

=cut
