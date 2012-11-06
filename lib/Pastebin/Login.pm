#
#===============================================================================
#
#         FILE: Login.pm
#
#  DESCRIPTION: Authentication module for the pastebin.com API
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Peter H. Ezetta (PE), protoCall7@gmail.com
# ORGANIZATION: 
#      VERSION: 0.1
#      CREATED: 11/06/2012 09:43:16
#     REVISION: ---
#===============================================================================

package Pastebin::Login;
use strict;
use warnings;
use 5.010;
use version; our $VERSION = qv('0.1');
use URI::Escape;
use LWP::Curl;

sub login {
    my @args              = @_;
    my $api_dev_key       = 'ebb64cafa134d25d1ea1ce43a47589bf';
    my $api_user_name     = $args[0];
    my $api_user_password = $args[1];

    my $url      = 'http://pastebin.com/api/api_login.php';
    my $referrer = 'http://techmasochism.blogspot.com';

#-------------------------------------------------------------------------------
#  Create a cUrl object
#-------------------------------------------------------------------------------
    my $curl = LWP::Curl->new( 'auto_encode' => 1 );
    my $hash_form = {
        'api_dev_key'       => $api_dev_key,
        'api_user_name'     => $api_user_name,
        'api_user_password' => $api_user_password,
    };

    my $content = $curl->post( $url, $hash_form, $referrer );
    return $content;
}

1;

__END__

=pod

=head1 NAME

Pastebin::Login - An authentication module for the Pastebin API

=head1 VERSION

This documentation refers to Pastebin::Login version 0.1

=head1 SYNOPSIS

	use Pastebin::Login;
	my $api_user_key = Pastebin::Login::login("username", "password");

=cut
