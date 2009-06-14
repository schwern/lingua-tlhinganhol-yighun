use Test::More tests => 14;

require_ok Lingua::tlhInganHol::yIghun;

*enqr = \&Lingua::tlhInganHol::yIghun::enqr;

my $one = enqr('one');
ok ref $one, 'one is a ref';
like 'one', $one, 'one =~ one';
like 'abalone', $one, 'abalone =~ one';
unlike 'onerous', $one, 'onerous !~ one';

my $two = enqr('one', 'two');
ok ref $two, 'two is a ref';
like 'one', $two, 'one =~ two';
like 'two', $two, 'two =~ two';
like 'abalone', $two, 'abalone =~ two';
like 'fortwo', $two, 'fortwo =~ two';
like 'onetwo', $two, 'onetwo =~ two';
like 'twoone', $two, 'twoone =~ two';
unlike 'onerous', $two, 'onerous !~ two';
unlike 'twosome', $two, 'twosome !~ two';
