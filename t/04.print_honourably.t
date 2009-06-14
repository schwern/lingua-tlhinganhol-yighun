use Test::More tests => 10;

require_ok Lingua::tlhInganHol::yIghun;

*ph = \&Lingua::tlhInganHol::yIghun::print_honourably;

# Test printing to handles
my $fh;
my $output = '';

sub setup { undef $fh; open $fh, '>', \$output }

# Test printing $_
setup;
$_ = 'This is just text';
ph($fh);
is $output, 'This is just text', 'plain text ($_)';
setup;
$_ = 'This is text with 456 numbers';
ph($fh);
is $output, 'This is text with loSvatlh vaghmaH jav numbers', 'text with numbers ($_)';
setup;
$_ = '87.65 numbers in 98.4 words';
ph($fh);
is $output, 'chorghmaH Soch DoD jav vagh numbers in HutmaH chorgh DoD loS words', 'text with numbers ($_)';

# Test printing explicit data
setup;
ph($fh, 'This is just text');
is $output, 'This is just text', 'plain text (literal)';
setup;
ph($fh, 'This is text with 456 numbers');
is $output, 'This is text with loSvatlh vaghmaH jav numbers', 'text with numbers (literal)';
setup;
ph($fh, '87.65 numbers in 98.4 words');
is $output, 'chorghmaH Soch DoD jav vagh numbers in HutmaH chorgh DoD loS words', 'text with numbers (literal)';

# Test multiple parameters
setup;
ph($fh, 'This', 'is', 'some', 'text');
is $output, 'Thisissometext', 'multiple parameters';
setup;
ph($fh, 'With', '642', 'numbers');
is $output, "Withjavvatlh loSmaH cha'numbers", 'multi + numbers';
setup;
ph($fh, 'Split 4', '7 up');
is $output, "Split loSmaH Soch up", 'multi + split-up numbers';
