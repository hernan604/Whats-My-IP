use Test::More;
use Whats::My::IP;
my $myip = Whats::My::IP->new;
my $ip = $myip->get;
warn "Your ip is: $ip";

1;
