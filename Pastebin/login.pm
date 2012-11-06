package Pastebin::login;
use strict;
use warnings;
use 5.010;
use autodie;
use URI::Escape;
use Data::Printer;
use LWP::Curl;

sub login {
    my @args              = @_;
    my $api_dev_key       = 'ebb64cafa134d25d1ea1ce43a47589bf';
    my $api_user_name     = $args[0];
    my $api_user_password = $args[1];

    my $url = 'http://pastebin.com/api/api_login.php';
	my $referrer = 'http://techmasochism.blogspot.com';

    #Create a new Curl object
    my $curl = LWP::Curl->new( 'auto_encode' => 1 );
    my $hash_form = {
        "api_dev_key"       => $api_dev_key,
        "api_user_name"     => $api_user_name,
        "api_user_password" => $api_user_password,
    };

    my $content = $curl->post( $url, $hash_form, $referrer );
    return $content;;
}

1;
