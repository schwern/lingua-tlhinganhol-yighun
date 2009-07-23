#!perl -w
# vim:set et si:
#
use Test::More
        tests => 505
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
        to_arg1
        to_arg1_da
        arg1
        arg1_da
);
}

my $Zol = [
sub {
        note "study(0)";
        my $step = shift;
        is $step, 0, 'step 0';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'HaD', 'to_arg1[1]->raw = HaD';
        is $stack[0]{args}[1]{trans}, 'study', 'to_arg1[1]->trans = study';
        is $stack[0]{result}[0], 'study()', 'to_arg1() = study()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'HaD', 'translate[1]->raw = HaD';
        is $stack[1]{args}[1]{trans}, 'study', 'translate[1]->trans = study';
        is $stack[1]{result}[0], 'HaD', 'translate()->raw = HaD';
        is $stack[1]{result}[1], 'study()', 'translate()->trans = study()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'HaD', 'token->raw = HaD';
        is $stack[2]{args}[2], 'study()', 'token->trans = study()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'HaD', 'arg1->args';
},
sub {
        note "abs(0)";
        my $step = shift;
        is $step, 1, 'step 1';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, '\'ar', 'to_arg1[1]->raw = \'ar';
        is $stack[0]{args}[1]{trans}, 'abs', 'to_arg1[1]->trans = abs';
        is $stack[0]{result}[0], 'abs()', 'to_arg1() = abs()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, '\'ar', 'translate[1]->raw = \'ar';
        is $stack[1]{args}[1]{trans}, 'abs', 'translate[1]->trans = abs';
        is $stack[1]{result}[0], '\'ar', 'translate()->raw = \'ar';
        is $stack[1]{result}[1], 'abs()', 'translate()->trans = abs()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], '\'ar', 'token->raw = \'ar';
        is $stack[2]{args}[2], 'abs()', 'token->trans = abs()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], '\'ar', 'arg1->args';
},
sub {
        note "sin(0)";
        my $step = shift;
        is $step, 2, 'step 2';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'joqtaH', 'to_arg1[1]->raw = joqtaH';
        is $stack[0]{args}[1]{trans}, 'sin', 'to_arg1[1]->trans = sin';
        is $stack[0]{result}[0], 'sin()', 'to_arg1() = sin()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'joqtaH', 'translate[1]->raw = joqtaH';
        is $stack[1]{args}[1]{trans}, 'sin', 'translate[1]->trans = sin';
        is $stack[1]{result}[0], 'joqtaH', 'translate()->raw = joqtaH';
        is $stack[1]{result}[1], 'sin()', 'translate()->trans = sin()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'joqtaH', 'token->raw = joqtaH';
        is $stack[2]{args}[2], 'sin()', 'token->trans = sin()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'joqtaH', 'arg1->args';
},
sub {
        note "cos(0)";
        my $step = shift;
        is $step, 3, 'step 3';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'joqtaHHa\'', 'to_arg1[1]->raw = joqtaHHa\'';
        is $stack[0]{args}[1]{trans}, 'cos', 'to_arg1[1]->trans = cos';
        is $stack[0]{result}[0], 'cos()', 'to_arg1() = cos()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'joqtaHHa\'', 'translate[1]->raw = joqtaHHa\'';
        is $stack[1]{args}[1]{trans}, 'cos', 'translate[1]->trans = cos';
        is $stack[1]{result}[0], 'joqtaHHa\'', 'translate()->raw = joqtaHHa\'';
        is $stack[1]{result}[1], 'cos()', 'translate()->trans = cos()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'joqtaHHa\'', 'token->raw = joqtaHHa\'';
        is $stack[2]{args}[2], 'cos()', 'token->trans = cos()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'joqtaHHa\'', 'arg1->args';
},
sub {
        note "int(0)";
        my $step = shift;
        is $step, 4, 'step 4';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'poD', 'to_arg1[1]->raw = poD';
        is $stack[0]{args}[1]{trans}, 'int', 'to_arg1[1]->trans = int';
        is $stack[0]{result}[0], 'int()', 'to_arg1() = int()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'poD', 'translate[1]->raw = poD';
        is $stack[1]{args}[1]{trans}, 'int', 'translate[1]->trans = int';
        is $stack[1]{result}[0], 'poD', 'translate()->raw = poD';
        is $stack[1]{result}[1], 'int()', 'translate()->trans = int()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'poD', 'token->raw = poD';
        is $stack[2]{args}[2], 'int()', 'token->trans = int()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'poD', 'arg1->args';
},
sub {
        note "log(0)";
        my $step = shift;
        is $step, 5, 'step 5';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'maHghurtaH', 'to_arg1[1]->raw = maHghurtaH';
        is $stack[0]{args}[1]{trans}, 'log', 'to_arg1[1]->trans = log';
        is $stack[0]{result}[0], 'log()', 'to_arg1() = log()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'maHghurtaH', 'translate[1]->raw = maHghurtaH';
        is $stack[1]{args}[1]{trans}, 'log', 'translate[1]->trans = log';
        is $stack[1]{result}[0], 'maHghurtaH', 'translate()->raw = maHghurtaH';
        is $stack[1]{result}[1], 'log()', 'translate()->trans = log()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'maHghurtaH', 'token->raw = maHghurtaH';
        is $stack[2]{args}[2], 'log()', 'token->trans = log()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'maHghurtaH', 'arg1->args';
},
sub {
        note "sqrt(0)";
        my $step = shift;
        is $step, 6, 'step 6';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'loS\'ar', 'to_arg1[1]->raw = loS\'ar';
        is $stack[0]{args}[1]{trans}, 'sqrt', 'to_arg1[1]->trans = sqrt';
        is $stack[0]{result}[0], 'sqrt()', 'to_arg1() = sqrt()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'loS\'ar', 'translate[1]->raw = loS\'ar';
        is $stack[1]{args}[1]{trans}, 'sqrt', 'translate[1]->trans = sqrt';
        is $stack[1]{result}[0], 'loS\'ar', 'translate()->raw = loS\'ar';
        is $stack[1]{result}[1], 'sqrt()', 'translate()->trans = sqrt()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'loS\'ar', 'token->raw = loS\'ar';
        is $stack[2]{args}[2], 'sqrt()', 'token->trans = sqrt()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'loS\'ar', 'arg1->args';
},
sub {
        note "rand(0)";
        my $step = shift;
        is $step, 7, 'step 7';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'mIS', 'to_arg1[1]->raw = mIS';
        is $stack[0]{args}[1]{trans}, 'rand', 'to_arg1[1]->trans = rand';
        is $stack[0]{result}[0], 'rand()', 'to_arg1() = rand()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'mIS', 'translate[1]->raw = mIS';
        is $stack[1]{args}[1]{trans}, 'rand', 'translate[1]->trans = rand';
        is $stack[1]{result}[0], 'mIS', 'translate()->raw = mIS';
        is $stack[1]{result}[1], 'rand()', 'translate()->trans = rand()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'mIS', 'token->raw = mIS';
        is $stack[2]{args}[2], 'rand()', 'token->trans = rand()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'mIS', 'arg1->args';
},
sub {
        note "srand(0)";
        my $step = shift;
        is $step, 8, 'step 8';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'mIScher', 'to_arg1[1]->raw = mIScher';
        is $stack[0]{args}[1]{trans}, 'srand', 'to_arg1[1]->trans = srand';
        is $stack[0]{result}[0], 'srand()', 'to_arg1() = srand()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'mIScher', 'translate[1]->raw = mIScher';
        is $stack[1]{args}[1]{trans}, 'srand', 'translate[1]->trans = srand';
        is $stack[1]{result}[0], 'mIScher', 'translate()->raw = mIScher';
        is $stack[1]{result}[1], 'srand()', 'translate()->trans = srand()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'mIScher', 'token->raw = mIScher';
        is $stack[2]{args}[2], 'srand()', 'token->trans = srand()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'mIScher', 'arg1->args';
},
sub {
        note "lc(0)";
        my $step = shift;
        is $step, 9, 'step 9';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'mach', 'to_arg1[1]->raw = mach';
        is $stack[0]{args}[1]{trans}, 'lc', 'to_arg1[1]->trans = lc';
        is $stack[0]{result}[0], 'lc()', 'to_arg1() = lc()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'mach', 'translate[1]->raw = mach';
        is $stack[1]{args}[1]{trans}, 'lc', 'translate[1]->trans = lc';
        is $stack[1]{result}[0], 'mach', 'translate()->raw = mach';
        is $stack[1]{result}[1], 'lc()', 'translate()->trans = lc()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'mach', 'token->raw = mach';
        is $stack[2]{args}[2], 'lc()', 'token->trans = lc()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'mach', 'arg1->args';
},
sub {
        note "lcfirst(0)";
        my $step = shift;
        is $step, 10, 'step 10';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'wa\'DIchmach', 'to_arg1[1]->raw = wa\'DIchmach';
        is $stack[0]{args}[1]{trans}, 'lcfirst', 'to_arg1[1]->trans = lcfirst';
        is $stack[0]{result}[0], 'lcfirst()', 'to_arg1() = lcfirst()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'wa\'DIchmach', 'translate[1]->raw = wa\'DIchmach';
        is $stack[1]{args}[1]{trans}, 'lcfirst', 'translate[1]->trans = lcfirst';
        is $stack[1]{result}[0], 'wa\'DIchmach', 'translate()->raw = wa\'DIchmach';
        is $stack[1]{result}[1], 'lcfirst()', 'translate()->trans = lcfirst()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'wa\'DIchmach', 'token->raw = wa\'DIchmach';
        is $stack[2]{args}[2], 'lcfirst()', 'token->trans = lcfirst()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'wa\'DIchmach', 'arg1->args';
},
sub {
        note "uc(0)";
        my $step = shift;
        is $step, 11, 'step 11';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'tIn', 'to_arg1[1]->raw = tIn';
        is $stack[0]{args}[1]{trans}, 'uc', 'to_arg1[1]->trans = uc';
        is $stack[0]{result}[0], 'uc()', 'to_arg1() = uc()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'tIn', 'translate[1]->raw = tIn';
        is $stack[1]{args}[1]{trans}, 'uc', 'translate[1]->trans = uc';
        is $stack[1]{result}[0], 'tIn', 'translate()->raw = tIn';
        is $stack[1]{result}[1], 'uc()', 'translate()->trans = uc()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'tIn', 'token->raw = tIn';
        is $stack[2]{args}[2], 'uc()', 'token->trans = uc()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'tIn', 'arg1->args';
},
sub {
        note "ucfirst(0)";
        my $step = shift;
        is $step, 12, 'step 12';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'wa\'DIchtIn', 'to_arg1[1]->raw = wa\'DIchtIn';
        is $stack[0]{args}[1]{trans}, 'ucfirst', 'to_arg1[1]->trans = ucfirst';
        is $stack[0]{result}[0], 'ucfirst()', 'to_arg1() = ucfirst()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'wa\'DIchtIn', 'translate[1]->raw = wa\'DIchtIn';
        is $stack[1]{args}[1]{trans}, 'ucfirst', 'translate[1]->trans = ucfirst';
        is $stack[1]{result}[0], 'wa\'DIchtIn', 'translate()->raw = wa\'DIchtIn';
        is $stack[1]{result}[1], 'ucfirst()', 'translate()->trans = ucfirst()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'wa\'DIchtIn', 'token->raw = wa\'DIchtIn';
        is $stack[2]{args}[2], 'ucfirst()', 'token->trans = ucfirst()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'wa\'DIchtIn', 'arg1->args';
},
sub {
        note "quotemeta(0)";
        my $step = shift;
        is $step, 13, 'step 13';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'nargh', 'to_arg1[1]->raw = nargh';
        is $stack[0]{args}[1]{trans}, 'quotemeta', 'to_arg1[1]->trans = quotemeta';
        is $stack[0]{result}[0], 'quotemeta()', 'to_arg1() = quotemeta()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'nargh', 'translate[1]->raw = nargh';
        is $stack[1]{args}[1]{trans}, 'quotemeta', 'translate[1]->trans = quotemeta';
        is $stack[1]{result}[0], 'nargh', 'translate()->raw = nargh';
        is $stack[1]{result}[1], 'quotemeta()', 'translate()->trans = quotemeta()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'nargh', 'token->raw = nargh';
        is $stack[2]{args}[2], 'quotemeta()', 'token->trans = quotemeta()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'nargh', 'arg1->args';
},
sub {
        note "length(0)";
        my $step = shift;
        is $step, 14, 'step 14';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'juv', 'to_arg1[1]->raw = juv';
        is $stack[0]{args}[1]{trans}, 'length', 'to_arg1[1]->trans = length';
        is $stack[0]{result}[0], 'length()', 'to_arg1() = length()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'juv', 'translate[1]->raw = juv';
        is $stack[1]{args}[1]{trans}, 'length', 'translate[1]->trans = length';
        is $stack[1]{result}[0], 'juv', 'translate()->raw = juv';
        is $stack[1]{result}[1], 'length()', 'translate()->trans = length()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'juv', 'token->raw = juv';
        is $stack[2]{args}[2], 'length()', 'token->trans = length()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'juv', 'arg1->args';
},
sub {
        note "split(0)";
        my $step = shift;
        is $step, 15, 'step 15';
        my @stack = extract_stack($step);
        is scalar(@stack), 7, '7 entries on callstack';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[1]{args}[0]), 'to_arg1[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'SIj', 'to_arg1[1]->raw = SIj';
        is $stack[1]{args}[1]{trans}, 'split', 'to_arg1[1]->trans = split';
        is $stack[1]{result}[0], 'split()', 'to_arg1() = split()';
        is $stack[2]{name}, 'translate', 'name = translate';
        ok !defined($stack[2]{args}[0]), 'translate[0] = undef';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'SIj', 'translate[1]->raw = SIj';
        is $stack[2]{args}[1]{trans}, 'split', 'translate[1]->trans = split';
        is $stack[2]{result}[0], 'SIj', 'translate()->raw = SIj';
        is $stack[2]{result}[1], 'split()', 'translate()->trans = split()';
        is $stack[3]{name}, 'pushtok', 'name = pushtok';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], 'SIj', 'token->raw = SIj';
        is $stack[3]{args}[2], 'split()', 'token->trans = split()';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'SIj', 'arg1->args';
},
sub {
        note "defined(0)";
        my $step = shift;
        is $step, 16, 'step 16';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'toq\'a\'', 'to_arg1[1]->raw = toq\'a\'';
        is $stack[0]{args}[1]{trans}, 'defined', 'to_arg1[1]->trans = defined';
        is $stack[0]{result}[0], 'defined()', 'to_arg1() = defined()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'toq\'a\'', 'translate[1]->raw = toq\'a\'';
        is $stack[1]{args}[1]{trans}, 'defined', 'translate[1]->trans = defined';
        is $stack[1]{result}[0], 'toq\'a\'', 'translate()->raw = toq\'a\'';
        is $stack[1]{result}[1], 'defined()', 'translate()->trans = defined()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'toq\'a\'', 'token->raw = toq\'a\'';
        is $stack[2]{args}[2], 'defined()', 'token->trans = defined()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'toq\'a\'', 'arg1->args';
},
sub {
        note "eof(0)";
        my $step = shift;
        is $step, 17, 'step 17';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'rIn\'a\'', 'to_arg1[1]->raw = rIn\'a\'';
        is $stack[0]{args}[1]{trans}, 'eof', 'to_arg1[1]->trans = eof';
        is $stack[0]{result}[0], 'eof()', 'to_arg1() = eof()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'rIn\'a\'', 'translate[1]->raw = rIn\'a\'';
        is $stack[1]{args}[1]{trans}, 'eof', 'translate[1]->trans = eof';
        is $stack[1]{result}[0], 'rIn\'a\'', 'translate()->raw = rIn\'a\'';
        is $stack[1]{result}[1], 'eof()', 'translate()->trans = eof()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'rIn\'a\'', 'token->raw = rIn\'a\'';
        is $stack[2]{args}[2], 'eof()', 'token->trans = eof()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'rIn\'a\'', 'arg1->args';
},
sub {
        note "exit(0)";
        my $step = shift;
        is $step, 18, 'step 18';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'mej', 'to_arg1[1]->raw = mej';
        is $stack[0]{args}[1]{trans}, 'exit', 'to_arg1[1]->trans = exit';
        is $stack[0]{result}[0], 'exit()', 'to_arg1() = exit()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'mej', 'translate[1]->raw = mej';
        is $stack[1]{args}[1]{trans}, 'exit', 'translate[1]->trans = exit';
        is $stack[1]{result}[0], 'mej', 'translate()->raw = mej';
        is $stack[1]{result}[1], 'exit()', 'translate()->trans = exit()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'mej', 'token->raw = mej';
        is $stack[2]{args}[2], 'exit()', 'token->trans = exit()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'mej', 'arg1->args';
},
sub {
        note "die(0)";
        my $step = shift;
        is $step, 19, 'step 19';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'Hegh', 'to_arg1[1]->raw = Hegh';
        is $stack[0]{args}[1]{trans}, 'die', 'to_arg1[1]->trans = die';
        is $stack[0]{result}[0], 'die()', 'to_arg1() = die()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'Hegh', 'translate[1]->raw = Hegh';
        is $stack[1]{args}[1]{trans}, 'die', 'translate[1]->trans = die';
        is $stack[1]{result}[0], 'Hegh', 'translate()->raw = Hegh';
        is $stack[1]{result}[1], 'die()', 'translate()->trans = die()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'Hegh', 'token->raw = Hegh';
        is $stack[2]{args}[2], 'die()', 'token->trans = die()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'Hegh', 'arg1->args';
},
sub {
        note "warn(0)";
        my $step = shift;
        is $step, 20, 'step 20';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'ghuHmoH', 'to_arg1[1]->raw = ghuHmoH';
        is $stack[0]{args}[1]{trans}, 'warn', 'to_arg1[1]->trans = warn';
        is $stack[0]{result}[0], 'warn()', 'to_arg1() = warn()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'ghuHmoH', 'translate[1]->raw = ghuHmoH';
        is $stack[1]{args}[1]{trans}, 'warn', 'translate[1]->trans = warn';
        is $stack[1]{result}[0], 'ghuHmoH', 'translate()->raw = ghuHmoH';
        is $stack[1]{result}[1], 'warn()', 'translate()->trans = warn()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'ghuHmoH', 'token->raw = ghuHmoH';
        is $stack[2]{args}[2], 'warn()', 'token->trans = warn()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'ghuHmoH', 'arg1->args';
},
sub {
        note "Carp::croak(0)";
        my $step = shift;
        is $step, 21, 'step 21';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'pa\'Hegh', 'to_arg1[1]->raw = pa\'Hegh';
        is $stack[0]{args}[1]{trans}, 'Carp::croak', 'to_arg1[1]->trans = Carp::croak';
        is $stack[0]{result}[0], 'Carp::croak()', 'to_arg1() = Carp::croak()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'pa\'Hegh', 'translate[1]->raw = pa\'Hegh';
        is $stack[1]{args}[1]{trans}, 'Carp::croak', 'translate[1]->trans = Carp::croak';
        is $stack[1]{result}[0], 'pa\'Hegh', 'translate()->raw = pa\'Hegh';
        is $stack[1]{result}[1], 'Carp::croak()', 'translate()->trans = Carp::croak()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'pa\'Hegh', 'token->raw = pa\'Hegh';
        is $stack[2]{args}[2], 'Carp::croak()', 'token->trans = Carp::croak()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'pa\'Hegh', 'arg1->args';
},
sub {
        note "Carp::carp(0)";
        my $step = shift;
        is $step, 22, 'step 22';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'pa\'ghuHmoH', 'to_arg1[1]->raw = pa\'ghuHmoH';
        is $stack[0]{args}[1]{trans}, 'Carp::carp', 'to_arg1[1]->trans = Carp::carp';
        is $stack[0]{result}[0], 'Carp::carp()', 'to_arg1() = Carp::carp()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'pa\'ghuHmoH', 'translate[1]->raw = pa\'ghuHmoH';
        is $stack[1]{args}[1]{trans}, 'Carp::carp', 'translate[1]->trans = Carp::carp';
        is $stack[1]{result}[0], 'pa\'ghuHmoH', 'translate()->raw = pa\'ghuHmoH';
        is $stack[1]{result}[1], 'Carp::carp()', 'translate()->trans = Carp::carp()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'pa\'ghuHmoH', 'token->raw = pa\'ghuHmoH';
        is $stack[2]{args}[2], 'Carp::carp()', 'token->trans = Carp::carp()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'pa\'ghuHmoH', 'arg1->args';
},
sub {
        note "caller(0)";
        my $step = shift;
        is $step, 23, 'step 23';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'pongwI\'', 'to_arg1[1]->raw = pongwI\'';
        is $stack[0]{args}[1]{trans}, 'caller', 'to_arg1[1]->trans = caller';
        is $stack[0]{result}[0], 'caller()', 'to_arg1() = caller()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'pongwI\'', 'translate[1]->raw = pongwI\'';
        is $stack[1]{args}[1]{trans}, 'caller', 'translate[1]->trans = caller';
        is $stack[1]{result}[0], 'pongwI\'', 'translate()->raw = pongwI\'';
        is $stack[1]{result}[1], 'caller()', 'translate()->trans = caller()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'pongwI\'', 'token->raw = pongwI\'';
        is $stack[2]{args}[2], 'caller()', 'token->trans = caller()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'pongwI\'', 'arg1->args';
},
sub {
        note "ref(0)";
        my $step = shift;
        is $step, 24, 'step 24';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'buv', 'to_arg1[1]->raw = buv';
        is $stack[0]{args}[1]{trans}, 'ref', 'to_arg1[1]->trans = ref';
        is $stack[0]{result}[0], 'ref()', 'to_arg1() = ref()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'buv', 'translate[1]->raw = buv';
        is $stack[1]{args}[1]{trans}, 'ref', 'translate[1]->trans = ref';
        is $stack[1]{result}[0], 'buv', 'translate()->raw = buv';
        is $stack[1]{result}[1], 'ref()', 'translate()->trans = ref()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'buv', 'token->raw = buv';
        is $stack[2]{args}[2], 'ref()', 'token->trans = ref()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'buv', 'arg1->args';
},
sub {
        note "stat(0)";
        my $step = shift;
        is $step, 25, 'step 25';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'Del', 'to_arg1[1]->raw = Del';
        is $stack[0]{args}[1]{trans}, 'stat', 'to_arg1[1]->trans = stat';
        is $stack[0]{result}[0], 'stat()', 'to_arg1() = stat()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'Del', 'translate[1]->raw = Del';
        is $stack[1]{args}[1]{trans}, 'stat', 'translate[1]->trans = stat';
        is $stack[1]{result}[0], 'Del', 'translate()->raw = Del';
        is $stack[1]{result}[1], 'stat()', 'translate()->trans = stat()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'Del', 'token->raw = Del';
        is $stack[2]{args}[2], 'stat()', 'token->trans = stat()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'Del', 'arg1->args';
},
sub {
        note "alarm(0)";
        my $step = shift;
        is $step, 26, 'step 26';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'ghum', 'to_arg1[1]->raw = ghum';
        is $stack[0]{args}[1]{trans}, 'alarm', 'to_arg1[1]->trans = alarm';
        is $stack[0]{result}[0], 'alarm()', 'to_arg1() = alarm()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'ghum', 'translate[1]->raw = ghum';
        is $stack[1]{args}[1]{trans}, 'alarm', 'translate[1]->trans = alarm';
        is $stack[1]{result}[0], 'ghum', 'translate()->raw = ghum';
        is $stack[1]{result}[1], 'alarm()', 'translate()->trans = alarm()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'ghum', 'token->raw = ghum';
        is $stack[2]{args}[2], 'alarm()', 'token->trans = alarm()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'ghum', 'arg1->args';
},
sub {
        note "dump(0)";
        my $step = shift;
        is $step, 27, 'step 27';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'mol', 'to_arg1[1]->raw = mol';
        is $stack[0]{args}[1]{trans}, 'dump', 'to_arg1[1]->trans = dump';
        is $stack[0]{result}[0], 'dump()', 'to_arg1() = dump()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'mol', 'translate[1]->raw = mol';
        is $stack[1]{args}[1]{trans}, 'dump', 'translate[1]->trans = dump';
        is $stack[1]{result}[0], 'mol', 'translate()->raw = mol';
        is $stack[1]{result}[1], 'dump()', 'translate()->trans = dump()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'mol', 'token->raw = mol';
        is $stack[2]{args}[2], 'dump()', 'token->trans = dump()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'mol', 'arg1->args';
},
sub {
        note "sleep(0)";
        my $step = shift;
        is $step, 28, 'step 28';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'Qong', 'to_arg1[1]->raw = Qong';
        is $stack[0]{args}[1]{trans}, 'sleep', 'to_arg1[1]->trans = sleep';
        is $stack[0]{result}[0], 'sleep()', 'to_arg1() = sleep()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'Qong', 'translate[1]->raw = Qong';
        is $stack[1]{args}[1]{trans}, 'sleep', 'translate[1]->trans = sleep';
        is $stack[1]{result}[0], 'Qong', 'translate()->raw = Qong';
        is $stack[1]{result}[1], 'sleep()', 'translate()->trans = sleep()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'Qong', 'token->raw = Qong';
        is $stack[2]{args}[2], 'sleep()', 'token->trans = sleep()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'Qong', 'arg1->args';
},
sub {
        note "wait(0)";
        my $step = shift;
        is $step, 29, 'step 29';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'loS', 'to_arg1[1]->raw = loS';
        is $stack[0]{args}[1]{trans}, 'wait', 'to_arg1[1]->trans = wait';
        is $stack[0]{result}[0], 'wait()', 'to_arg1() = wait()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'loS', 'translate[1]->raw = loS';
        is $stack[1]{args}[1]{trans}, 'wait', 'translate[1]->trans = wait';
        is $stack[1]{result}[0], 'loS', 'translate()->raw = loS';
        is $stack[1]{result}[1], 'wait()', 'translate()->trans = wait()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'loS', 'token->raw = loS';
        is $stack[2]{args}[2], 'wait()', 'token->trans = wait()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'loS', 'arg1->args';
},
sub {
        note "localtime(0)";
        my $step = shift;
        is $step, 30, 'step 30';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'SeppoH', 'to_arg1[1]->raw = SeppoH';
        is $stack[0]{args}[1]{trans}, 'localtime', 'to_arg1[1]->trans = localtime';
        is $stack[0]{result}[0], 'localtime()', 'to_arg1() = localtime()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'SeppoH', 'translate[1]->raw = SeppoH';
        is $stack[1]{args}[1]{trans}, 'localtime', 'translate[1]->trans = localtime';
        is $stack[1]{result}[0], 'SeppoH', 'translate()->raw = SeppoH';
        is $stack[1]{result}[1], 'localtime()', 'translate()->trans = localtime()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'SeppoH', 'token->raw = SeppoH';
        is $stack[2]{args}[2], 'localtime()', 'token->trans = localtime()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'SeppoH', 'arg1->args';
},
sub {
        note "gmtime(0)";
        my $step = shift;
        is $step, 31, 'step 31';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[0]{args}[0]), 'to_arg1[0] = undef';
        is $stack[0]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[0]{args}[1]{raw}, 'Qo\'noSpoH', 'to_arg1[1]->raw = Qo\'noSpoH';
        is $stack[0]{args}[1]{trans}, 'gmtime', 'to_arg1[1]->trans = gmtime';
        is $stack[0]{result}[0], 'gmtime()', 'to_arg1() = gmtime()';
        is $stack[1]{name}, 'translate', 'name = translate';
        ok !defined($stack[1]{args}[0]), 'translate[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'Qo\'noSpoH', 'translate[1]->raw = Qo\'noSpoH';
        is $stack[1]{args}[1]{trans}, 'gmtime', 'translate[1]->trans = gmtime';
        is $stack[1]{result}[0], 'Qo\'noSpoH', 'translate()->raw = Qo\'noSpoH';
        is $stack[1]{result}[1], 'gmtime()', 'translate()->trans = gmtime()';
        is $stack[2]{name}, 'pushtok', 'name = pushtok';
        is $stack[2]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[2]{args}[1], 'Qo\'noSpoH', 'token->raw = Qo\'noSpoH';
        is $stack[2]{args}[2], 'gmtime()', 'token->trans = gmtime()';
        is $stack[3]{name}, 'arg1', 'name = arg1';
        is $stack[3]{args}[0], 'Qo\'noSpoH', 'arg1->args';
},
];

