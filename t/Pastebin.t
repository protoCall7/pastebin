#
#===============================================================================
#
#         FILE: Pastebin.t
#
#  DESCRIPTION:
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Peter H. Ezetta (PE), peter.ezetta@zonarsystems.com
# ORGANIZATION:
#      VERSION: 1.0
#      CREATED: 11/06/2012 14:23:12
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

use Test::More tests => 1;    # last test to print
use App::Cmd::Tester;
use Data::Printer;
use Pastebin;

my $result = test_app( Pastebin => [qw( )] );
p $result;
