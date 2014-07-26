use Test::More;
use My::IP;
my $myip = My::IP->new;
my $ip = $myip->get;
ok( $ip =~ m#[0-9]+.[0-9]+.[0-9]+.[0-9]+#g, "reveived an ip $ip" );

done_testing;
