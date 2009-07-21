#!perl -w
# vim:set et si:
#
use Test::More
        tests => 12
;
use strict;
my $DEBUG;
my $TRANSLATE;

BEGIN { $DEBUG = 0; }
BEGIN { $TRANSLATE = 0; }

BEGIN { require_ok 'Lingua::tlhInganHol::yIghun' }

BEGIN {
require 't/wrap.pl';
sub wrap;
wrap $_ for qw(
        to_Terran
        from_Terran
        pushtok
);
}

my $Zol = [
sub {
        note "Simple number";
        my $step = shift;
        is $step, 0, 'step 0';
        my @stack = extract_stack($step);
        is scalar(@stack), 2, '2 entries on callstack';
        is $stack[0]{name}, 'to_Terran', 'translate number first';
        is scalar(@{$stack[0]{args}}), 1, 'to_Terran($)';
        is $stack[0]{args}[0], "loSvatlh wa'maH cha'", 'to_Terran(arg)';
        is scalar(@{$stack[0]{result}}), 1, '$ = to_Terran';
        is $stack[0]{result}[0], '412', 'to_Terran = 412';
        is $stack[1]{name}, 'pushtok', 'Push token';
        is $stack[1]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[1]{args}[1], "loSvatlh wa'maH cha'", 'token->raw';
        is $stack[1]{args}[2], '412', 'token->trans = 412';
},
];

my @module_args;
BEGIN { push @module_args, 'yIQIj' if $DEBUG; }
BEGIN { push @module_args, 'yImugh' if $TRANSLATE; }
no warnings 'void';
use Lingua::tlhInganHol::yIghun @module_args;
nabwIj!

pagh yIlIH!
loSvatlh wa'maH cha' !
pagh yIvan!
nabvaD 'olvo' pagh DIch yInob!
pagh yInabvetlh!

yIdone_testing!
