#
#===============================================================================
#
#         FILE: Validate.t
#
#  DESCRIPTION:
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Peter H. Ezetta (PE), peter.ezetta@zonarsystems.com
# ORGANIZATION:
#      VERSION: 1.0
#      CREATED: 11/07/2012 21:56:22
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

use Test::More tests => 7;    # last test to print

use_ok('Pastebin::Validate');
ok( Pastebin::Validate::validate_expire('N') == 1,   'N is valid' );
ok( Pastebin::Validate::validate_expire('10M') == 1, '10M is valid' );
ok( Pastebin::Validate::validate_expire('1H') == 1,  '1H is valid' );
ok( Pastebin::Validate::validate_expire('1D') == 1,  '1D is valid' );
ok( Pastebin::Validate::validate_expire('1M') == 1,  '1M is valid' );
ok( Pastebin::Validate::validate_expire('foo') == 0, 'foo is invalid' );