# Quiet warnings
BEGIN { $SIG{'__WARN__'} = sub { } }

my @module_args;
BEGIN { push @module_args, 'yIQIj' if $DEBUG; }
BEGIN { push @module_args, 'yImugh' if $TRANSLATE; }
no warnings qw/void/;
use Lingua::tlhInganHol::yIghun @module_args;
nabwIj!
ghommeywIj!
'oHvaD wa' yInob!

pagh yIlIH!
yIHaD!
pagh yIvan!
nabvaD 'olvo' pagh DIch yInob!
pagh yInabvetlh!

wa' yIlIH! #'
yI'ar! #'
wa' yIvan! #'
nabvaD 'olvo' wa' DIch yInob! #'
wa' yInabvetlh! #'

cha' yIlIH! #'
yIjoqtaH! #'
cha' yIvan! #'
nabvaD 'olvo' cha' DIch yInob! #'
cha' yInabvetlh! #'

wej yIlIH! #'
yIjoqtaHHa'! #'
wej yIvan! #'
nabvaD 'olvo' wej DIch yInob! #'
wej yInabvetlh! #'

loS yIlIH! #'
yIpoD! #'
loS yIvan! #'
nabvaD 'olvo' loS DIch yInob! #'
loS yInabvetlh! #'

vagh yIlIH! #'
yImaHghurtaH! #'
vagh yIvan! #'
nabvaD 'olvo' vagh DIch yInob! #'
vagh yInabvetlh! #'

