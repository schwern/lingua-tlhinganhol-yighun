use Test::More qw(no_plan);

require_ok Lingua::tlhInganHol::yIghun;

*rh = \&Lingua::tlhInganHol::yIghun::readline_honourably;

my $fh;
my $input = '';
my $result;

sub setup {
        $input = join '' => map +(defined($_) ? $_ : ''), @_;
        undef $fh;
        open $fh, '<', \$input;
}

setup 'This is some text';
$result = rh($fh);
is $result, 'This is some text', 'Just some text';

setup "wa'maH green bottles hanging on the wall";
$result = rh($fh);
is $result, '10 green bottles hanging on the wall', 'text with number';

setup "I've told you cha'maH times if I've told you wej times";
$result = rh($fh);
is $result, "I've told you 20 times if I've told you 3 times", 'text with multiple numbers';

setup "Captain, warp vagh DoD loS jav please!";
$result = rh($fh);
is $result, "Captain, warp 5.46 please!", 'decimals';

setup "Captain, warp vaghSaD DoD wa'!";
$result = rh($fh);
is $result, "Captain, warp 5000.1!", 'no space after decimal';
