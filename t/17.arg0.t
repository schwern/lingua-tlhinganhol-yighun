#!perl -w
# vim:set et si:
#
use Test::More
        tests => 46
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
        pushtok
        translate
        to_arg0
        arg0
);
}

my $Zol = [
(undef)x39,
sub {
        note 'time';
        my $step = shift;
        is $step, 39, 'step 39';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg0', 'to_arg0';
        is $stack[0]{result}[0], 'time', 'to_arg0() -> time';
        is $stack[1]{name}, 'translate', 'translate';
        is $stack[1]{result}[0], 'poH', 'translate->raw';
        is $stack[1]{result}[1], 'time', 'translate->trans';
        is $stack[2]{name}, 'pushtok', 'Push token acc';
        is $stack[2]{result}[0]{type}, 'acc', 'token->type';
        is $stack[2]{result}[0]{raw}, 'poH', 'token->raw';
        is $stack[2]{result}[0]{trans}, 'time', 'token->trans';
        is $stack[3]{name}, 'arg0', 'arg0';
        is $stack[3]{result}[0]{type}, 'acc', 'token->type';
        is $stack[3]{result}[0]{raw}, 'poH', 'token->raw';
        is $stack[3]{result}[0]{trans}, 'time', 'token->trans';
},
sub {
        note 'wantarray';
        my $step = shift;
        is $step, 40, 'step 40';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg0', 'to_arg0';
        is $stack[0]{result}[0], 'wantarray', 'to_arg0() -> wantarray';
        is $stack[1]{name}, 'translate', 'translate';
        is $stack[1]{result}[0], 'ghomneH', 'translate->raw';
        is $stack[1]{result}[1], 'wantarray', 'translate->trans';
        is $stack[2]{name}, 'pushtok', 'Push token acc';
        is $stack[2]{result}[0]{type}, 'acc', 'token->type';
        is $stack[2]{result}[0]{raw}, 'ghomneH', 'token->raw';
        is $stack[2]{result}[0]{trans}, 'wantarray', 'token->trans';
        is $stack[3]{name}, 'arg0', 'arg0';
        is $stack[3]{result}[0]{type}, 'acc', 'token->type';
        is $stack[3]{result}[0]{raw}, 'ghomneH', 'token->raw';
        is $stack[3]{result}[0]{trans}, 'wantarray', 'token->trans';
},
sub {
        note 'fork';
        my $step = shift;
        is $step, 41, 'step 41';
        my @stack = extract_stack($step);
        is scalar(@stack), 7, '7 entries on callstack';
        is $stack[1]{name}, 'to_arg0', 'to_arg0';
        is $stack[1]{result}[0], 'fork', 'to_arg0() -> fork';
        is $stack[2]{name}, 'translate', 'translate';
        is $stack[2]{result}[0], 'bogh', 'translate->raw';
        is $stack[2]{result}[1], 'fork', 'translate->trans';
        is $stack[3]{name}, 'pushtok', 'Push token acc';
        is $stack[3]{result}[0]{type}, 'acc', 'token->type';
        is $stack[3]{result}[0]{raw}, 'bogh', 'token->raw';
        is $stack[3]{result}[0]{trans}, 'fork', 'token->trans';
        is $stack[4]{name}, 'arg0', 'arg0';
        is $stack[4]{result}[0]{type}, 'acc', 'token->type';
        is $stack[4]{result}[0]{raw}, 'bogh', 'token->raw';
        is $stack[4]{result}[0]{trans}, 'fork', 'token->trans';
},
];

my @module_args;
BEGIN { push @module_args, 'yIQIj' if $DEBUG; }
BEGIN { push @module_args, 'yImugh' if $TRANSLATE; }
no warnings 'void';
use Lingua::tlhInganHol::yIghun @module_args;
nabwIj!

wejmaH Hut yIlIH!
yIpoH!
wejmaH Hut yIvan!
nabvaD 'olvo' wejmaH Hut DIch yInob!
wejmaH Hut yInabvetlh!

loSmaH yIlIH!
yIghomneH!
loSmaH yIvan!
nabvaD 'olvo' loSmaH DIch yInob!
loSmaH yInabvetlh!

# fork: exit if we're the child
# my $pid; $pid = fork; if ($pid == 0) { exit; }
pIDwIj!
loSmaH wa' yIlIH! #'
pIDvaD yIbogh yInob!
loSmaH wa' yIvan! #'
{ yImej! } pID pagh mI'rap'a' teHchugh! #'
nabvaD 'olvo' loSmaH wa' DIch yInob! #'
loSmaH wa' yInabvetlh! #'

yIdone_testing!