jav yIlIH! #'
yIloS'ar! #'
jav yIvan! #'
nabvaD 'olvo' jav DIch yInob! #'
jav yInabvetlh! #'

Soch yIlIH! #'
yImIS! #'
Soch yIvan! #'
nabvaD 'olvo' Soch DIch yInob! #'
Soch yInabvetlh! #'

chorgh yIlIH! #'
yImIScher! #'
chorgh yIvan! #'
nabvaD 'olvo' chorgh DIch yInob! #'
chorgh yInabvetlh! #'

Hut yIlIH! #'
yImach! #'
Hut yIvan! #'
nabvaD 'olvo' Hut DIch yInob! #'
Hut yInabvetlh! #'

wa'maH yIlIH! #'
yIwa'DIchmach! #'
wa'maH yIvan! #'
nabvaD 'olvo' wa'maH DIch yInob! #'
wa'maH yInabvetlh! #'

wa'maH wa' yIlIH! #'
yItIn! #'
wa'maH wa' yIvan! #'
nabvaD 'olvo' wa'maH wa' DIch yInob! #'
wa'maH wa' yInabvetlh! #'

wa'maH cha' yIlIH! #'
yIwa'DIchtIn! #'
wa'maH cha' yIvan! #'
nabvaD 'olvo' wa'maH cha' DIch yInob! #'
wa'maH cha' yInabvetlh! #'

