#
#===============================================================================
#
#         FILE: Pastebin.t
#
#  DESCRIPTION: Tests for pastebin application
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Peter H. Ezetta (PE), protoCall7@gmail.com
# ORGANIZATION:
#      VERSION: 0.1
#      CREATED: 11/06/2012 14:23:12
#     REVISION: ---
#===============================================================================

use strict;
use warnings;

use Test::More tests => 8;    # last test to print
use App::Cmd::Tester;
use Pastebin;

#-------------------------------------------------------------------------------
#  Begin test with no subcommands or options
#-------------------------------------------------------------------------------
my $result = test_app( Pastebin => [qw( )] );

like( $result->stdout, qr/Available commands/, 'Returns help' );
is( $result->stderr,    '',    'No output on STDERR' );
is( $result->error,     undef, 'Throw no exceptions' );
is( $result->exit_code, 0,     'Return 0' );

#-------------------------------------------------------------------------------
#  Try with invalid subcommand
#-------------------------------------------------------------------------------

$result = test_app( Pastebin => [qw( foo )] );

like( $result->stdout, qr/Unrecognized command: foo./, 'Error returned' );
is( $result->stderr,    '',    'No output on STDERR' );
is( $result->error,     undef, 'Throw no exceptions' );
is( $result->exit_code, 1,     'Return 1' );
