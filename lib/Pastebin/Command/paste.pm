#
#===============================================================================
#
#         FILE: paste.pm
#
#  DESCRIPTION: App::Cmd command to paste a file to pastebin.com
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Peter H. Ezetta (PE), peter.ezetta@zonarsystems.com
# ORGANIZATION:
#      VERSION: 1.0
#      CREATED: 11/06/2012 19:29:21
#     REVISION: ---
#===============================================================================

package Pastebin::Command::paste;
use strict;
use warnings;
use 5.010;
use version; our $VERSION = qv('0.1');
use LWP::Curl;
use Pastebin -command;
use Pastebin::Login;
use Pastebin::Validate;

sub opt_spec {
    return (
        [ 'file|f=s'    => 'file to paste' ],
        [ 'privacy|P=i' => 'privacy setting' ],
        [ 'title|t=s'   => 'paste title' ],
        [ 'expire|e=s'  => 'paste expiration' ],
        [ 'syntax|s=s'  => 'syntax hilighting' ],
        [ 'user|u=s'    => 'username' ],
        [ 'pass|p=s'    => 'password' ],
    );
}

sub validate_args {
    my ( $self, $opt, $args ) = @_;

    my $validator = Pastebin::Validate->new();

    if ( $opt->{'privacy'} ) {
        $self->usage_error("Privacy setting requires username and password")
            unless ( $opt->{'user'} && $opt->{'pass'} );
    }
    if ( $opt->{'expire'} ) {
        $self->usage_error("Invalid expiration.  See pastebin.pl(1)")
            unless $validator->validate_expire( $opt->{'expire'} );
    }

    return;
}

sub execute {
    my ( $self, $opt, $args ) = @_;

    my $api_dev_key = 'ebb64cafa134d25d1ea1ce43a47589bf';
    my $api_paste_code;
    my $api_paste_private     = 1;                  # Default to unlisted post
    my $api_paste_name        = $opt->{'title'};
    my $api_paste_expire_date = $opt->{'expire'};
    my $api_paste_format      = $opt->{'syntax'};
    my $api_user_key;
    my $api_option = 'paste';

    my $url      = 'http://pastebin.com/api/api_post.php';
    my $referrer = 'http://techmasochism.blogspot.com';

    if ( $opt->{'user'} && $opt->{'pass'} ) {
        my $login = Pastebin::Login->new();
        $login->set_user_key( $opt->{'user'}, $opt->{'pass'} );
        $api_user_key = $login->get_user_key();
    }

    open( my $fh, "<", $opt->{'file'} );
    foreach (<$fh>) {
        $api_paste_code .= $_;
    }
    close $fh;

    my $curl = LWP::Curl->new( 'auto_encode' => 1 );
    my $hash_form = {
        'api_dev_key'    => $api_dev_key,
        'api_option'     => $api_option,
        'api_paste_code' => $api_paste_code,
    };

    $hash_form->{'api_paste_name'} = $api_paste_name
        if $api_paste_name;

    $hash_form->{'api_paste_expire_date'} = $api_paste_expire_date
        if $api_paste_expire_date;

    my $content = $curl->post( $url, $hash_form, $referrer );
    say $content;

    return;
}

1;

__END__

=pod

=head1 NAME

Pastebin::Command::paste - paste a file to pastebin.com