# TODO: Conflicts with 'yInargh' = last
# wa'maH wej yIlIH! #'
# yInargh! #'
# wa'maH wej yIvan! #'
# nabvaD 'olvo' wa'maH wej DIch yInob! #'
# wa'maH wej yInabvetlh! #'

wa'maH loS yIlIH! #'
yIjuv! #'
wa'maH loS yIvan! #'
nabvaD 'olvo' wa'maH loS DIch yInob! #'
wa'maH loS yInabvetlh! #'

wa'maH vagh yIlIH! #'
ghommeyvaD yISIj yInob! #'
wa'maH vagh yIvan! #'
nabvaD 'olvo' wa'maH vagh DIch yInob! #'
wa'maH vagh yInabvetlh! #'

wa'maH jav yIlIH! #'
yItoq'a'! #'
wa'maH jav yIvan! #'
nabvaD 'olvo' wa'maH jav DIch yInob! #'
wa'maH jav yInabvetlh! #'

# TODO: eof() will wait on STDIN by default
# wa'maH Soch yIlIH! #'
# yIrIn'a'! #'
# wa'maH Soch yIvan! #'
# nabvaD 'olvo' wa'maH Soch DIch yInob! #'
# wa'maH Soch yInabvetlh! #'

# TODO: exit will exit the script
# wa'maH chorgh yIlIH! #'
# yImej! #'
# wa'maH chorgh yIvan! #'
# nabvaD 'olvo' wa'maH chorgh DIch yInob! #'
# wa'maH chorgh yInabvetlh! #'

