#
#===============================================================================
#
#         FILE: Login.t
#
#  DESCRIPTION:
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Peter H. Ezetta (PE), peter.ezetta@zonarsystems.com
# ORGANIZATION:
#      VERSION: 1.0
#      CREATED: 11/07/2012 01:18:29
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

use Test::More tests => 2;    # last test to print

use_ok('Pastebin::Login');
ok( my $validate = Pastebin::Login->new() );
