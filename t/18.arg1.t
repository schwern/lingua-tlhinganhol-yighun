#!perl -w
# vim:set et si:
#
use Test::More
        tests => 2123
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
        TODO: {
                todo_skip 'quotemeta conflicts with last', 20;
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
        }
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
        SKIP: {
                skip 'eof() will block reading from STDIN', 20;
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
        }
},
sub {
        note "exit(0)";
        my $step = shift;
        is $step, 18, 'step 18';
        my @stack = extract_stack($step);
        SKIP: {
                skip 'exit() will exit the script', 20;
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
        }
},
sub {
        note "die(0)";
        my $step = shift;
        is $step, 19, 'step 19';
        my @stack = extract_stack($step);
        is scalar(@stack), 8, '8 entries on callstack';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[1]{args}[0]), 'to_arg1[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'Hegh', 'to_arg1[1]->raw = Hegh';
        is $stack[1]{args}[1]{trans}, 'die', 'to_arg1[1]->trans = die';
        is $stack[1]{result}[0], 'die()', 'to_arg1() = die()';
        is $stack[2]{name}, 'translate', 'name = translate';
        ok !defined($stack[2]{args}[0]), 'translate[0] = undef';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'Hegh', 'translate[1]->raw = Hegh';
        is $stack[2]{args}[1]{trans}, 'die', 'translate[1]->trans = die';
        is $stack[2]{result}[0], 'Hegh', 'translate()->raw = Hegh';
        is $stack[2]{result}[1], 'die()', 'translate()->trans = die()';
        is $stack[3]{name}, 'pushtok', 'name = pushtok';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], 'Hegh', 'token->raw = Hegh';
        is $stack[3]{args}[2], 'die()', 'token->trans = die()';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'Hegh', 'arg1->args';
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
        is scalar(@stack), 8, '8 entries on callstack';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        ok !defined($stack[1]{args}[0]), 'to_arg1[0] = undef';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'pa\'Hegh', 'to_arg1[1]->raw = pa\'Hegh';
        is $stack[1]{args}[1]{trans}, 'Carp::croak', 'to_arg1[1]->trans = Carp::croak';
        is $stack[1]{result}[0], 'Carp::croak()', 'to_arg1() = Carp::croak()';
        is $stack[2]{name}, 'translate', 'name = translate';
        ok !defined($stack[2]{args}[0]), 'translate[0] = undef';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'pa\'Hegh', 'translate[1]->raw = pa\'Hegh';
        is $stack[2]{args}[1]{trans}, 'Carp::croak', 'translate[1]->trans = Carp::croak';
        is $stack[2]{result}[0], 'pa\'Hegh', 'translate()->raw = pa\'Hegh';
        is $stack[2]{result}[1], 'Carp::croak()', 'translate()->trans = Carp::croak()';
        is $stack[3]{name}, 'pushtok', 'name = pushtok';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], 'pa\'Hegh', 'token->raw = pa\'Hegh';
        is $stack[3]{args}[2], 'Carp::croak()', 'token->trans = Carp::croak()';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'pa\'Hegh', 'arg1->args';
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
        SKIP: {
                skip 'dump() will dump core', 20;
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
        }
},
sub {
        note "sleep(0)";
        my $step = shift;
        is $step, 28, 'step 28';
        my @stack = extract_stack($step);
        SKIP: {
                skip 'sleep() will sleep forever', 20;
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
        }
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
sub {
        note "not(1)";
        my $step = shift;
        is $step, 32, 'step 32';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'tlhoch', 'to_arg1[1]->raw = tlhoch';
        is $stack[1]{args}[1]{trans}, 'not', 'to_arg1[1]->trans = not';
        is $stack[1]{result}[0], 'not($_)', 'to_arg1() = not($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'tlhoch', 'translate[1]->raw = tlhoch';
        is $stack[2]{args}[1]{trans}, 'not', 'translate[1]->trans = not';
        is $stack[2]{result}[0], '\'oH tlhoch', 'translate()->raw = \'oH tlhoch';
        is $stack[2]{result}[1], 'not($_)', 'translate()->trans = not($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH tlhoch', 'token->raw = \'oH tlhoch';
        is $stack[3]{args}[2], 'not($_)', 'token->trans = not($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'tlhoch', 'arg1->args';
},
sub {
        note "reverse(1)";
        my $step = shift;
        is $step, 33, 'step 33';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'noD', 'to_arg1[1]->raw = noD';
        is $stack[1]{args}[1]{trans}, 'reverse', 'to_arg1[1]->trans = reverse';
        is $stack[1]{result}[0], 'reverse($_)', 'to_arg1() = reverse($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'noD', 'translate[1]->raw = noD';
        is $stack[2]{args}[1]{trans}, 'reverse', 'translate[1]->trans = reverse';
        is $stack[2]{result}[0], '\'oH noD', 'translate()->raw = \'oH noD';
        is $stack[2]{result}[1], 'reverse($_)', 'translate()->trans = reverse($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH noD', 'token->raw = \'oH noD';
        is $stack[3]{args}[2], 'reverse($_)', 'token->trans = reverse($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'noD', 'arg1->args';
},
sub {
        note "study(1)";
        my $step = shift;
        is $step, 34, 'step 34';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'HaD', 'to_arg1[1]->raw = HaD';
        is $stack[1]{args}[1]{trans}, 'study', 'to_arg1[1]->trans = study';
        is $stack[1]{result}[0], 'study($_)', 'to_arg1() = study($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'HaD', 'translate[1]->raw = HaD';
        is $stack[2]{args}[1]{trans}, 'study', 'translate[1]->trans = study';
        is $stack[2]{result}[0], '\'oH HaD', 'translate()->raw = \'oH HaD';
        is $stack[2]{result}[1], 'study($_)', 'translate()->trans = study($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH HaD', 'token->raw = \'oH HaD';
        is $stack[3]{args}[2], 'study($_)', 'token->trans = study($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'HaD', 'arg1->args';
},
sub {
        note "tell(1)";
        my $step = shift;
        is $step, 35, 'step 35';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], 'mungna\'vo\'', 'token->raw = mungna\'vo\'';
        is $stack[0]{args}[2], 'STDIN', 'token->trans = STDIN';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, 'mungna\'vo\'', 'to_arg1[0]->raw = mungna\'vo\'';
        is $stack[1]{args}[0]{trans}, 'STDIN', 'to_arg1[0]->trans = STDIN';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'ja\'', 'to_arg1[1]->raw = ja\'';
        is $stack[1]{args}[1]{trans}, 'tell', 'to_arg1[1]->trans = tell';
        is $stack[1]{result}[0], 'tell(STDIN)', 'to_arg1() = tell(STDIN)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, 'mungna\'vo\'', 'translate[0]->raw = mungna\'vo\'';
        is $stack[2]{args}[0]{trans}, 'STDIN', 'translate[0]->trans = STDIN';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'ja\'', 'translate[1]->raw = ja\'';
        is $stack[2]{args}[1]{trans}, 'tell', 'translate[1]->trans = tell';
        is $stack[2]{result}[0], 'mungna\'vo\' ja\'', 'translate()->raw = mungna\'vo\' ja\'';
        is $stack[2]{result}[1], 'tell(STDIN)', 'translate()->trans = tell(STDIN)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], 'mungna\'vo\' ja\'', 'token->raw = mungna\'vo\' ja\'';
        is $stack[3]{args}[2], 'tell(STDIN)', 'token->trans = tell(STDIN)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'ja\'', 'arg1->args';
},
sub {
        note "each(1)";
        my $step = shift;
        is $step, 36, 'step 36';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], 'DIvI\'pu\'', 'token->raw = DIvI\'pu\'';
        is $stack[0]{args}[2], '%DIvIZ', 'token->trans = %DIvIZ';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, 'DIvI\'pu\'', 'to_arg1[0]->raw = DIvI\'pu\'';
        is $stack[1]{args}[0]{trans}, '%DIvIZ', 'to_arg1[0]->trans = %DIvIZ';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'Such', 'to_arg1[1]->raw = Such';
        is $stack[1]{args}[1]{trans}, 'each', 'to_arg1[1]->trans = each';
        is $stack[1]{result}[0], 'each(%DIvIZ)', 'to_arg1() = each(%DIvIZ)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, 'DIvI\'pu\'', 'translate[0]->raw = DIvI\'pu\'';
        is $stack[2]{args}[0]{trans}, '%DIvIZ', 'translate[0]->trans = %DIvIZ';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'Such', 'translate[1]->raw = Such';
        is $stack[2]{args}[1]{trans}, 'each', 'translate[1]->trans = each';
        is $stack[2]{result}[0], 'DIvI\'pu\' Such', 'translate()->raw = DIvI\'pu\' Such';
        is $stack[2]{result}[1], 'each(%DIvIZ)', 'translate()->trans = each(%DIvIZ)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], 'DIvI\'pu\' Such', 'token->raw = DIvI\'pu\' Such';
        is $stack[3]{args}[2], 'each(%DIvIZ)', 'token->trans = each(%DIvIZ)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'Such', 'arg1->args';
},
sub {
        note "exists(1)";
        my $step = shift;
        is $step, 37, 'step 37';
        my @stack = extract_stack($step);
        is scalar(@stack), 8, '8 entries on callstack';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], 'DIvI\'pu\'vo\' \'oH Suq', 'token->raw = DIvI\'pu\'vo\' \'oH Suq';
        is $stack[3]{args}[2], '$DIvIZ{$_}', 'token->trans = $DIvIZ{$_}';
        is $stack[4]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[4]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[4]{args}[0]{raw}, 'DIvI\'pu\'vo\' \'oH Suq', 'to_arg1[0]->raw = DIvI\'pu\'vo\' \'oH Suq';
        is $stack[4]{args}[0]{trans}, '$DIvIZ{$_}', 'to_arg1[0]->trans = $DIvIZ{$_}';
        is $stack[4]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[4]{args}[1]{raw}, 'lI\'a\'', 'to_arg1[1]->raw = lI\'a\'';
        is $stack[4]{args}[1]{trans}, 'exists', 'to_arg1[1]->trans = exists';
        is $stack[4]{result}[0], 'exists($DIvIZ{$_})', 'to_arg1() = exists($DIvIZ{$_})';
        is $stack[5]{name}, 'translate', 'name = translate';
        is $stack[5]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[5]{args}[0]{raw}, 'DIvI\'pu\'vo\' \'oH Suq', 'translate[0]->raw = DIvI\'pu\'vo\' \'oH Suq';
        is $stack[5]{args}[0]{trans}, '$DIvIZ{$_}', 'translate[0]->trans = $DIvIZ{$_}';
        is $stack[5]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[5]{args}[1]{raw}, 'lI\'a\'', 'translate[1]->raw = lI\'a\'';
        is $stack[5]{args}[1]{trans}, 'exists', 'translate[1]->trans = exists';
        is $stack[5]{result}[0], 'DIvI\'pu\'vo\' \'oH Suq lI\'a\'', 'translate()->raw = DIvI\'pu\'vo\' \'oH Suq lI\'a\'';
        is $stack[5]{result}[1], 'exists($DIvIZ{$_})', 'translate()->trans = exists($DIvIZ{$_})';
        is $stack[6]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[6]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[6]{args}[1], 'DIvI\'pu\'vo\' \'oH Suq lI\'a\'', 'token->raw = DIvI\'pu\'vo\' \'oH Suq lI\'a\'';
        is $stack[6]{args}[2], 'exists($DIvIZ{$_})', 'token->trans = exists($DIvIZ{$_})';
        is $stack[7]{name}, 'arg1', 'name = arg1';
        is $stack[7]{args}[0], 'lI\'a\'', 'arg1->args';
},
sub {
        note "keys(1)";
        my $step = shift;
        is $step, 38, 'step 38';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], 'DIvI\'pu\'', 'token->raw = DIvI\'pu\'';
        is $stack[0]{args}[2], '%DIvIZ', 'token->trans = %DIvIZ';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, 'DIvI\'pu\'', 'to_arg1[0]->raw = DIvI\'pu\'';
        is $stack[1]{args}[0]{trans}, '%DIvIZ', 'to_arg1[0]->trans = %DIvIZ';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'pong', 'to_arg1[1]->raw = pong';
        is $stack[1]{args}[1]{trans}, 'keys', 'to_arg1[1]->trans = keys';
        is $stack[1]{result}[0], 'keys(%DIvIZ)', 'to_arg1() = keys(%DIvIZ)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, 'DIvI\'pu\'', 'translate[0]->raw = DIvI\'pu\'';
        is $stack[2]{args}[0]{trans}, '%DIvIZ', 'translate[0]->trans = %DIvIZ';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'pong', 'translate[1]->raw = pong';
        is $stack[2]{args}[1]{trans}, 'keys', 'translate[1]->trans = keys';
        is $stack[2]{result}[0], 'DIvI\'pu\' pong', 'translate()->raw = DIvI\'pu\' pong';
        is $stack[2]{result}[1], 'keys(%DIvIZ)', 'translate()->trans = keys(%DIvIZ)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], 'DIvI\'pu\' pong', 'token->raw = DIvI\'pu\' pong';
        is $stack[3]{args}[2], 'keys(%DIvIZ)', 'token->trans = keys(%DIvIZ)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'pong', 'arg1->args';
},
sub {
        note "abs(1)";
        my $step = shift;
        is $step, 39, 'step 39';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, '\'ar', 'to_arg1[1]->raw = \'ar';
        is $stack[1]{args}[1]{trans}, 'abs', 'to_arg1[1]->trans = abs';
        is $stack[1]{result}[0], 'abs($_)', 'to_arg1() = abs($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, '\'ar', 'translate[1]->raw = \'ar';
        is $stack[2]{args}[1]{trans}, 'abs', 'translate[1]->trans = abs';
        is $stack[2]{result}[0], '\'oH \'ar', 'translate()->raw = \'oH \'ar';
        is $stack[2]{result}[1], 'abs($_)', 'translate()->trans = abs($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH \'ar', 'token->raw = \'oH \'ar';
        is $stack[3]{args}[2], 'abs($_)', 'token->trans = abs($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], '\'ar', 'arg1->args';
},
sub {
        note "sin(1)";
        my $step = shift;
        is $step, 40, 'step 40';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'joqtaH', 'to_arg1[1]->raw = joqtaH';
        is $stack[1]{args}[1]{trans}, 'sin', 'to_arg1[1]->trans = sin';
        is $stack[1]{result}[0], 'sin($_)', 'to_arg1() = sin($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'joqtaH', 'translate[1]->raw = joqtaH';
        is $stack[2]{args}[1]{trans}, 'sin', 'translate[1]->trans = sin';
        is $stack[2]{result}[0], '\'oH joqtaH', 'translate()->raw = \'oH joqtaH';
        is $stack[2]{result}[1], 'sin($_)', 'translate()->trans = sin($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH joqtaH', 'token->raw = \'oH joqtaH';
        is $stack[3]{args}[2], 'sin($_)', 'token->trans = sin($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'joqtaH', 'arg1->args';
},
sub {
        note "cos(1)";
        my $step = shift;
        is $step, 41, 'step 41';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'joqtaHHa\'', 'to_arg1[1]->raw = joqtaHHa\'';
        is $stack[1]{args}[1]{trans}, 'cos', 'to_arg1[1]->trans = cos';
        is $stack[1]{result}[0], 'cos($_)', 'to_arg1() = cos($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'joqtaHHa\'', 'translate[1]->raw = joqtaHHa\'';
        is $stack[2]{args}[1]{trans}, 'cos', 'translate[1]->trans = cos';
        is $stack[2]{result}[0], '\'oH joqtaHHa\'', 'translate()->raw = \'oH joqtaHHa\'';
        is $stack[2]{result}[1], 'cos($_)', 'translate()->trans = cos($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH joqtaHHa\'', 'token->raw = \'oH joqtaHHa\'';
        is $stack[3]{args}[2], 'cos($_)', 'token->trans = cos($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'joqtaHHa\'', 'arg1->args';
},
sub {
        note "int(1)";
        my $step = shift;
        is $step, 42, 'step 42';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'poD', 'to_arg1[1]->raw = poD';
        is $stack[1]{args}[1]{trans}, 'int', 'to_arg1[1]->trans = int';
        is $stack[1]{result}[0], 'int($_)', 'to_arg1() = int($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'poD', 'translate[1]->raw = poD';
        is $stack[2]{args}[1]{trans}, 'int', 'translate[1]->trans = int';
        is $stack[2]{result}[0], '\'oH poD', 'translate()->raw = \'oH poD';
        is $stack[2]{result}[1], 'int($_)', 'translate()->trans = int($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH poD', 'token->raw = \'oH poD';
        is $stack[3]{args}[2], 'int($_)', 'token->trans = int($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'poD', 'arg1->args';
},
sub {
        note "log(1)";
        my $step = shift;
        is $step, 43, 'step 43';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'maHghurtaH', 'to_arg1[1]->raw = maHghurtaH';
        is $stack[1]{args}[1]{trans}, 'log', 'to_arg1[1]->trans = log';
        is $stack[1]{result}[0], 'log($_)', 'to_arg1() = log($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'maHghurtaH', 'translate[1]->raw = maHghurtaH';
        is $stack[2]{args}[1]{trans}, 'log', 'translate[1]->trans = log';
        is $stack[2]{result}[0], '\'oH maHghurtaH', 'translate()->raw = \'oH maHghurtaH';
        is $stack[2]{result}[1], 'log($_)', 'translate()->trans = log($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH maHghurtaH', 'token->raw = \'oH maHghurtaH';
        is $stack[3]{args}[2], 'log($_)', 'token->trans = log($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'maHghurtaH', 'arg1->args';
},
sub {
        note "sqrt(1)";
        my $step = shift;
        is $step, 44, 'step 44';
        my @stack = extract_stack($step);
        TODO: {
        local $TODO = 'Parsing of numbers as parts of words';
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'loS\'ar', 'to_arg1[1]->raw = loS\'ar';
        is $stack[1]{args}[1]{trans}, 'sqrt', 'to_arg1[1]->trans = sqrt';
        is $stack[1]{result}[0], 'sqrt($_)', 'to_arg1() = sqrt($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'loS\'ar', 'translate[1]->raw = loS\'ar';
        is $stack[2]{args}[1]{trans}, 'sqrt', 'translate[1]->trans = sqrt';
        is $stack[2]{result}[0], '\'oH loS\'ar', 'translate()->raw = \'oH loS\'ar';
        is $stack[2]{result}[1], 'sqrt($_)', 'translate()->trans = sqrt($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH loS\'ar', 'token->raw = \'oH loS\'ar';
        is $stack[3]{args}[2], 'sqrt($_)', 'token->trans = sqrt($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'loS\'ar', 'arg1->args';
        }
},
sub {
        note "rand(1)";
        my $step = shift;
        is $step, 45, 'step 45';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'mIS', 'to_arg1[1]->raw = mIS';
        is $stack[1]{args}[1]{trans}, 'rand', 'to_arg1[1]->trans = rand';
        is $stack[1]{result}[0], 'rand($_)', 'to_arg1() = rand($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'mIS', 'translate[1]->raw = mIS';
        is $stack[2]{args}[1]{trans}, 'rand', 'translate[1]->trans = rand';
        is $stack[2]{result}[0], '\'oH mIS', 'translate()->raw = \'oH mIS';
        is $stack[2]{result}[1], 'rand($_)', 'translate()->trans = rand($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH mIS', 'token->raw = \'oH mIS';
        is $stack[3]{args}[2], 'rand($_)', 'token->trans = rand($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'mIS', 'arg1->args';
},
sub {
        note "srand(1)";
        my $step = shift;
        is $step, 46, 'step 46';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'mIScher', 'to_arg1[1]->raw = mIScher';
        is $stack[1]{args}[1]{trans}, 'srand', 'to_arg1[1]->trans = srand';
        is $stack[1]{result}[0], 'srand($_)', 'to_arg1() = srand($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'mIScher', 'translate[1]->raw = mIScher';
        is $stack[2]{args}[1]{trans}, 'srand', 'translate[1]->trans = srand';
        is $stack[2]{result}[0], '\'oH mIScher', 'translate()->raw = \'oH mIScher';
        is $stack[2]{result}[1], 'srand($_)', 'translate()->trans = srand($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH mIScher', 'token->raw = \'oH mIScher';
        is $stack[3]{args}[2], 'srand($_)', 'token->trans = srand($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'mIScher', 'arg1->args';
},
sub {
        note "lc(1)";
        my $step = shift;
        is $step, 47, 'step 47';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'mach', 'to_arg1[1]->raw = mach';
        is $stack[1]{args}[1]{trans}, 'lc', 'to_arg1[1]->trans = lc';
        is $stack[1]{result}[0], 'lc($_)', 'to_arg1() = lc($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'mach', 'translate[1]->raw = mach';
        is $stack[2]{args}[1]{trans}, 'lc', 'translate[1]->trans = lc';
        is $stack[2]{result}[0], '\'oH mach', 'translate()->raw = \'oH mach';
        is $stack[2]{result}[1], 'lc($_)', 'translate()->trans = lc($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH mach', 'token->raw = \'oH mach';
        is $stack[3]{args}[2], 'lc($_)', 'token->trans = lc($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'mach', 'arg1->args';
},
sub {
        note "lcfirst(1)";
        my $step = shift;
        is $step, 48, 'step 48';
        my @stack = extract_stack($step);
        TODO: {
        local $TODO = 'Parsing of numbers as parts of words';
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'wa\'DIchmach', 'to_arg1[1]->raw = wa\'DIchmach';
        is $stack[1]{args}[1]{trans}, 'lcfirst', 'to_arg1[1]->trans = lcfirst';
        is $stack[1]{result}[0], 'lcfirst($_)', 'to_arg1() = lcfirst($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'wa\'DIchmach', 'translate[1]->raw = wa\'DIchmach';
        is $stack[2]{args}[1]{trans}, 'lcfirst', 'translate[1]->trans = lcfirst';
        is $stack[2]{result}[0], '\'oH wa\'DIchmach', 'translate()->raw = \'oH wa\'DIchmach';
        is $stack[2]{result}[1], 'lcfirst($_)', 'translate()->trans = lcfirst($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH wa\'DIchmach', 'token->raw = \'oH wa\'DIchmach';
        is $stack[3]{args}[2], 'lcfirst($_)', 'token->trans = lcfirst($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'wa\'DIchmach', 'arg1->args';
        }
},
sub {
        note "uc(1)";
        my $step = shift;
        is $step, 49, 'step 49';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'tIn', 'to_arg1[1]->raw = tIn';
        is $stack[1]{args}[1]{trans}, 'uc', 'to_arg1[1]->trans = uc';
        is $stack[1]{result}[0], 'uc($_)', 'to_arg1() = uc($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'tIn', 'translate[1]->raw = tIn';
        is $stack[2]{args}[1]{trans}, 'uc', 'translate[1]->trans = uc';
        is $stack[2]{result}[0], '\'oH tIn', 'translate()->raw = \'oH tIn';
        is $stack[2]{result}[1], 'uc($_)', 'translate()->trans = uc($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH tIn', 'token->raw = \'oH tIn';
        is $stack[3]{args}[2], 'uc($_)', 'token->trans = uc($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'tIn', 'arg1->args';
},
sub {
        note "ucfirst(1)";
        my $step = shift;
        is $step, 50, 'step 50';
        my @stack = extract_stack($step);
        TODO: {
        local $TODO = 'Parsing of numbers as parts of words';
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'wa\'DIchtIn', 'to_arg1[1]->raw = wa\'DIchtIn';
        is $stack[1]{args}[1]{trans}, 'ucfirst', 'to_arg1[1]->trans = ucfirst';
        is $stack[1]{result}[0], 'ucfirst($_)', 'to_arg1() = ucfirst($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'wa\'DIchtIn', 'translate[1]->raw = wa\'DIchtIn';
        is $stack[2]{args}[1]{trans}, 'ucfirst', 'translate[1]->trans = ucfirst';
        is $stack[2]{result}[0], '\'oH wa\'DIchtIn', 'translate()->raw = \'oH wa\'DIchtIn';
        is $stack[2]{result}[1], 'ucfirst($_)', 'translate()->trans = ucfirst($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH wa\'DIchtIn', 'token->raw = \'oH wa\'DIchtIn';
        is $stack[3]{args}[2], 'ucfirst($_)', 'token->trans = ucfirst($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'wa\'DIchtIn', 'arg1->args';
        }
},
sub {
        note "quotemeta(1)";
        my $step = shift;
        is $step, 51, 'step 51';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'nargh', 'to_arg1[1]->raw = nargh';
        is $stack[1]{args}[1]{trans}, 'quotemeta', 'to_arg1[1]->trans = quotemeta';
        is $stack[1]{result}[0], 'quotemeta($_)', 'to_arg1() = quotemeta($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'nargh', 'translate[1]->raw = nargh';
        is $stack[2]{args}[1]{trans}, 'quotemeta', 'translate[1]->trans = quotemeta';
        is $stack[2]{result}[0], '\'oH nargh', 'translate()->raw = \'oH nargh';
        is $stack[2]{result}[1], 'quotemeta($_)', 'translate()->trans = quotemeta($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH nargh', 'token->raw = \'oH nargh';
        is $stack[3]{args}[2], 'quotemeta($_)', 'token->trans = quotemeta($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'nargh', 'arg1->args';
},
sub {
        note "length(1)";
        my $step = shift;
        is $step, 52, 'step 52';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'juv', 'to_arg1[1]->raw = juv';
        is $stack[1]{args}[1]{trans}, 'length', 'to_arg1[1]->trans = length';
        is $stack[1]{result}[0], 'length($_)', 'to_arg1() = length($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'juv', 'translate[1]->raw = juv';
        is $stack[2]{args}[1]{trans}, 'length', 'translate[1]->trans = length';
        is $stack[2]{result}[0], '\'oH juv', 'translate()->raw = \'oH juv';
        is $stack[2]{result}[1], 'length($_)', 'translate()->trans = length($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH juv', 'token->raw = \'oH juv';
        is $stack[3]{args}[2], 'length($_)', 'token->trans = length($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'juv', 'arg1->args';
},
sub {
        note "split(1)";
        my $step = shift;
        is $step, 53, 'step 53';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'SIj', 'to_arg1[1]->raw = SIj';
        is $stack[1]{args}[1]{trans}, 'split', 'to_arg1[1]->trans = split';
        is $stack[1]{result}[0], 'split($_)', 'to_arg1() = split($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'SIj', 'translate[1]->raw = SIj';
        is $stack[2]{args}[1]{trans}, 'split', 'translate[1]->trans = split';
        is $stack[2]{result}[0], '\'oH SIj', 'translate()->raw = \'oH SIj';
        is $stack[2]{result}[1], 'split($_)', 'translate()->trans = split($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH SIj', 'token->raw = \'oH SIj';
        is $stack[3]{args}[2], 'split($_)', 'token->trans = split($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'SIj', 'arg1->args';
},
sub {
        note "defined(1)";
        my $step = shift;
        is $step, 54, 'step 54';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'toq\'a\'', 'to_arg1[1]->raw = toq\'a\'';
        is $stack[1]{args}[1]{trans}, 'defined', 'to_arg1[1]->trans = defined';
        is $stack[1]{result}[0], 'defined($_)', 'to_arg1() = defined($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'toq\'a\'', 'translate[1]->raw = toq\'a\'';
        is $stack[2]{args}[1]{trans}, 'defined', 'translate[1]->trans = defined';
        is $stack[2]{result}[0], '\'oH toq\'a\'', 'translate()->raw = \'oH toq\'a\'';
        is $stack[2]{result}[1], 'defined($_)', 'translate()->trans = defined($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH toq\'a\'', 'token->raw = \'oH toq\'a\'';
        is $stack[3]{args}[2], 'defined($_)', 'token->trans = defined($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'toq\'a\'', 'arg1->args';
},
sub {
        note "scalar(1)";
        my $step = shift;
        is $step, 55, 'step 55';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'mob', 'to_arg1[1]->raw = mob';
        is $stack[1]{args}[1]{trans}, 'scalar', 'to_arg1[1]->trans = scalar';
        is $stack[1]{result}[0], 'scalar($_)', 'to_arg1() = scalar($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'mob', 'translate[1]->raw = mob';
        is $stack[2]{args}[1]{trans}, 'scalar', 'translate[1]->trans = scalar';
        is $stack[2]{result}[0], '\'oH mob', 'translate()->raw = \'oH mob';
        is $stack[2]{result}[1], 'scalar($_)', 'translate()->trans = scalar($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH mob', 'token->raw = \'oH mob';
        is $stack[3]{args}[2], 'scalar($_)', 'token->trans = scalar($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'mob', 'arg1->args';
},
sub {
        note "values(1)";
        my $step = shift;
        is $step, 56, 'step 56';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], 'DIvI\'pu\'', 'token->raw = DIvI\'pu\'';
        is $stack[0]{args}[2], '%DIvIZ', 'token->trans = %DIvIZ';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, 'DIvI\'pu\'', 'to_arg1[0]->raw = DIvI\'pu\'';
        is $stack[1]{args}[0]{trans}, '%DIvIZ', 'to_arg1[0]->trans = %DIvIZ';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'lo\'laH', 'to_arg1[1]->raw = lo\'laH';
        is $stack[1]{args}[1]{trans}, 'values', 'to_arg1[1]->trans = values';
        is $stack[1]{result}[0], 'values(%DIvIZ)', 'to_arg1() = values(%DIvIZ)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, 'DIvI\'pu\'', 'translate[0]->raw = DIvI\'pu\'';
        is $stack[2]{args}[0]{trans}, '%DIvIZ', 'translate[0]->trans = %DIvIZ';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'lo\'laH', 'translate[1]->raw = lo\'laH';
        is $stack[2]{args}[1]{trans}, 'values', 'translate[1]->trans = values';
        is $stack[2]{result}[0], 'DIvI\'pu\' lo\'laH', 'translate()->raw = DIvI\'pu\' lo\'laH';
        is $stack[2]{result}[1], 'values(%DIvIZ)', 'translate()->trans = values(%DIvIZ)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], 'DIvI\'pu\' lo\'laH', 'token->raw = DIvI\'pu\' lo\'laH';
        is $stack[3]{args}[2], 'values(%DIvIZ)', 'token->trans = values(%DIvIZ)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'lo\'laH', 'arg1->args';
},
sub {
        note "eof(1)";
        my $step = shift;
        is $step, 57, 'step 57';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'rIn\'a\'', 'to_arg1[1]->raw = rIn\'a\'';
        is $stack[1]{args}[1]{trans}, 'eof', 'to_arg1[1]->trans = eof';
        is $stack[1]{result}[0], 'eof($_)', 'to_arg1() = eof($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'rIn\'a\'', 'translate[1]->raw = rIn\'a\'';
        is $stack[2]{args}[1]{trans}, 'eof', 'translate[1]->trans = eof';
        is $stack[2]{result}[0], '\'oH rIn\'a\'', 'translate()->raw = \'oH rIn\'a\'';
        is $stack[2]{result}[1], 'eof($_)', 'translate()->trans = eof($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH rIn\'a\'', 'token->raw = \'oH rIn\'a\'';
        is $stack[3]{args}[2], 'eof($_)', 'token->trans = eof($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'rIn\'a\'', 'arg1->args';
},
sub {
        note "eval(1)";
        my $step = shift;
        is $step, 58, 'step 58';
        my @stack = extract_stack($step);
        note explain \@stack;
        TODO: {
                todo_skip 'eval STRING not yet implemented', 28;
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'chov', 'to_arg1[1]->raw = chov';
        is $stack[1]{args}[1]{trans}, 'eval', 'to_arg1[1]->trans = eval';
        is $stack[1]{result}[0], 'eval($_)', 'to_arg1() = eval($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'chov', 'translate[1]->raw = chov';
        is $stack[2]{args}[1]{trans}, 'eval', 'translate[1]->trans = eval';
        is $stack[2]{result}[0], '\'oH chov', 'translate()->raw = \'oH chov';
        is $stack[2]{result}[1], 'eval($_)', 'translate()->trans = eval($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH chov', 'token->raw = \'oH chov';
        is $stack[3]{args}[2], 'eval($_)', 'token->trans = eval($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'chov', 'arg1->args';
        }
},
sub {
        note "exit(1)";
        my $step = shift;
        is $step, 59, 'step 59';
        my @stack = extract_stack($step);
        SKIP: {
                skip 'exit($_) will exit the script', 28;
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'mej', 'to_arg1[1]->raw = mej';
        is $stack[1]{args}[1]{trans}, 'exit', 'to_arg1[1]->trans = exit';
        is $stack[1]{result}[0], 'exit($_)', 'to_arg1() = exit($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'mej', 'translate[1]->raw = mej';
        is $stack[2]{args}[1]{trans}, 'exit', 'translate[1]->trans = exit';
        is $stack[2]{result}[0], '\'oH mej', 'translate()->raw = \'oH mej';
        is $stack[2]{result}[1], 'exit($_)', 'translate()->trans = exit($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH mej', 'token->raw = \'oH mej';
        is $stack[3]{args}[2], 'exit($_)', 'token->trans = exit($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'mej', 'arg1->args';
        }
},
sub {
        note "die(1)";
        my $step = shift;
        is $step, 60, 'step 60';
        my @stack = extract_stack($step);
        note explain \@stack;
        is scalar(@stack), 9, '9 entries on callstack';
        is $stack[1]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[1]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[1]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[1]{args}[2], '$_', 'token->trans = $_';
        is $stack[2]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[2]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'Hegh', 'to_arg1[1]->raw = Hegh';
        is $stack[2]{args}[1]{trans}, 'die', 'to_arg1[1]->trans = die';
        is $stack[2]{result}[0], 'die($_)', 'to_arg1() = die($_)';
        is $stack[3]{name}, 'translate', 'name = translate';
        is $stack[3]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[3]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[3]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[3]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[3]{args}[1]{raw}, 'Hegh', 'translate[1]->raw = Hegh';
        is $stack[3]{args}[1]{trans}, 'die', 'translate[1]->trans = die';
        is $stack[3]{result}[0], '\'oH Hegh', 'translate()->raw = \'oH Hegh';
        is $stack[3]{result}[1], 'die($_)', 'translate()->trans = die($_)';
        is $stack[4]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[4]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[4]{args}[1], '\'oH Hegh', 'token->raw = \'oH Hegh';
        is $stack[4]{args}[2], 'die($_)', 'token->trans = die($_)';
        is $stack[5]{name}, 'arg1', 'name = arg1';
        is $stack[5]{args}[0], 'Hegh', 'arg1->args';
},
sub {
        note "warn(1)";
        my $step = shift;
        is $step, 61, 'step 61';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'ghuHmoH', 'to_arg1[1]->raw = ghuHmoH';
        is $stack[1]{args}[1]{trans}, 'warn', 'to_arg1[1]->trans = warn';
        is $stack[1]{result}[0], 'warn($_)', 'to_arg1() = warn($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'ghuHmoH', 'translate[1]->raw = ghuHmoH';
        is $stack[2]{args}[1]{trans}, 'warn', 'translate[1]->trans = warn';
        is $stack[2]{result}[0], '\'oH ghuHmoH', 'translate()->raw = \'oH ghuHmoH';
        is $stack[2]{result}[1], 'warn($_)', 'translate()->trans = warn($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH ghuHmoH', 'token->raw = \'oH ghuHmoH';
        is $stack[3]{args}[2], 'warn($_)', 'token->trans = warn($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'ghuHmoH', 'arg1->args';
},
sub {
        note "Carp::croak(1)";
        my $step = shift;
        is $step, 62, 'step 62';
        my @stack = extract_stack($step);
        is scalar(@stack), 9, '9 entries on callstack';
        is $stack[1]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[1]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[1]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[1]{args}[2], '$_', 'token->trans = $_';
        is $stack[2]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[2]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'pa\'Hegh', 'to_arg1[1]->raw = pa\'Hegh';
        is $stack[2]{args}[1]{trans}, 'Carp::croak', 'to_arg1[1]->trans = Carp::croak';
        is $stack[2]{result}[0], 'Carp::croak($_)', 'to_arg1() = Carp::croak($_)';
        is $stack[3]{name}, 'translate', 'name = translate';
        is $stack[3]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[3]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[3]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[3]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[3]{args}[1]{raw}, 'pa\'Hegh', 'translate[1]->raw = pa\'Hegh';
        is $stack[3]{args}[1]{trans}, 'Carp::croak', 'translate[1]->trans = Carp::croak';
        is $stack[3]{result}[0], '\'oH pa\'Hegh', 'translate()->raw = \'oH pa\'Hegh';
        is $stack[3]{result}[1], 'Carp::croak($_)', 'translate()->trans = Carp::croak($_)';
        is $stack[4]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[4]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[4]{args}[1], '\'oH pa\'Hegh', 'token->raw = \'oH pa\'Hegh';
        is $stack[4]{args}[2], 'Carp::croak($_)', 'token->trans = Carp::croak($_)';
        is $stack[5]{name}, 'arg1', 'name = arg1';
        is $stack[5]{args}[0], 'pa\'Hegh', 'arg1->args';
},
sub {
        note "Carp::carp(1)";
        my $step = shift;
        is $step, 63, 'step 63';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'pa\'ghuHmoH', 'to_arg1[1]->raw = pa\'ghuHmoH';
        is $stack[1]{args}[1]{trans}, 'Carp::carp', 'to_arg1[1]->trans = Carp::carp';
        is $stack[1]{result}[0], 'Carp::carp($_)', 'to_arg1() = Carp::carp($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'pa\'ghuHmoH', 'translate[1]->raw = pa\'ghuHmoH';
        is $stack[2]{args}[1]{trans}, 'Carp::carp', 'translate[1]->trans = Carp::carp';
        is $stack[2]{result}[0], '\'oH pa\'ghuHmoH', 'translate()->raw = \'oH pa\'ghuHmoH';
        is $stack[2]{result}[1], 'Carp::carp($_)', 'translate()->trans = Carp::carp($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH pa\'ghuHmoH', 'token->raw = \'oH pa\'ghuHmoH';
        is $stack[3]{args}[2], 'Carp::carp($_)', 'token->trans = Carp::carp($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'pa\'ghuHmoH', 'arg1->args';
},
sub {
        note "caller(1)";
        my $step = shift;
        is $step, 64, 'step 64';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'pongwI\'', 'to_arg1[1]->raw = pongwI\'';
        is $stack[1]{args}[1]{trans}, 'caller', 'to_arg1[1]->trans = caller';
        is $stack[1]{result}[0], 'caller($_)', 'to_arg1() = caller($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'pongwI\'', 'translate[1]->raw = pongwI\'';
        is $stack[2]{args}[1]{trans}, 'caller', 'translate[1]->trans = caller';
        is $stack[2]{result}[0], '\'oH pongwI\'', 'translate()->raw = \'oH pongwI\'';
        is $stack[2]{result}[1], 'caller($_)', 'translate()->trans = caller($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH pongwI\'', 'token->raw = \'oH pongwI\'';
        is $stack[3]{args}[2], 'caller($_)', 'token->trans = caller($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'pongwI\'', 'arg1->args';
},
sub {
        note "ref(1)";
        my $step = shift;
        is $step, 65, 'step 65';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'buv', 'to_arg1[1]->raw = buv';
        is $stack[1]{args}[1]{trans}, 'ref', 'to_arg1[1]->trans = ref';
        is $stack[1]{result}[0], 'ref($_)', 'to_arg1() = ref($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'buv', 'translate[1]->raw = buv';
        is $stack[2]{args}[1]{trans}, 'ref', 'translate[1]->trans = ref';
        is $stack[2]{result}[0], '\'oH buv', 'translate()->raw = \'oH buv';
        is $stack[2]{result}[1], 'ref($_)', 'translate()->trans = ref($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH buv', 'token->raw = \'oH buv';
        is $stack[3]{args}[2], 'ref($_)', 'token->trans = ref($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'buv', 'arg1->args';
},
sub {
        note "tied(1)";
        my $step = shift;
        is $step, 66, 'step 66';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'bagh\'a\'', 'to_arg1[1]->raw = bagh\'a\'';
        is $stack[1]{args}[1]{trans}, 'tied', 'to_arg1[1]->trans = tied';
        is $stack[1]{result}[0], 'tied($_)', 'to_arg1() = tied($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'bagh\'a\'', 'translate[1]->raw = bagh\'a\'';
        is $stack[2]{args}[1]{trans}, 'tied', 'translate[1]->trans = tied';
        is $stack[2]{result}[0], '\'oH bagh\'a\'', 'translate()->raw = \'oH bagh\'a\'';
        is $stack[2]{result}[1], 'tied($_)', 'translate()->trans = tied($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH bagh\'a\'', 'token->raw = \'oH bagh\'a\'';
        is $stack[3]{args}[2], 'tied($_)', 'token->trans = tied($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'bagh\'a\'', 'arg1->args';
},
sub {
        note "require(1)";
        my $step = shift;
        is $step, 67, 'step 67';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'poQ', 'to_arg1[1]->raw = poQ';
        is $stack[1]{args}[1]{trans}, 'require', 'to_arg1[1]->trans = require';
        is $stack[1]{result}[0], 'require($_)', 'to_arg1() = require($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'poQ', 'translate[1]->raw = poQ';
        is $stack[2]{args}[1]{trans}, 'require', 'translate[1]->trans = require';
        is $stack[2]{result}[0], '\'oH poQ', 'translate()->raw = \'oH poQ';
        is $stack[2]{result}[1], 'require($_)', 'translate()->trans = require($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH poQ', 'token->raw = \'oH poQ';
        is $stack[3]{args}[2], 'require($_)', 'token->trans = require($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'poQ', 'arg1->args';
},
sub {
        note "chdir(1)";
        my $step = shift;
        is $step, 68, 'step 68';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'ghomchoH', 'to_arg1[1]->raw = ghomchoH';
        is $stack[1]{args}[1]{trans}, 'chdir', 'to_arg1[1]->trans = chdir';
        is $stack[1]{result}[0], 'chdir($_)', 'to_arg1() = chdir($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'ghomchoH', 'translate[1]->raw = ghomchoH';
        is $stack[2]{args}[1]{trans}, 'chdir', 'translate[1]->trans = chdir';
        is $stack[2]{result}[0], '\'oH ghomchoH', 'translate()->raw = \'oH ghomchoH';
        is $stack[2]{result}[1], 'chdir($_)', 'translate()->trans = chdir($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH ghomchoH', 'token->raw = \'oH ghomchoH';
        is $stack[3]{args}[2], 'chdir($_)', 'token->trans = chdir($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'ghomchoH', 'arg1->args';
},
sub {
        note "glob(1)";
        my $step = shift;
        is $step, 69, 'step 69';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'Sach', 'to_arg1[1]->raw = Sach';
        is $stack[1]{args}[1]{trans}, 'glob', 'to_arg1[1]->trans = glob';
        is $stack[1]{result}[0], 'glob($_)', 'to_arg1() = glob($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'Sach', 'translate[1]->raw = Sach';
        is $stack[2]{args}[1]{trans}, 'glob', 'translate[1]->trans = glob';
        is $stack[2]{result}[0], '\'oH Sach', 'translate()->raw = \'oH Sach';
        is $stack[2]{result}[1], 'glob($_)', 'translate()->trans = glob($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH Sach', 'token->raw = \'oH Sach';
        is $stack[3]{args}[2], 'glob($_)', 'token->trans = glob($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'Sach', 'arg1->args';
},
sub {
        note "unlink(1)";
        my $step = shift;
        is $step, 70, 'step 70';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'teq', 'to_arg1[1]->raw = teq';
        is $stack[1]{args}[1]{trans}, 'unlink', 'to_arg1[1]->trans = unlink';
        is $stack[1]{result}[0], 'unlink($_)', 'to_arg1() = unlink($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'teq', 'translate[1]->raw = teq';
        is $stack[2]{args}[1]{trans}, 'unlink', 'translate[1]->trans = unlink';
        is $stack[2]{result}[0], '\'oH teq', 'translate()->raw = \'oH teq';
        is $stack[2]{result}[1], 'unlink($_)', 'translate()->trans = unlink($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH teq', 'token->raw = \'oH teq';
        is $stack[3]{args}[2], 'unlink($_)', 'token->trans = unlink($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'teq', 'arg1->args';
},
sub {
        note "mkdir(1)";
        my $step = shift;
        is $step, 71, 'step 71';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'ghomtagh', 'to_arg1[1]->raw = ghomtagh';
        is $stack[1]{args}[1]{trans}, 'mkdir', 'to_arg1[1]->trans = mkdir';
        is $stack[1]{result}[0], 'mkdir($_)', 'to_arg1() = mkdir($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'ghomtagh', 'translate[1]->raw = ghomtagh';
        is $stack[2]{args}[1]{trans}, 'mkdir', 'translate[1]->trans = mkdir';
        is $stack[2]{result}[0], '\'oH ghomtagh', 'translate()->raw = \'oH ghomtagh';
        is $stack[2]{result}[1], 'mkdir($_)', 'translate()->trans = mkdir($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH ghomtagh', 'token->raw = \'oH ghomtagh';
        is $stack[3]{args}[2], 'mkdir($_)', 'token->trans = mkdir($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'ghomtagh', 'arg1->args';
},
sub {
        note "rmdir(1)";
        my $step = shift;
        is $step, 72, 'step 72';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'ghomteq', 'to_arg1[1]->raw = ghomteq';
        is $stack[1]{args}[1]{trans}, 'rmdir', 'to_arg1[1]->trans = rmdir';
        is $stack[1]{result}[0], 'rmdir($_)', 'to_arg1() = rmdir($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'ghomteq', 'translate[1]->raw = ghomteq';
        is $stack[2]{args}[1]{trans}, 'rmdir', 'translate[1]->trans = rmdir';
        is $stack[2]{result}[0], '\'oH ghomteq', 'translate()->raw = \'oH ghomteq';
        is $stack[2]{result}[1], 'rmdir($_)', 'translate()->trans = rmdir($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH ghomteq', 'token->raw = \'oH ghomteq';
        is $stack[3]{args}[2], 'rmdir($_)', 'token->trans = rmdir($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'ghomteq', 'arg1->args';
},
sub {
        note "stat(1)";
        my $step = shift;
        is $step, 73, 'step 73';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'Del', 'to_arg1[1]->raw = Del';
        is $stack[1]{args}[1]{trans}, 'stat', 'to_arg1[1]->trans = stat';
        is $stack[1]{result}[0], 'stat($_)', 'to_arg1() = stat($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'Del', 'translate[1]->raw = Del';
        is $stack[2]{args}[1]{trans}, 'stat', 'translate[1]->trans = stat';
        is $stack[2]{result}[0], '\'oH Del', 'translate()->raw = \'oH Del';
        is $stack[2]{result}[1], 'stat($_)', 'translate()->trans = stat($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH Del', 'token->raw = \'oH Del';
        is $stack[3]{args}[2], 'stat($_)', 'token->trans = stat($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'Del', 'arg1->args';
},
sub {
        note "alarm(1)";
        my $step = shift;
        is $step, 74, 'step 74';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'ghum', 'to_arg1[1]->raw = ghum';
        is $stack[1]{args}[1]{trans}, 'alarm', 'to_arg1[1]->trans = alarm';
        is $stack[1]{result}[0], 'alarm($_)', 'to_arg1() = alarm($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'ghum', 'translate[1]->raw = ghum';
        is $stack[2]{args}[1]{trans}, 'alarm', 'translate[1]->trans = alarm';
        is $stack[2]{result}[0], '\'oH ghum', 'translate()->raw = \'oH ghum';
        is $stack[2]{result}[1], 'alarm($_)', 'translate()->trans = alarm($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH ghum', 'token->raw = \'oH ghum';
        is $stack[3]{args}[2], 'alarm($_)', 'token->trans = alarm($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'ghum', 'arg1->args';
},
sub {
        note "dump(1)";
        my $step = shift;
        is $step, 75, 'step 75';
        my @stack = extract_stack($step);
        SKIP: {
                skip 'dump($_) will dump core', 28;
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'mol', 'to_arg1[1]->raw = mol';
        is $stack[1]{args}[1]{trans}, 'dump', 'to_arg1[1]->trans = dump';
        is $stack[1]{result}[0], 'dump($_)', 'to_arg1() = dump($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'mol', 'translate[1]->raw = mol';
        is $stack[2]{args}[1]{trans}, 'dump', 'translate[1]->trans = dump';
        is $stack[2]{result}[0], '\'oH mol', 'translate()->raw = \'oH mol';
        is $stack[2]{result}[1], 'dump($_)', 'translate()->trans = dump($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH mol', 'token->raw = \'oH mol';
        is $stack[3]{args}[2], 'dump($_)', 'token->trans = dump($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'mol', 'arg1->args';
        }
},
sub {
        note "exec(1)";
        my $step = shift;
        is $step, 76, 'step 76';
        my @stack = extract_stack($step);
        SKIP: {
                skip 'exec($_) will exit the script', 28;
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'tagh', 'to_arg1[1]->raw = tagh';
        is $stack[1]{args}[1]{trans}, 'exec', 'to_arg1[1]->trans = exec';
        is $stack[1]{result}[0], 'exec($_)', 'to_arg1() = exec($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'tagh', 'translate[1]->raw = tagh';
        is $stack[2]{args}[1]{trans}, 'exec', 'translate[1]->trans = exec';
        is $stack[2]{result}[0], '\'oH tagh', 'translate()->raw = \'oH tagh';
        is $stack[2]{result}[1], 'exec($_)', 'translate()->trans = exec($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH tagh', 'token->raw = \'oH tagh';
        is $stack[3]{args}[2], 'exec($_)', 'token->trans = exec($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'tagh', 'arg1->args';
        }
},
sub {
        note "sleep(1)";
        my $step = shift;
        is $step, 77, 'step 77';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'Qong', 'to_arg1[1]->raw = Qong';
        is $stack[1]{args}[1]{trans}, 'sleep', 'to_arg1[1]->trans = sleep';
        is $stack[1]{result}[0], 'sleep($_)', 'to_arg1() = sleep($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'Qong', 'translate[1]->raw = Qong';
        is $stack[2]{args}[1]{trans}, 'sleep', 'translate[1]->trans = sleep';
        is $stack[2]{result}[0], '\'oH Qong', 'translate()->raw = \'oH Qong';
        is $stack[2]{result}[1], 'sleep($_)', 'translate()->trans = sleep($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH Qong', 'token->raw = \'oH Qong';
        is $stack[3]{args}[2], 'sleep($_)', 'token->trans = sleep($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'Qong', 'arg1->args';
},
sub {
        note "system(1)";
        my $step = shift;
        is $step, 78, 'step 78';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'ra\'', 'to_arg1[1]->raw = ra\'';
        is $stack[1]{args}[1]{trans}, 'system', 'to_arg1[1]->trans = system';
        is $stack[1]{result}[0], 'system($_)', 'to_arg1() = system($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'ra\'', 'translate[1]->raw = ra\'';
        is $stack[2]{args}[1]{trans}, 'system', 'translate[1]->trans = system';
        is $stack[2]{result}[0], '\'oH ra\'', 'translate()->raw = \'oH ra\'';
        is $stack[2]{result}[1], 'system($_)', 'translate()->trans = system($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH ra\'', 'token->raw = \'oH ra\'';
        is $stack[3]{args}[2], 'system($_)', 'token->trans = system($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'ra\'', 'arg1->args';
},
sub {
        note "wait(1)";
        my $step = shift;
        is $step, 79, 'step 79';
        my @stack = extract_stack($step);
        note explain \@stack;
        TODO: {
                todo_skip 'parsing of numbers; ambiguity with wait', 28;
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'loS', 'to_arg1[1]->raw = loS';
        is $stack[1]{args}[1]{trans}, 'wait', 'to_arg1[1]->trans = wait';
        is $stack[1]{result}[0], 'wait($_)', 'to_arg1() = wait($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'loS', 'translate[1]->raw = loS';
        is $stack[2]{args}[1]{trans}, 'wait', 'translate[1]->trans = wait';
        is $stack[2]{result}[0], '\'oH loS', 'translate()->raw = \'oH loS';
        is $stack[2]{result}[1], 'wait($_)', 'translate()->trans = wait($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH loS', 'token->raw = \'oH loS';
        is $stack[3]{args}[2], 'wait($_)', 'token->trans = wait($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'loS', 'arg1->args';
        }
},
sub {
        note "localtime(1)";
        my $step = shift;
        is $step, 80, 'step 80';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'SeppoH', 'to_arg1[1]->raw = SeppoH';
        is $stack[1]{args}[1]{trans}, 'localtime', 'to_arg1[1]->trans = localtime';
        is $stack[1]{result}[0], 'localtime($_)', 'to_arg1() = localtime($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'SeppoH', 'translate[1]->raw = SeppoH';
        is $stack[2]{args}[1]{trans}, 'localtime', 'translate[1]->trans = localtime';
        is $stack[2]{result}[0], '\'oH SeppoH', 'translate()->raw = \'oH SeppoH';
        is $stack[2]{result}[1], 'localtime($_)', 'translate()->trans = localtime($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH SeppoH', 'token->raw = \'oH SeppoH';
        is $stack[3]{args}[2], 'localtime($_)', 'token->trans = localtime($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'SeppoH', 'arg1->args';
},
sub {
        note "gmtime(1)";
        my $step = shift;
        is $step, 81, 'step 81';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'name = pushtok(arg)';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '\'oH', 'token->raw = \'oH';
        is $stack[0]{args}[2], '$_', 'token->trans = $_';
        is $stack[1]{name}, 'to_arg1', 'name = to_arg1';
        is $stack[1]{args}[0]{type}, 'acc', 'to_arg1[0]->type = acc';
        is $stack[1]{args}[0]{raw}, '\'oH', 'to_arg1[0]->raw = \'oH';
        is $stack[1]{args}[0]{trans}, '$_', 'to_arg1[0]->trans = $_';
        is $stack[1]{args}[1]{type}, 'verb', 'to_arg1[1]->type = verb';
        is $stack[1]{args}[1]{raw}, 'Qo\'noSpoH', 'to_arg1[1]->raw = Qo\'noSpoH';
        is $stack[1]{args}[1]{trans}, 'gmtime', 'to_arg1[1]->trans = gmtime';
        is $stack[1]{result}[0], 'gmtime($_)', 'to_arg1() = gmtime($_)';
        is $stack[2]{name}, 'translate', 'name = translate';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type = acc';
        is $stack[2]{args}[0]{raw}, '\'oH', 'translate[0]->raw = \'oH';
        is $stack[2]{args}[0]{trans}, '$_', 'translate[0]->trans = $_';
        is $stack[2]{args}[1]{type}, 'verb', 'translate[1]->type = verb';
        is $stack[2]{args}[1]{raw}, 'Qo\'noSpoH', 'translate[1]->raw = Qo\'noSpoH';
        is $stack[2]{args}[1]{trans}, 'gmtime', 'translate[1]->trans = gmtime';
        is $stack[2]{result}[0], '\'oH Qo\'noSpoH', 'translate()->raw = \'oH Qo\'noSpoH';
        is $stack[2]{result}[1], 'gmtime($_)', 'translate()->trans = gmtime($_)';
        is $stack[3]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[3]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[3]{args}[1], '\'oH Qo\'noSpoH', 'token->raw = \'oH Qo\'noSpoH';
        is $stack[3]{args}[2], 'gmtime($_)', 'token->trans = gmtime($_)';
        is $stack[4]{name}, 'arg1', 'name = arg1';
        is $stack[4]{args}[0], 'Qo\'noSpoH', 'arg1->args';
},
];