# TODO: die will exit the script (consider catching it)
# wa'maH Hut yIlIH! #'
# yIHegh! #'
# wa'maH Hut yIvan! #'
# nabvaD 'olvo' wa'maH Hut DIch yInob! #'
# wa'maH Hut yInabvetlh! #'

# TODO: will print a warning
cha'maH yIlIH! #'
yIghuHmoH! #'
cha'maH yIvan! #'
nabvaD 'olvo' cha'maH DIch yInob! #'
cha'maH yInabvetlh! #'

# TODO: Carp::croak will exit the script (consider catching it)
# cha'maH wa' yIlIH! #'
# yIpa'Hegh! #'
# cha'maH wa' yIvan! #'
# nabvaD 'olvo' cha'maH wa' DIch yInob! #'
# cha'maH wa' yInabvetlh! #'

# TODO: will print a warning
cha'maH cha' yIlIH! #'
yIpa'ghuHmoH! #'
cha'maH cha' yIvan! #'
nabvaD 'olvo' cha'maH cha' DIch yInob! #'
cha'maH cha' yInabvetlh! #'

cha'maH wej yIlIH! #'
yIpongwI'! #'
cha'maH wej yIvan! #'
nabvaD 'olvo' cha'maH wej DIch yInob! #'
cha'maH wej yInabvetlh! #'

