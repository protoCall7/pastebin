package Pastebin::Command::info;

use Pastebin -command;
use Pastebin::login;

use strict;
use warnings;
use 5.010;
use autodie;
use LWP::Curl;

sub opt_spec {
    return ( [ "user|u=s" => "Username" ], [ "pass|p=s" => "Password" ], );
}

sub validate_args {
    my ( $self, $opt, $args ) = @_;
    $self->usage_error("Must provide username and password!")
      unless ( $opt->{user} && $opt->{pass} );
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

1;
