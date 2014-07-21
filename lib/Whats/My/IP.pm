package Whats::My::IP;
use Moose;
use HTTP::Tiny;

our $VERSION = 0.01;

has ua => ( 
    is      => "rw", 
    default => sub { 
        HTTP::Tiny->new( 
            agent => "Whats::My::IP $VERSION" 
        ) 
    } 
);

sub get {
    my ( $self ) = @_; 
    my $res    = $self->ua->get( "http://checkip.dyndns.org" );
    my ( $ip ) = $res->{ content } =~ m#.+body>Current IP Address: (.+)</body.+#g;
    return 0 if ! $ip || $ip eq "";
    return $ip;
}

1;
