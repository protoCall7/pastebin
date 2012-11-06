#
#===============================================================================
#
#         FILE: info.pm
#
#  DESCRIPTION: App:Cmd command fetch user's info and settings
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Peter H. Ezetta (PE), protoCall7@gmail.com
# ORGANIZATION:
#      VERSION: 0.1
#      CREATED: 11/06/2012 02:27:48
#     REVISION: ---
#===============================================================================

package Pastebin::Command::info;

use strict;
use warnings;
use 5.010;
use version; our $VERSION = qv('0.0.1');
use Fatal qw( say );
use Pastebin -command;
use Pastebin::Login;
use LWP::Curl;

#===  FUNCTION  ================================================================
#         NAME: opt_spec
#      PURPOSE: Define command options
#   PARAMETERS: ????
#      RETURNS: ????
#  DESCRIPTION: Overrides App::Cmd default with getopt::long option description
#       THROWS: no exceptions
#     COMMENTS: none
#     SEE ALSO: n/a
#===============================================================================
sub opt_spec {
    return ( [ 'user|u=s' => 'Username' ], [ 'pass|p=s' => 'Password' ], );
}

#===  FUNCTION  ================================================================
#         NAME: validate_args
#      PURPOSE: Validate user input
#   PARAMETERS: ????
#      RETURNS: ????
#  DESCRIPTION: Checks user input to ensure that required options are present
#       THROWS: no exceptions
#     COMMENTS: none
#     SEE ALSO: n/a
#===============================================================================
sub validate_args {
    my ( $self, $opt, $args ) = @_;
    $self->usage_error('Must provide username and password!')
        unless ( $opt->{user} && $opt->{pass} );

    return 1;
}

#===  FUNCTION  ================================================================
#         NAME: execute
#      PURPOSE: Main body of command
#   PARAMETERS: ????
#      RETURNS: ????
#  DESCRIPTION: This method executes the main body of the App::Cmd command.
#       THROWS: no exceptions
#     COMMENTS: none
#     SEE ALSO: n/a
#===============================================================================
sub execute {
    my ( $self, $opt, $args ) = @_;
    my $api_dev_key = 'ebb64cafa134d25d1ea1ce43a47589bf';

#-------------------------------------------------------------------------------
#  Call the login method to parse user options and return an API user key.
#-------------------------------------------------------------------------------
    my $api_user_key =
        Pastebin::login::login( $opt->{'user'}, $opt->{'pass'} );

    my $url      = 'http://pastebin.com/api/api_post.php';
    my $referrer = 'http://techmasochism.blogspot.com';

#-------------------------------------------------------------------------------
#  Create a new cUrl object.  Enable automatic html encoding of parameters.
#-------------------------------------------------------------------------------
    my $curl = LWP::Curl->new( 'auto_encode' => 1 );

#-------------------------------------------------------------------------------
#  Define the parameters to the API POST.
#-------------------------------------------------------------------------------
    my $hash = {
        'api_dev_key'  => $api_dev_key,
        'api_user_key' => $api_user_key,
        'api_option'   => 'userdetails',
    };

#-------------------------------------------------------------------------------
#  Make the POST to the API, and dump the return to the console.
#-------------------------------------------------------------------------------
    my $content = $curl->post( $url, $hash, $referrer );
    say $content;

    return 1;
}

1;

__END__

=pod

=head1 NAME

Pastebin::Command::info - fetch user's information and settings

=head1 VERSION

Version 0.1

=head1 USAGE

info -u <user> -p <pass>

=head1 DESCRIPTION

Pastebin::Command::info is an App::Cmd command module used to fetch the user's 
information and settings from pastebin.com, and return them in XML.  

=head1 AUTHOR

Peter H. Ezetta <protoCall7@gmail.com>

=head1 LICENSE

This software is (c) 2012 Peter H. Ezetta, and is licensed under the 
BSD 3-clause license.

http://http://opensource.org/licenses/BSD-3-Clause

=cut
