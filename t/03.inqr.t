use Test::More qw(no_plan);

require_ok Lingua::tlhInganHol::yIghun;

*inqr = \&Lingua::tlhInganHol::yIghun::inqr;

my $one = inqr('one');
ok ref $one, 'one is a ref';
like 'one', $one, 'one =~ one';
like 'abalone', $one, 'abalone =~ one';
like 'onerous', $one, 'onerous !~ one';

my $two = inqr('one', 'two');
ok ref $two, 'two is a ref';
like 'one', $two, 'one =~ two';
like 'two', $two, 'two =~ two';
like 'abalone', $two, 'abalone =~ two';
like 'fortwo', $two, 'fortwo =~ two';
like 'onetwo', $two, 'onetwo =~ two';
like 'twoone', $two, 'twoone =~ two';
like 'onerous', $two, 'onerous !~ two';
like 'twosome', $two, 'twosome !~ two';