# Quiet warnings and ignore alarms
BEGIN {
        $SIG{'__WARN__'} = sub { };
        $SIG{ALRM} = sub { };
}

my @module_args;
BEGIN { push @module_args, 'yIQIj' if $DEBUG; }
BEGIN { push @module_args, 'yImugh' if $TRANSLATE; }
no warnings qw/void/;
use Lingua::tlhInganHol::yIghun @module_args;
nabwIj!
ghommeywIj!
DIvI'pu'wI'! #'
DIchmachwIj! DIchtInwIj!
'oHvaD wa' yInob! #'

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

# TODO: 'nargh' = quotemeta conflicts with 'yInargh' = last
wa'maH wej yIlIH! #'
# yInargh! #'
wa'maH wej yIvan! #'
nabvaD 'olvo' wa'maH wej DIch yInob! #'
wa'maH wej yInabvetlh! #'

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
wa'maH Soch yIlIH! #'
# yIrIn'a'! #'
wa'maH Soch yIvan! #'
nabvaD 'olvo' wa'maH Soch DIch yInob! #'
wa'maH Soch yInabvetlh! #'

# TODO: exit will exit the script
wa'maH chorgh yIlIH! #'
# yImej! #'
wa'maH chorgh yIvan! #'
nabvaD 'olvo' wa'maH chorgh DIch yInob! #'
wa'maH chorgh yInabvetlh! #'

