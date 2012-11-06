package Pastebin::Command::info;

use Pastebin -command;
use Pastebin::login;

use strict;
use warnings;
use 5.010;
use autodie;
use LWP::Curl;

sub description {
	return "Fetch a user's information and settings";
}

sub opt_spec {
    return ( [ "user|u=s" => "Username" ], [ "pass|p=s" => "Password" ], );
}

sub execute {
    my ( $self, $opt, $args ) = @_;
    my $api_dev_key = 'ebb64cafa134d25d1ea1ce43a47589bf';
    my $api_user_key = Pastebin::login::login( $opt->{'user'}, $opt->{'pass'} );

    my $url      = 'http://pastebin.com/api/api_post.php';
    my $referrer = 'http://techmasochism.blogspot.com';

    my $curl = LWP::Curl->new( "auto_encode" => 1 );
    my $hash = {
        "api_dev_key"  => $api_dev_key,
        "api_user_key" => $api_user_key,
        "api_option"   => "userdetails",
    };

    my $content = $curl->post( $url, $hash, $referrer );
    say $content;
}

=pod
=head1 NAME

Pastebin::Command::info - Fetch a user's information and settings from Pastebin

=head1 VERSION

version 0.001

=cut
1;
