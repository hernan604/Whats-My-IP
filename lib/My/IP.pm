package My::IP;
use Moose;
use HTTP::Tiny;

our $VERSION = 0.01;

has ua => ( 
    is      => "rw", 
    default => sub { 
        HTTP::Tiny->new( 
            agent => "My::IP $VERSION" 
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
__END__

=encoding utf-8

=head1 NAME

My::IP - $ myip prints your public ip address (checkip.dyndns.org)

=head1 SYNOPSIS

  use My::IP;

=head1 DESCRIPTION

My::IP prints your public ip address (checkip.dyndns.org)

=head1 AUTHOR

Hernan Lopes E<lt>hernan@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2014- Hernan Lopes

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
