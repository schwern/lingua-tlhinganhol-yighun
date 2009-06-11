use Test::More qw(no_plan);

require_ok Lingua::tlhInganHol::yIghun;

*ph = \&Lingua::tlhInganHol::yIghun::print_honourably;

# Test printing to handles
my $fh;
my $output = '';
open $fh, '>', \$output;

# Test printing $_

# Test printing explicit data