cha'maH loS yIlIH! #'
yIbuv! #'
cha'maH loS yIvan! #'
nabvaD 'olvo' cha'maH loS DIch yInob! #'
cha'maH loS yInabvetlh! #'

cha'maH vagh yIlIH! #'
yIDel! #'
cha'maH vagh yIvan! #'
nabvaD 'olvo' cha'maH vagh DIch yInob! #'
cha'maH vagh yInabvetlh! #'

# TODO: alarm will kill the script
# cha'maH jav yIlIH! #'
# yIghum ! #'
# cha'maH jav yIvan! #'
# nabvaD 'olvo' cha'maH jav DIch yInob! #'
# cha'maH jav yInabvetlh! #'

# TODO: dump will dump core
# cha'maH Soch yIlIH! #'
# yImol! #'
# cha'maH Soch yIvan! #'
# nabvaD 'olvo' cha'maH Soch DIch yInob! #'
# cha'maH Soch yInabvetlh! #'

# TODO: sleep() will sleep forever
# cha'maH chorgh yIlIH! #'
# yIQong! #'
# cha'maH chorgh yIvan! #'
# nabvaD 'olvo' cha'maH chorgh DIch yInob! #'
# cha'maH chorgh yInabvetlh! #'

cha'maH Hut yIlIH! #'
yIloS! #'
cha'maH Hut yIvan! #'
nabvaD 'olvo' cha'maH Hut DIch yInob! #'
cha'maH Hut yInabvetlh! #'

wejmaH yIlIH! #'
yISeppoH! #'
wejmaH yIvan! #'
nabvaD 'olvo' wejmaH DIch yInob! #'
wejmaH yInabvetlh! #'

wejmaH wa' yIlIH! #'
yIQo'noSpoH! #'
wejmaH wa' yIvan! #'
nabvaD 'olvo' wejmaH wa' DIch yInob! #'
wejmaH wa' yInabvetlh! #'

yIdone_testing!
