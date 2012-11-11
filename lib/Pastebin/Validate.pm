#
#===============================================================================
#
#         FILE: Validate.pm
#
#  DESCRIPTION: Functions to validate opts against long lists
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Peter H. Ezetta (PE), peter.ezetta@zonarsystems.com
# ORGANIZATION:
#      VERSION: 1.0
#      CREATED: 11/07/2012 21:34:11
#     REVISION: ---
#===============================================================================

package Pastebin::Validate;
use strict;
use warnings;
use version; our $VERSION = qv('0.1');

sub new {
    my $class = shift;
    my $self  = {};
    return bless $self, $class;
}

sub validate_expire {
    my ( $self, $usr_exp ) = @_;

    my @list    = qw ( N 10M 1H 1D 1M );
    my $ret     = 0;

    foreach (@list) {
        if ( $usr_exp eq $_ ) {
            $ret = 1;
        }
    }
    return $ret;
}

1;
