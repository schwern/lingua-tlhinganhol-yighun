#!perl -w
# vim:set et si:
#
use Test::More
        tests => 32
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
        decl
        to_decl
);
}

my $Zol = [
(undef)x18,
sub {
        note "decl (packages)";
        my $step = shift;
        is $step, 18, 'step 18';
        my @stack = extract_stack($step);
        is scalar(@stack), 2*5, '10 entries on callstack';
        is $stack[0]{name}, 'pushtok', "Push token(wo''a')";
        is $stack[0]{args}[0], 'acc', 'token->type = acc';
        is $stack[0]{args}[1], "wo''a'", 'token->raw';
        is $stack[0]{args}[2], '$woZZaZ', 'token->trans = $woZZaZ';
        # is $stack[0]{name}, 'decl -> translate -> to_decl -> pushtok';
        is $stack[1]{name}, 'to_decl', 'to_decl';
        is $stack[1]{args}[0]{raw}, "wo''a'", 'to_decl[0]->raw';
        is $stack[1]{args}[0]{trans}, 'woZZaZ', 'to_decl[0]->trans';
        is $stack[1]{args}[1]{raw}, 'yoS', 'to_decl[1]->raw';
        is $stack[1]{args}[1]{trans}, 'package', 'to_decl[1]->trans';
        is $stack[1]{result}[0], 'package woZZaZ';
        is $stack[2]{name}, 'translate', 'Translate';
        is ref $stack[2]{args}[0], 'HASH', 'translate[0] = HASH';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type';
        is $stack[2]{args}[0]{raw}, "wo''a'", 'translate[0]->raw';
        is $stack[2]{args}[0]{trans}, 'woZZaZ', 'translate[0]->trans';
        is ref $stack[2]{args}[1], 'HASH', 'translate[1] = HASH';
        is $stack[2]{args}[1]{type}, 'adj', 'translate[1]->type';
        is $stack[2]{args}[1]{raw}, 'yoS', 'translate[1]->raw';
        is $stack[2]{args}[1]{trans}, 'package', 'translate[1]->trans';
        is $stack[2]{result}[0], "wo''a' yoS", 'translate()->raw';
        is $stack[2]{result}[1], 'package woZZaZ', 'translate()->trans';
        is $stack[3]{name}, 'pushtok', 'Push token(command)';
        is $stack[3]{args}[0], 'cmd', 'token->type = cmd';
        is $stack[3]{args}[1], "wo''a' yoS", 'token->raw';
        is $stack[3]{args}[2], 'package woZZaZ', 'token->trans = package woZZaZ';
        is $stack[4]{name}, 'decl', 'decl';
        is $stack[4]{args}[0], 'yoS', 'decl(yoS)';
        is $stack[5+2]{name}, 'translate', 'Translate (2)';
        is $stack[5+2]{result}[1], 'package main', 'translate()->trans';
},
];

my @module_args;
BEGIN { push @module_args, 'yIQIj' if $DEBUG; }
BEGIN { push @module_args, 'yImugh' if $TRANSLATE; }
no warnings 'void';
use Lingua::tlhInganHol::yIghun @module_args;
nabwIj!

wa'maH chorgh yIlIH! #'
wo''a' yoS! #'
main yoS!
wa'maH chorgh yIvan! #'
nabvaD 'olvo' wa'maH chorgh DIch yInob! #'
wa'maH chorgh yInabvetlh! #'

yIdone_testing!
