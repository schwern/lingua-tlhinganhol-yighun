#!perl -w
# vim:set et si:
#
use Test::More
        tests => 91
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
        pushtok
        translate
        to_blockop
        blockop
);
}

my $Zol = [
(undef)x29,
sub {
        note "blockop 1: eval BLOCK";
        my $step = shift;
        is $step, 29, 'step 29';
        my @stack = extract_stack($step, 4);
        is scalar(@stack), 8, '8 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token {';
        is $stack[0]{result}[0]{trans}, '{';
        is $stack[1]{name}, 'to_Terran';
        is $stack[1]{result}[0], '0';
        is $stack[2]{name}, 'pushtok', 'Push token 0 (in eval block)';
        is $stack[2]{result}[0]{trans}, '0';
        is $stack[3]{name}, 'pushtok', 'Push token }';
        is $stack[3]{result}[0]{raw}, '{...}';
        is $stack[3]{result}[0]{trans}, "{0;\n}";
        is $stack[4]{name}, 'to_blockop', 'to_blockop';
        is scalar(@{$stack[4]{args}}), 2, '2 args for to_blockop';
        is $stack[4]{args}[0]{type}, 'block';
        is $stack[4]{result}[0], "eval {0;\n}", 'to_blockop()';
        is $stack[5]{name}, 'translate', 'translate';
        is $stack[5]{result}[0], "{...} chov", 'translate->raw';
        is $stack[5]{result}[1], "eval {0;\n}", 'translate->trans';
        is $stack[6]{name}, 'pushtok', 'Push token acc';
        is $stack[6]{result}[0]{type}, 'acc', 'token->type';
        is $stack[6]{result}[0]{raw}, "{...} chov", 'token->raw';
        is $stack[6]{result}[0]{trans}, "eval {0;\n}", 'token->trans';
        is $stack[7]{name}, 'blockop', 'blockop';
        is $stack[7]{result}[0]{type}, 'acc', 'token->type';
        is $stack[7]{result}[0]{raw}, "{...} chov", 'token->raw';
        is $stack[7]{result}[0]{trans}, "eval {0;\n}", 'token->trans';
},
sub {
        note "blockop 2: eval SCALAR";
        my $step = shift;
        is $step, 30, 'step 30';
        my @stack = extract_stack($step, 4);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token <0>';
        is $stack[0]{result}[0]{trans}, 'q<0>';
        is $stack[1]{name}, 'to_blockop', 'to_blockop';
        is scalar(@{$stack[1]{args}}), 2, '2 args for to_blockop';
        is $stack[1]{args}[0]{type}, 'acc';
        is $stack[1]{result}[0], "eval q<0>", 'to_blockop()';
        is $stack[2]{name}, 'translate', 'translate';
        is $stack[2]{result}[0], "<0> chov", 'translate->raw';
        is $stack[2]{result}[1], "eval q<0>", 'translate->trans';
        is $stack[3]{name}, 'pushtok', 'Push token acc';
        is $stack[3]{result}[0]{type}, 'acc', 'token->type';
        is $stack[3]{result}[0]{raw}, "<0> chov", 'token->raw';
        is $stack[3]{result}[0]{trans}, "eval q<0>", 'token->trans';
        is $stack[4]{name}, 'blockop', 'blockop';
        is $stack[4]{result}[0]{type}, 'acc', 'token->type';
        is $stack[4]{result}[0]{raw}, "<0> chov", 'token->raw';
        is $stack[4]{result}[0]{trans}, "eval q<0>", 'token->trans';
},
sub {
        note "blockop 3: do BLOCK";
        my $step = shift;
        is $step, 31, 'step 31';
        my @stack = extract_stack($step, 4);
        is scalar(@stack), 8, '8 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token {';
        is $stack[0]{result}[0]{trans}, '{';
        is $stack[1]{name}, 'to_Terran';
        is $stack[1]{result}[0], '0';
        is $stack[2]{name}, 'pushtok', 'Push token 0 (in do block)';
        is $stack[2]{result}[0]{trans}, '0';
        is $stack[3]{name}, 'pushtok', 'Push token }';
        is $stack[3]{result}[0]{raw}, '{...}';
        is $stack[3]{result}[0]{trans}, "{0;\n}";
        is $stack[4]{name}, 'to_blockop', 'to_blockop';
        is scalar(@{$stack[4]{args}}), 2, '2 args for to_blockop';
        is $stack[4]{args}[0]{type}, 'block';
        is $stack[4]{result}[0], "do {0;\n}", 'to_blockop()';
        is $stack[5]{name}, 'translate', 'translate';
        is $stack[5]{result}[0], "{...} vang", 'translate->raw';
        is $stack[5]{result}[1], "do {0;\n}", 'translate->trans';
        is $stack[6]{name}, 'pushtok', 'Push token acc';
        is $stack[6]{result}[0]{type}, 'acc', 'token->type';
        is $stack[6]{result}[0]{raw}, "{...} vang", 'token->raw';
        is $stack[6]{result}[0]{trans}, "do {0;\n}", 'token->trans';
        is $stack[7]{name}, 'blockop', 'blockop';
        is $stack[7]{result}[0]{type}, 'acc', 'token->type';
        is $stack[7]{result}[0]{raw}, "{...} vang", 'token->raw';
        is $stack[7]{result}[0]{trans}, "do {0;\n}", 'token->trans';
},
sub {
        note "blockop 4: do SCALAR";
        my $step = shift;
        is $step, 32, 'step 32';
        my @stack = extract_stack($step, 4);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token <0>';
        is $stack[0]{result}[0]{trans}, 'q<0>';
        is $stack[1]{name}, 'to_blockop', 'to_blockop';
        is scalar(@{$stack[1]{args}}), 2, '2 args for to_blockop';
        is $stack[1]{args}[0]{type}, 'acc';
        is $stack[1]{result}[0], "do q<0>", 'to_blockop()';
        is $stack[2]{name}, 'translate', 'translate';
        is $stack[2]{result}[0], "<0> vang", 'translate->raw';
        is $stack[2]{result}[1], "do q<0>", 'translate->trans';
        is $stack[3]{name}, 'pushtok', 'Push token acc';
        is $stack[3]{result}[0]{type}, 'acc', 'token->type';
        is $stack[3]{result}[0]{raw}, "<0> vang", 'token->raw';
        is $stack[3]{result}[0]{trans}, "do q<0>", 'token->trans';
        is $stack[4]{name}, 'blockop', 'blockop';
        is $stack[4]{result}[0]{type}, 'acc', 'token->type';
        is $stack[4]{result}[0]{raw}, "<0> vang", 'token->raw';
        is $stack[4]{result}[0]{trans}, "do q<0>", 'token->trans';
},
];

my @module_args;
BEGIN { push @module_args, 'yIQIj' if $DEBUG; }
BEGIN { push @module_args, 'yImugh' if $TRANSLATE; }
no warnings 'void';
use Lingua::tlhInganHol::yIghun @module_args;
nabwIj!

cha'maH Hut yIlIH! #'
{ pagh! } yIchov!
cha'maH Hut yIvan! #'
nabvaD 'olvo' cha'maH Hut DIch yInob! #'
cha'maH Hut yInabvetlh! #'

wejmaH yIlIH!
<0> yIchov!
wejmaH yIvan!
nabvaD 'olvo' wejmaH DIch yInob!
wejmaH yInabvetlh!

wejmaH wa' yIlIH! #'
{ pagh! } yIvang!
wejmaH wa' yIvan! #'
nabvaD 'olvo' wejmaH wa' DIch yInob! #'
wejmaH wa' yInabvetlh! #'

wejmaH cha' yIlIH! #'
<0> yIvang!
wejmaH cha' yIvan! #'
nabvaD 'olvo' wejmaH cha' DIch yInob! #'
wejmaH cha' yInabvetlh! #'

yIdone_testing!