wa'maH Hut yIlIH! #'
{ yIHegh! } yIchov! #'
wa'maH Hut yIvan! #'
nabvaD 'olvo' wa'maH Hut DIch yInob! #'
wa'maH Hut yInabvetlh! #'

cha'maH yIlIH! #'
yIghuHmoH! #'
cha'maH yIvan! #'
nabvaD 'olvo' cha'maH DIch yInob! #'
cha'maH yInabvetlh! #'

cha'maH wa' yIlIH! #'
{ yIpa'Hegh! } yIchov! #'
cha'maH wa' yIvan! #'
nabvaD 'olvo' cha'maH wa' DIch yInob! #'
cha'maH wa' yInabvetlh! #'

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

cha'maH jav yIlIH! #'
yIghum ! #'
cha'maH jav yIvan! #'
nabvaD 'olvo' cha'maH jav DIch yInob! #'
cha'maH jav yInabvetlh! #'

# TODO: dump will dump core
cha'maH Soch yIlIH! #'
# yImol! #'
cha'maH Soch yIvan! #'
nabvaD 'olvo' cha'maH Soch DIch yInob! #'
cha'maH Soch yInabvetlh! #'

# TODO: sleep() will sleep forever
cha'maH chorgh yIlIH! #'
# yIQong! #'
cha'maH chorgh yIvan! #'
nabvaD 'olvo' cha'maH chorgh DIch yInob! #'
cha'maH chorgh yInabvetlh! #'

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

'oHvaD wa' yInob! #'

wejmaH cha' yIlIH! #'
'oH tlhoch! #'
wejmaH cha' yIvan! #'
nabvaD 'olvo' wejmaH cha' DIch yInob! #'
wejmaH cha' yInabvetlh! #'

wejmaH wej yIlIH! #'
'oH noD! #'
wejmaH wej yIvan! #'
nabvaD 'olvo' wejmaH wej DIch yInob! #'
wejmaH wej yInabvetlh! #'

wejmaH loS yIlIH! #'
'oH HaD! #'
wejmaH loS yIvan! #'
nabvaD 'olvo' wejmaH loS DIch yInob! #'
wejmaH loS yInabvetlh! #'

wejmaH vagh yIlIH! #'
mungna'vo' yIja'! #'
wejmaH vagh yIvan! #'
nabvaD 'olvo' wejmaH vagh DIch yInob! #'
wejmaH vagh yInabvetlh! #'

wejmaH jav yIlIH! #'
DIvI'pu' yISuch! #'
wejmaH jav yIvan! #'
nabvaD 'olvo' wejmaH jav DIch yInob! #'
wejmaH jav yInabvetlh! #'

wejmaH Soch yIlIH! #'
DIvI'pu'vo' 'oH Suq lI'a'! #'
wejmaH Soch yIvan! #'
nabvaD 'olvo' wejmaH Soch DIch yInob! #'
wejmaH Soch yInabvetlh! #'

wejmaH chorgh yIlIH! #'
DIvI'pu' yIpong! #'
wejmaH chorgh yIvan! #'
nabvaD 'olvo' wejmaH chorgh DIch yInob! #'
wejmaH chorgh yInabvetlh! #'

wejmaH Hut yIlIH! #'
'oH 'ar! #'
wejmaH Hut yIvan! #'
nabvaD 'olvo' wejmaH Hut DIch yInob! #'
wejmaH Hut yInabvetlh! #'

loSmaH yIlIH! #'
'oH yIjoqtaH! #'
loSmaH yIvan! #'
nabvaD 'olvo' loSmaH DIch yInob! #'
loSmaH yInabvetlh! #'

loSmaH wa' yIlIH! #'
'oH yIjoqtaHHa'! #'
loSmaH wa' yIvan! #'
nabvaD 'olvo' loSmaH wa' DIch yInob! #'
loSmaH wa' yInabvetlh! #'

loSmaH cha' yIlIH! #'
'oH poD! #'
loSmaH cha' yIvan! #'
nabvaD 'olvo' loSmaH cha' DIch yInob! #'
loSmaH cha' yInabvetlh! #'

loSmaH wej yIlIH! #'
'oH maHghurtaH! #'
loSmaH wej yIvan! #'
nabvaD 'olvo' loSmaH wej DIch yInob! #'
loSmaH wej yInabvetlh! #'

loSmaH loS yIlIH! #'
'oH loS'ar! #'
loSmaH loS yIvan! #'
nabvaD 'olvo' loSmaH loS DIch yInob! #'
loSmaH loS yInabvetlh! #'

loSmaH vagh yIlIH! #'
'oH mIS! #'
loSmaH vagh yIvan! #'
nabvaD 'olvo' loSmaH vagh DIch yInob! #'
loSmaH vagh yInabvetlh! #'

loSmaH jav yIlIH! #'
'oH mIScher! #'
loSmaH jav yIvan! #'
nabvaD 'olvo' loSmaH jav DIch yInob! #'
loSmaH jav yInabvetlh! #'

loSmaH Soch yIlIH! #'
'oH mach! #'
loSmaH Soch yIvan! #'
nabvaD 'olvo' loSmaH Soch DIch yInob! #'
loSmaH Soch yInabvetlh! #'

loSmaH chorgh yIlIH! #'
'oH wa'DIchmach! #'
loSmaH chorgh yIvan! #'
nabvaD 'olvo' loSmaH chorgh DIch yInob! #'
loSmaH chorgh yInabvetlh! #'

loSmaH Hut yIlIH! #'
'oH tIn! #'
loSmaH Hut yIvan! #'
nabvaD 'olvo' loSmaH Hut DIch yInob! #'
loSmaH Hut yInabvetlh! #'

vaghmaH yIlIH! #'
'oH wa'DIchtIn! #'
vaghmaH yIvan! #'
nabvaD 'olvo' vaghmaH DIch yInob! #'
vaghmaH yInabvetlh! #'

vaghmaH wa' yIlIH! #'
'oH nargh! #'
vaghmaH wa' yIvan! #'
nabvaD 'olvo' vaghmaH wa' DIch yInob! #'
vaghmaH wa' yInabvetlh! #'

vaghmaH cha' yIlIH! #'
'oH juv! #'
vaghmaH cha' yIvan! #'
nabvaD 'olvo' vaghmaH cha' DIch yInob! #'
vaghmaH cha' yInabvetlh! #'

vaghmaH wej yIlIH! #'
'oH SIj! #'
vaghmaH wej yIvan! #'
nabvaD 'olvo' vaghmaH wej DIch yInob! #'
vaghmaH wej yInabvetlh! #'

vaghmaH loS yIlIH! #'
'oH toq'a'! #'
vaghmaH loS yIvan! #'
nabvaD 'olvo' vaghmaH loS DIch yInob! #'
vaghmaH loS yInabvetlh! #'

vaghmaH vagh yIlIH! #'
'oH mob! #'
vaghmaH vagh yIvan! #'
nabvaD 'olvo' vaghmaH vagh DIch yInob! #'
vaghmaH vagh yInabvetlh! #'

vaghmaH jav yIlIH! #'
DIvI'pu' lo'laH! #'
vaghmaH jav yIvan! #'
nabvaD 'olvo' vaghmaH jav DIch yInob! #'
vaghmaH jav yInabvetlh! #'

vaghmaH Soch yIlIH! #'
'oH rIn'a'! #'
vaghmaH Soch yIvan! #'
nabvaD 'olvo' vaghmaH Soch DIch yInob! #'
vaghmaH Soch yInabvetlh! #'

vaghmaH chorgh yIlIH! #'
'oH chov! #'
vaghmaH chorgh yIvan! #'
nabvaD 'olvo' vaghmaH chorgh DIch yInob! #'
vaghmaH chorgh yInabvetlh! #'

# TODO: exit($_) will exit the script
vaghmaH Hut yIlIH! #'
# 'oH mej! #'
vaghmaH Hut yIvan! #'
nabvaD 'olvo' vaghmaH Hut DIch yInob! #'
vaghmaH Hut yInabvetlh! #'

javmaH yIlIH! #'
{ 'oH Hegh! } chov! #'
javmaH yIvan! #'
nabvaD 'olvo' javmaH DIch yInob! #'
javmaH yInabvetlh! #'

javmaH wa' yIlIH! #'
'oH ghuHmoH! #'
javmaH wa' yIvan! #'
nabvaD 'olvo' javmaH wa' DIch yInob! #'
javmaH wa' yInabvetlh! #'

javmaH cha' yIlIH! #'
{ 'oH pa'Hegh! } chov! #'
javmaH cha' yIvan! #'
nabvaD 'olvo' javmaH cha' DIch yInob! #'
javmaH cha' yInabvetlh! #'

javmaH wej yIlIH! #'
'oH pa'ghuHmoH! #'
javmaH wej yIvan! #'
nabvaD 'olvo' javmaH wej DIch yInob! #'
javmaH wej yInabvetlh! #'

javmaH loS yIlIH! #'
'oH pongwI'! #'
javmaH loS yIvan! #'
nabvaD 'olvo' javmaH loS DIch yInob! #'
javmaH loS yInabvetlh! #'

javmaH vagh yIlIH! #'
'oH buv! #'
javmaH vagh yIvan! #'
nabvaD 'olvo' javmaH vagh DIch yInob! #'
javmaH vagh yInabvetlh! #'

javmaH jav yIlIH! #'
'oH bagh'a'! #'
javmaH jav yIvan! #'
nabvaD 'olvo' javmaH jav DIch yInob! #'
javmaH jav yInabvetlh! #'

'oHvaD wa' yInob!

javmaH Soch yIlIH! #'
'oH poQ! #'
javmaH Soch yIvan! #'
nabvaD 'olvo' javmaH Soch DIch yInob! #'
javmaH Soch yInabvetlh! #'

javmaH chorgh yIlIH! #'
'oH ghomchoH! #'
javmaH chorgh yIvan! #'
nabvaD 'olvo' javmaH chorgh DIch yInob! #'
javmaH chorgh yInabvetlh! #'

javmaH Hut yIlIH! #'
'oH Sach! #'
javmaH Hut yIvan! #'
nabvaD 'olvo' javmaH Hut DIch yInob! #'
javmaH Hut yInabvetlh! #'

SochmaH yIlIH! #'
'oH teq! #'
SochmaH yIvan! #'
nabvaD 'olvo' SochmaH DIch yInob! #'
SochmaH yInabvetlh! #'

SochmaH wa' yIlIH! #'
'oH ghomtagh! #'
SochmaH wa' yIvan! #'
nabvaD 'olvo' SochmaH wa' DIch yInob! #'
SochmaH wa' yInabvetlh! #'

SochmaH cha' yIlIH! #'
'oH ghomteq! #'
SochmaH cha' yIvan! #'
nabvaD 'olvo' SochmaH cha' DIch yInob! #'
SochmaH cha' yInabvetlh! #'

SochmaH wej yIlIH! #'
'oH Del! #'
SochmaH wej yIvan! #'
nabvaD 'olvo' SochmaH wej DIch yInob! #'
SochmaH wej yInabvetlh! #'

SochmaH loS yIlIH! #'
'oH ghum! #'
SochmaH loS yIvan! #'
nabvaD 'olvo' SochmaH loS DIch yInob! #'
SochmaH loS yInabvetlh! #'

# TODO: dump($_) will dump core
SochmaH vagh yIlIH! #'
# 'oH mol! #'
SochmaH vagh yIvan! #'
nabvaD 'olvo' SochmaH vagh DIch yInob! #'
SochmaH vagh yInabvetlh! #'

# TODO: exec($_) will exit the script
SochmaH jav yIlIH! #'
# 'oH tagh! #'
SochmaH jav yIvan! #'
nabvaD 'olvo' SochmaH jav DIch yInob! #'
SochmaH jav yInabvetlh! #'

SochmaH Soch yIlIH! #'
'oH Qong! #'
SochmaH Soch yIvan! #'
nabvaD 'olvo' SochmaH Soch DIch yInob! #'
SochmaH Soch yInabvetlh! #'

SochmaH chorgh yIlIH! #'
'oH ra'! #'
SochmaH chorgh yIvan! #'
nabvaD 'olvo' SochmaH chorgh DIch yInob! #'
SochmaH chorgh yInabvetlh! #'

SochmaH Hut yIlIH! #'
'oH loS! #'
SochmaH Hut yIvan! #'
nabvaD 'olvo' SochmaH Hut DIch yInob! #'
SochmaH Hut yInabvetlh! #'

chorghmaH yIlIH! #'
'oH SeppoH! #'
chorghmaH yIvan! #'
nabvaD 'olvo' chorghmaH DIch yInob! #'
chorghmaH yInabvetlh! #'

chorghmaH wa' yIlIH! #'
'oH Qo'noSpoH! #'
chorghmaH wa' yIvan! #'
nabvaD 'olvo' chorghmaH wa' DIch yInob! #'
chorghmaH wa' yInabvetlh! #'

yIdone_testing!
