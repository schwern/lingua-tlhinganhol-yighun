#!perl -w
# vim:set et si:
#
use Test::More
        tests => 483
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
        to_arg2
        to_arg2_da
        to_arg2_a
        arg2
        arg2_da
        arg2_a
);
}

my $Zol = [
sub {
        note "atan2";
        my $step = shift;
        is $step, 0, 'step 0';
        my @stack = extract_stack($step);
        is scalar(@stack), 12, '12 entries on callstack';
        is $stack[2]{name}, 'to_arg2', 'name = to_arg2';
        is scalar(@{$stack[2]{args}}), 3, '3 arguments to to_arg2';
        is $stack[2]{args}[0]{trans}, '1', 'to_arg2[0]->trans = 1';
        is $stack[2]{args}[1]{trans}, '2', 'to_arg2[1]->trans = 2';
        is $stack[2]{args}[2]{type}, 'verb', 'to_arg2[2]->type = verb';
        is $stack[2]{args}[2]{raw}, 'qojHa\'', 'to_arg2[2]->raw = qojHa\'';
        is $stack[2]{args}[2]{trans}, 'atan2', 'to_arg2[2]->trans = atan2';
        is $stack[2]{result}[0], 'atan2(1, 2)', 'to_arg2() = atan2(1, 2)';
        is $stack[3]{name}, 'translate', 'name = translate';
        is scalar(@{$stack[3]{args}}), 3, '3 arguments to translate';
        is $stack[3]{args}[0]{trans}, '1', 'translate[0]->trans = 1';
        is $stack[3]{args}[1]{trans}, '2', 'translate[1]->trans = 2';
        is $stack[3]{args}[2]{type}, 'verb', 'translate[2]->type = verb';
        is $stack[3]{args}[2]{raw}, 'qojHa\'', 'translate[2]->raw = qojHa\'';
        is $stack[3]{args}[2]{trans}, 'atan2', 'translate[2]->trans = atan2';
        is $stack[3]{result}[0], 'wa\' cha\' qojHa\'', 'translate()->raw = wa\' cha\' qojHa\'';
        is $stack[3]{result}[1], 'atan2(1, 2)', 'translate()->trans = atan2(1, 2)';
        is $stack[4]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[4]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[4]{args}[1], 'wa\' cha\' qojHa\'', 'token->raw = wa\' cha\' qojHa\'';
        is $stack[4]{args}[2], 'atan2(1, 2)', 'token->trans = atan2(1, 2)';
        is $stack[5]{name}, 'arg2', 'name = arg2';
        is $stack[5]{args}[0], 'qojHa\'', 'arg2->args';
        is $stack[8]{name}, 'to_arg2', 'name = to_arg2';
        is scalar(@{$stack[8]{args}}), 3, '3 arguments to to_arg2';
        is $stack[8]{args}[0]{trans}, '1', 'to_arg2[0]->trans = 1';
        is $stack[8]{args}[1]{trans}, '2', 'to_arg2[1]->trans = 2';
        is $stack[8]{args}[2]{type}, 'verb', 'to_arg2[2]->type = verb';
        is $stack[8]{args}[2]{raw}, 'qojHa\'', 'to_arg2[2]->raw = qojHa\'';
        is $stack[8]{args}[2]{trans}, 'atan2', 'to_arg2[2]->trans = atan2';
        is $stack[8]{result}[0], 'atan2(1, 2)', 'to_arg2() = atan2(1, 2)';
        is $stack[9]{name}, 'translate', 'name = translate';
        is scalar(@{$stack[9]{args}}), 3, '3 arguments to translate';
        is $stack[9]{args}[0]{trans}, '1', 'translate[0]->trans = 1';
        is $stack[9]{args}[1]{trans}, '2', 'translate[1]->trans = 2';
        is $stack[9]{args}[2]{type}, 'verb', 'translate[2]->type = verb';
        is $stack[9]{args}[2]{raw}, 'qojHa\'', 'translate[2]->raw = qojHa\'';
        is $stack[9]{args}[2]{trans}, 'atan2', 'translate[2]->trans = atan2';
        is $stack[9]{result}[0], 'wa\' cha\' qojHa\'', 'translate()->raw = wa\' cha\' qojHa\'';
        is $stack[9]{result}[1], 'atan2(1, 2)', 'translate()->trans = atan2(1, 2)';
        is $stack[10]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[10]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[10]{args}[1], 'wa\' cha\' qojHa\'', 'token->raw = wa\' cha\' qojHa\'';
        is $stack[10]{args}[2], 'atan2(1, 2)', 'token->trans = atan2(1, 2)';
        is $stack[11]{name}, 'arg2', 'name = arg2';
        is $stack[11]{args}[0], 'qojHa\'', 'arg2->args';
},
sub {
        note "crypt";
        my $step = shift;
        is $step, 1, 'step 1';
        my @stack = extract_stack($step);
        is scalar(@stack), 12, '12 entries on callstack';
        is $stack[2]{name}, 'to_arg2', 'name = to_arg2';
        is scalar(@{$stack[2]{args}}), 3, '3 arguments to to_arg2';
        is $stack[2]{args}[0]{trans}, 'q<ABC>', 'to_arg2[0]->trans = q<ABC>';
        is $stack[2]{args}[1]{trans}, 'q<DE>', 'to_arg2[1]->trans = q<DE>';
        is $stack[2]{args}[2]{type}, 'verb', 'to_arg2[2]->type = verb';
        is $stack[2]{args}[2]{raw}, 'So\'', 'to_arg2[2]->raw = So\'';
        is $stack[2]{args}[2]{trans}, 'crypt', 'to_arg2[2]->trans = crypt';
        is $stack[2]{result}[0], 'crypt(q<ABC>, q<DE>)', 'to_arg2() = crypt(q<ABC>, q<DE>)';
        is $stack[3]{name}, 'translate', 'name = translate';
        is scalar(@{$stack[3]{args}}), 3, '3 arguments to translate';
        is $stack[3]{args}[0]{trans}, 'q<ABC>', 'translate[0]->trans = q<ABC>';
        is $stack[3]{args}[1]{trans}, 'q<DE>', 'translate[1]->trans = q<DE>';
        is $stack[3]{args}[2]{type}, 'verb', 'translate[2]->type = verb';
        is $stack[3]{args}[2]{raw}, 'So\'', 'translate[2]->raw = So\'';
        is $stack[3]{args}[2]{trans}, 'crypt', 'translate[2]->trans = crypt';
        is $stack[3]{result}[0], '<ABC> <DE> So\'', 'translate()->raw = <ABC> <DE> So\'';
        is $stack[3]{result}[1], 'crypt(q<ABC>, q<DE>)', 'translate()->trans = crypt(q<ABC>, q<DE>)';
        is $stack[4]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[4]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[4]{args}[1], '<ABC> <DE> So\'', 'token->raw = <ABC> <DE> So\'';
        is $stack[4]{args}[2], 'crypt(q<ABC>, q<DE>)', 'token->trans = crypt(q<ABC>, q<DE>)';
        is $stack[5]{name}, 'arg2', 'name = arg2';
        is $stack[5]{args}[0], 'So\'', 'arg2->args';
        is $stack[8]{name}, 'to_arg2', 'name = to_arg2';
        is scalar(@{$stack[8]{args}}), 3, '3 arguments to to_arg2';
        is $stack[8]{args}[0]{trans}, 'q<ABC>', 'to_arg2[0]->trans = q<ABC>';
        is $stack[8]{args}[1]{trans}, 'q<DE>', 'to_arg2[1]->trans = q<DE>';
        is $stack[8]{args}[2]{type}, 'verb', 'to_arg2[2]->type = verb';
        is $stack[8]{args}[2]{raw}, 'So\'', 'to_arg2[2]->raw = So\'';
        is $stack[8]{args}[2]{trans}, 'crypt', 'to_arg2[2]->trans = crypt';
        is $stack[8]{result}[0], 'crypt(q<ABC>, q<DE>)', 'to_arg2() = crypt(q<ABC>, q<DE>)';
        is $stack[9]{name}, 'translate', 'name = translate';
        is scalar(@{$stack[9]{args}}), 3, '3 arguments to translate';
        is $stack[9]{args}[0]{trans}, 'q<ABC>', 'translate[0]->trans = q<ABC>';
        is $stack[9]{args}[1]{trans}, 'q<DE>', 'translate[1]->trans = q<DE>';
        is $stack[9]{args}[2]{type}, 'verb', 'translate[2]->type = verb';
        is $stack[9]{args}[2]{raw}, 'So\'', 'translate[2]->raw = So\'';
        is $stack[9]{args}[2]{trans}, 'crypt', 'translate[2]->trans = crypt';
        is $stack[9]{result}[0], '<ABC> <DE> So\'', 'translate()->raw = <ABC> <DE> So\'';
        is $stack[9]{result}[1], 'crypt(q<ABC>, q<DE>)', 'translate()->trans = crypt(q<ABC>, q<DE>)';
        is $stack[10]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[10]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[10]{args}[1], '<ABC> <DE> So\'', 'token->raw = <ABC> <DE> So\'';
        is $stack[10]{args}[2], 'crypt(q<ABC>, q<DE>)', 'token->trans = crypt(q<ABC>, q<DE>)';
        is $stack[11]{name}, 'arg2', 'name = arg2';
        is $stack[11]{args}[0], 'So\'', 'arg2->args';
},
sub {
        note "unpack";
        my $step = shift;
        is $step, 2, 'step 2';
        my @stack = extract_stack($step);
        is scalar(@stack), 12, '12 entries on callstack';
        is $stack[2]{name}, 'to_arg2', 'name = to_arg2';
        is scalar(@{$stack[2]{args}}), 3, '3 arguments to to_arg2';
        is $stack[2]{args}[0]{trans}, 'q<C>', 'to_arg2[0]->trans = q<C>';
        is $stack[2]{args}[1]{trans}, 'q<D>', 'to_arg2[1]->trans = q<D>';
        is $stack[2]{args}[2]{type}, 'verb', 'to_arg2[2]->type = verb';
        is $stack[2]{args}[2]{raw}, 'boSHa\'', 'to_arg2[2]->raw = boSHa\'';
        is $stack[2]{args}[2]{trans}, 'unpack', 'to_arg2[2]->trans = unpack';
        is $stack[2]{result}[0], 'unpack(q<C>, q<D>)', 'to_arg2() = unpack(q<C>, q<D>)';
        is $stack[3]{name}, 'translate', 'name = translate';
        is scalar(@{$stack[3]{args}}), 3, '3 arguments to translate';
        is $stack[3]{args}[0]{trans}, 'q<C>', 'translate[0]->trans = q<C>';
        is $stack[3]{args}[1]{trans}, 'q<D>', 'translate[1]->trans = q<D>';
        is $stack[3]{args}[2]{type}, 'verb', 'translate[2]->type = verb';
        is $stack[3]{args}[2]{raw}, 'boSHa\'', 'translate[2]->raw = boSHa\'';
        is $stack[3]{args}[2]{trans}, 'unpack', 'translate[2]->trans = unpack';
        is $stack[3]{result}[0], '<C> <D> boSHa\'', 'translate()->raw = <C> <D> boSHa\'';
        is $stack[3]{result}[1], 'unpack(q<C>, q<D>)', 'translate()->trans = unpack(q<C>, q<D>)';
        is $stack[4]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[4]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[4]{args}[1], '<C> <D> boSHa\'', 'token->raw = <C> <D> boSHa\'';
        is $stack[4]{args}[2], 'unpack(q<C>, q<D>)', 'token->trans = unpack(q<C>, q<D>)';
        is $stack[5]{name}, 'arg2', 'name = arg2';
        is $stack[5]{args}[0], 'boSHa\'', 'arg2->args';
        is $stack[8]{name}, 'to_arg2', 'name = to_arg2';
        is scalar(@{$stack[8]{args}}), 3, '3 arguments to to_arg2';
        is $stack[8]{args}[0]{trans}, 'q<C>', 'to_arg2[0]->trans = q<C>';
        is $stack[8]{args}[1]{trans}, 'q<D>', 'to_arg2[1]->trans = q<D>';
        is $stack[8]{args}[2]{type}, 'verb', 'to_arg2[2]->type = verb';
        is $stack[8]{args}[2]{raw}, 'boSHa\'', 'to_arg2[2]->raw = boSHa\'';
        is $stack[8]{args}[2]{trans}, 'unpack', 'to_arg2[2]->trans = unpack';
        is $stack[8]{result}[0], 'unpack(q<C>, q<D>)', 'to_arg2() = unpack(q<C>, q<D>)';
        is $stack[9]{name}, 'translate', 'name = translate';
        is scalar(@{$stack[9]{args}}), 3, '3 arguments to translate';
        is $stack[9]{args}[0]{trans}, 'q<C>', 'translate[0]->trans = q<C>';
        is $stack[9]{args}[1]{trans}, 'q<D>', 'translate[1]->trans = q<D>';
        is $stack[9]{args}[2]{type}, 'verb', 'translate[2]->type = verb';
        is $stack[9]{args}[2]{raw}, 'boSHa\'', 'translate[2]->raw = boSHa\'';
        is $stack[9]{args}[2]{trans}, 'unpack', 'translate[2]->trans = unpack';
        is $stack[9]{result}[0], '<C> <D> boSHa\'', 'translate()->raw = <C> <D> boSHa\'';
        is $stack[9]{result}[1], 'unpack(q<C>, q<D>)', 'translate()->trans = unpack(q<C>, q<D>)';
        is $stack[10]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[10]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[10]{args}[1], '<C> <D> boSHa\'', 'token->raw = <C> <D> boSHa\'';
        is $stack[10]{args}[2], 'unpack(q<C>, q<D>)', 'token->trans = unpack(q<C>, q<D>)';
        is $stack[11]{name}, 'arg2', 'name = arg2';
        is $stack[11]{args}[0], 'boSHa\'', 'arg2->args';
},
sub {
        note "index";
        my $step = shift;
        is $step, 3, 'step 3';
        my @stack = extract_stack($step);
        is scalar(@stack), 12, '12 entries on callstack';
        is $stack[2]{name}, 'to_arg2', 'name = to_arg2';
        is scalar(@{$stack[2]{args}}), 3, '3 arguments to to_arg2';
        is $stack[2]{args}[0]{trans}, 'q<ABC>', 'to_arg2[0]->trans = q<ABC>';
        is $stack[2]{args}[1]{trans}, 'q<AB>', 'to_arg2[1]->trans = q<AB>';
        is $stack[2]{args}[2]{type}, 'verb', 'to_arg2[2]->type = verb';
        is $stack[2]{args}[2]{raw}, 'Sam', 'to_arg2[2]->raw = Sam';
        is $stack[2]{args}[2]{trans}, 'index', 'to_arg2[2]->trans = index';
        is $stack[2]{result}[0], 'index(q<ABC>, q<AB>)', 'to_arg2() = index(q<ABC>, q<AB>)';
        is $stack[3]{name}, 'translate', 'name = translate';
        is scalar(@{$stack[3]{args}}), 3, '3 arguments to translate';
        is $stack[3]{args}[0]{trans}, 'q<ABC>', 'translate[0]->trans = q<ABC>';
        is $stack[3]{args}[1]{trans}, 'q<AB>', 'translate[1]->trans = q<AB>';
        is $stack[3]{args}[2]{type}, 'verb', 'translate[2]->type = verb';
        is $stack[3]{args}[2]{raw}, 'Sam', 'translate[2]->raw = Sam';
        is $stack[3]{args}[2]{trans}, 'index', 'translate[2]->trans = index';
        is $stack[3]{result}[0], '<ABC> <AB> Sam', 'translate()->raw = <ABC> <AB> Sam';
        is $stack[3]{result}[1], 'index(q<ABC>, q<AB>)', 'translate()->trans = index(q<ABC>, q<AB>)';
        is $stack[4]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[4]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[4]{args}[1], '<ABC> <AB> Sam', 'token->raw = <ABC> <AB> Sam';
        is $stack[4]{args}[2], 'index(q<ABC>, q<AB>)', 'token->trans = index(q<ABC>, q<AB>)';
        is $stack[5]{name}, 'arg2', 'name = arg2';
        is $stack[5]{args}[0], 'Sam', 'arg2->args';
        is $stack[8]{name}, 'to_arg2', 'name = to_arg2';
        is scalar(@{$stack[8]{args}}), 3, '3 arguments to to_arg2';
        is $stack[8]{args}[0]{trans}, 'q<ABC>', 'to_arg2[0]->trans = q<ABC>';
        is $stack[8]{args}[1]{trans}, 'q<AB>', 'to_arg2[1]->trans = q<AB>';
        is $stack[8]{args}[2]{type}, 'verb', 'to_arg2[2]->type = verb';
        is $stack[8]{args}[2]{raw}, 'Sam', 'to_arg2[2]->raw = Sam';
        is $stack[8]{args}[2]{trans}, 'index', 'to_arg2[2]->trans = index';
        is $stack[8]{result}[0], 'index(q<ABC>, q<AB>)', 'to_arg2() = index(q<ABC>, q<AB>)';
        is $stack[9]{name}, 'translate', 'name = translate';
        is scalar(@{$stack[9]{args}}), 3, '3 arguments to translate';
        is $stack[9]{args}[0]{trans}, 'q<ABC>', 'translate[0]->trans = q<ABC>';
        is $stack[9]{args}[1]{trans}, 'q<AB>', 'translate[1]->trans = q<AB>';
        is $stack[9]{args}[2]{type}, 'verb', 'translate[2]->type = verb';
        is $stack[9]{args}[2]{raw}, 'Sam', 'translate[2]->raw = Sam';
        is $stack[9]{args}[2]{trans}, 'index', 'translate[2]->trans = index';
        is $stack[9]{result}[0], '<ABC> <AB> Sam', 'translate()->raw = <ABC> <AB> Sam';
        is $stack[9]{result}[1], 'index(q<ABC>, q<AB>)', 'translate()->trans = index(q<ABC>, q<AB>)';
        is $stack[10]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[10]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[10]{args}[1], '<ABC> <AB> Sam', 'token->raw = <ABC> <AB> Sam';
        is $stack[10]{args}[2], 'index(q<ABC>, q<AB>)', 'token->trans = index(q<ABC>, q<AB>)';
        is $stack[11]{name}, 'arg2', 'name = arg2';
        is $stack[11]{args}[0], 'Sam', 'arg2->args';
},
sub {
        note "chmod";
        my $step = shift;
        is $step, 4, 'step 4';
        my @stack = extract_stack($step);
        is scalar(@stack), 12, '12 entries on callstack';
        is $stack[2]{name}, 'to_arg2', 'name = to_arg2';
        is scalar(@{$stack[2]{args}}), 3, '3 arguments to to_arg2';
        is $stack[2]{args}[0]{trans}, '0', 'to_arg2[0]->trans = 0';
        is $stack[2]{args}[1]{trans}, 'q<pong>', 'to_arg2[1]->trans = q<pong>';
        is $stack[2]{args}[2]{type}, 'verb', 'to_arg2[2]->type = verb';
        is $stack[2]{args}[2]{raw}, 'naw\'choH', 'to_arg2[2]->raw = naw\'choH';
        is $stack[2]{args}[2]{trans}, 'chmod', 'to_arg2[2]->trans = chmod';
        is $stack[2]{result}[0], 'chmod(0, q<pong>)', 'to_arg2() = chmod(0, q<pong>)';
        is $stack[3]{name}, 'translate', 'name = translate';
        is scalar(@{$stack[3]{args}}), 3, '3 arguments to translate';
        is $stack[3]{args}[0]{trans}, '0', 'translate[0]->trans = 0';
        is $stack[3]{args}[1]{trans}, 'q<pong>', 'translate[1]->trans = q<pong>';
        is $stack[3]{args}[2]{type}, 'verb', 'translate[2]->type = verb';
        is $stack[3]{args}[2]{raw}, 'naw\'choH', 'translate[2]->raw = naw\'choH';
        is $stack[3]{args}[2]{trans}, 'chmod', 'translate[2]->trans = chmod';
        is $stack[3]{result}[0], 'pagh <pong> naw\'choH', 'translate()->raw = pagh <pong> naw\'choH';
        is $stack[3]{result}[1], 'chmod(0, q<pong>)', 'translate()->trans = chmod(0, q<pong>)';
        is $stack[4]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[4]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[4]{args}[1], 'pagh <pong> naw\'choH', 'token->raw = pagh <pong> naw\'choH';
        is $stack[4]{args}[2], 'chmod(0, q<pong>)', 'token->trans = chmod(0, q<pong>)';
        is $stack[5]{name}, 'arg2', 'name = arg2';
        is $stack[5]{args}[0], 'naw\'choH', 'arg2->args';
        is $stack[8]{name}, 'to_arg2', 'name = to_arg2';
        is scalar(@{$stack[8]{args}}), 3, '3 arguments to to_arg2';
        is $stack[8]{args}[0]{trans}, '0', 'to_arg2[0]->trans = 0';
        is $stack[8]{args}[1]{trans}, 'q<pong>', 'to_arg2[1]->trans = q<pong>';
        is $stack[8]{args}[2]{type}, 'verb', 'to_arg2[2]->type = verb';
        is $stack[8]{args}[2]{raw}, 'naw\'choH', 'to_arg2[2]->raw = naw\'choH';
        is $stack[8]{args}[2]{trans}, 'chmod', 'to_arg2[2]->trans = chmod';
        is $stack[8]{result}[0], 'chmod(0, q<pong>)', 'to_arg2() = chmod(0, q<pong>)';
        is $stack[9]{name}, 'translate', 'name = translate';
        is scalar(@{$stack[9]{args}}), 3, '3 arguments to translate';
        is $stack[9]{args}[0]{trans}, '0', 'translate[0]->trans = 0';
        is $stack[9]{args}[1]{trans}, 'q<pong>', 'translate[1]->trans = q<pong>';
        is $stack[9]{args}[2]{type}, 'verb', 'translate[2]->type = verb';
        is $stack[9]{args}[2]{raw}, 'naw\'choH', 'translate[2]->raw = naw\'choH';
        is $stack[9]{args}[2]{trans}, 'chmod', 'translate[2]->trans = chmod';
        is $stack[9]{result}[0], 'pagh <pong> naw\'choH', 'translate()->raw = pagh <pong> naw\'choH';
        is $stack[9]{result}[1], 'chmod(0, q<pong>)', 'translate()->trans = chmod(0, q<pong>)';
        is $stack[10]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[10]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[10]{args}[1], 'pagh <pong> naw\'choH', 'token->raw = pagh <pong> naw\'choH';
        is $stack[10]{args}[2], 'chmod(0, q<pong>)', 'token->trans = chmod(0, q<pong>)';
        is $stack[11]{name}, 'arg2', 'name = arg2';
        is $stack[11]{args}[0], 'naw\'choH', 'arg2->args';
},
sub {
        note "chown";
        my $step = shift;
        is $step, 5, 'step 5';
        my @stack = extract_stack($step);
        is scalar(@stack), 12, '12 entries on callstack';
        is $stack[2]{name}, 'to_arg2', 'name = to_arg2';
        is scalar(@{$stack[2]{args}}), 3, '3 arguments to to_arg2';
        is $stack[2]{args}[0]{trans}, 'q<pIn\'a\'>', 'to_arg2[0]->trans = q<pIn\'a\'>';
        is $stack[2]{args}[1]{trans}, 'q<pong>', 'to_arg2[1]->trans = q<pong>';
        is $stack[2]{args}[2]{type}, 'verb', 'to_arg2[2]->type = verb';
        is $stack[2]{args}[2]{raw}, 'pIn\'a\'choH', 'to_arg2[2]->raw = pIn\'a\'choH';
        is $stack[2]{args}[2]{trans}, 'chown', 'to_arg2[2]->trans = chown';
        is $stack[2]{result}[0], 'chown(q<pIn\'a\'>, q<pong>)', 'to_arg2() = chown(q<pIn\'a\'>, q<pong>)';
        is $stack[3]{name}, 'translate', 'name = translate';
        is scalar(@{$stack[3]{args}}), 3, '3 arguments to translate';
        is $stack[3]{args}[0]{trans}, 'q<pIn\'a\'>', 'translate[0]->trans = q<pIn\'a\'>';
        is $stack[3]{args}[1]{trans}, 'q<pong>', 'translate[1]->trans = q<pong>';
        is $stack[3]{args}[2]{type}, 'verb', 'translate[2]->type = verb';
        is $stack[3]{args}[2]{raw}, 'pIn\'a\'choH', 'translate[2]->raw = pIn\'a\'choH';
        is $stack[3]{args}[2]{trans}, 'chown', 'translate[2]->trans = chown';
        is $stack[3]{result}[0], '<pIn\'a\'> <pong> pIn\'a\'choH', 'translate()->raw = <pIn\'a\'> <pong> pIn\'a\'choH';
        is $stack[3]{result}[1], 'chown(q<pIn\'a\'>, q<pong>)', 'translate()->trans = chown(q<pIn\'a\'>, q<pong>)';
        is $stack[4]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[4]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[4]{args}[1], '<pIn\'a\'> <pong> pIn\'a\'choH', 'token->raw = <pIn\'a\'> <pong> pIn\'a\'choH';
        is $stack[4]{args}[2], 'chown(q<pIn\'a\'>, q<pong>)', 'token->trans = chown(q<pIn\'a\'>, q<pong>)';
        is $stack[5]{name}, 'arg2', 'name = arg2';
        is $stack[5]{args}[0], 'pIn\'a\'choH', 'arg2->args';
        is $stack[8]{name}, 'to_arg2', 'name = to_arg2';
        is scalar(@{$stack[8]{args}}), 3, '3 arguments to to_arg2';
        is $stack[8]{args}[0]{trans}, 'q<pIn\'a\'>', 'to_arg2[0]->trans = q<pIn\'a\'>';
        is $stack[8]{args}[1]{trans}, 'q<pong>', 'to_arg2[1]->trans = q<pong>';
        is $stack[8]{args}[2]{type}, 'verb', 'to_arg2[2]->type = verb';
        is $stack[8]{args}[2]{raw}, 'pIn\'a\'choH', 'to_arg2[2]->raw = pIn\'a\'choH';
        is $stack[8]{args}[2]{trans}, 'chown', 'to_arg2[2]->trans = chown';
        is $stack[8]{result}[0], 'chown(q<pIn\'a\'>, q<pong>)', 'to_arg2() = chown(q<pIn\'a\'>, q<pong>)';
        is $stack[9]{name}, 'translate', 'name = translate';
        is scalar(@{$stack[9]{args}}), 3, '3 arguments to translate';
        is $stack[9]{args}[0]{trans}, 'q<pIn\'a\'>', 'translate[0]->trans = q<pIn\'a\'>';
        is $stack[9]{args}[1]{trans}, 'q<pong>', 'translate[1]->trans = q<pong>';
        is $stack[9]{args}[2]{type}, 'verb', 'translate[2]->type = verb';
        is $stack[9]{args}[2]{raw}, 'pIn\'a\'choH', 'translate[2]->raw = pIn\'a\'choH';
        is $stack[9]{args}[2]{trans}, 'chown', 'translate[2]->trans = chown';
        is $stack[9]{result}[0], '<pIn\'a\'> <pong> pIn\'a\'choH', 'translate()->raw = <pIn\'a\'> <pong> pIn\'a\'choH';
        is $stack[9]{result}[1], 'chown(q<pIn\'a\'>, q<pong>)', 'translate()->trans = chown(q<pIn\'a\'>, q<pong>)';
        is $stack[10]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[10]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[10]{args}[1], '<pIn\'a\'> <pong> pIn\'a\'choH', 'token->raw = <pIn\'a\'> <pong> pIn\'a\'choH';
        is $stack[10]{args}[2], 'chown(q<pIn\'a\'>, q<pong>)', 'token->trans = chown(q<pIn\'a\'>, q<pong>)';
        is $stack[11]{name}, 'arg2', 'name = arg2';
        is $stack[11]{args}[0], 'pIn\'a\'choH', 'arg2->args';
},
sub {
        note "link";
        my $step = shift;
        is $step, 6, 'step 6';
        my @stack = extract_stack($step);
        is scalar(@stack), 12, '12 entries on callstack';
        is $stack[2]{name}, 'to_arg2', 'name = to_arg2';
        is scalar(@{$stack[2]{args}}), 3, '3 arguments to to_arg2';
        is $stack[2]{args}[0]{trans}, 'q<abc>', 'to_arg2[0]->trans = q<abc>';
        is $stack[2]{args}[1]{trans}, 'q<def>', 'to_arg2[1]->trans = q<def>';
        is $stack[2]{args}[2]{type}, 'verb', 'to_arg2[2]->type = verb';
        is $stack[2]{args}[2]{raw}, 'rar', 'to_arg2[2]->raw = rar';
        is $stack[2]{args}[2]{trans}, 'link', 'to_arg2[2]->trans = link';
        is $stack[2]{result}[0], 'link(q<abc>, q<def>)', 'to_arg2() = link(q<abc>, q<def>)';
        is $stack[3]{name}, 'translate', 'name = translate';
        is scalar(@{$stack[3]{args}}), 3, '3 arguments to translate';
        is $stack[3]{args}[0]{trans}, 'q<abc>', 'translate[0]->trans = q<abc>';
        is $stack[3]{args}[1]{trans}, 'q<def>', 'translate[1]->trans = q<def>';
        is $stack[3]{args}[2]{type}, 'verb', 'translate[2]->type = verb';
        is $stack[3]{args}[2]{raw}, 'rar', 'translate[2]->raw = rar';
        is $stack[3]{args}[2]{trans}, 'link', 'translate[2]->trans = link';
        is $stack[3]{result}[0], '<abc> <def> rar', 'translate()->raw = <abc> <def> rar';
        is $stack[3]{result}[1], 'link(q<abc>, q<def>)', 'translate()->trans = link(q<abc>, q<def>)';
        is $stack[4]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[4]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[4]{args}[1], '<abc> <def> rar', 'token->raw = <abc> <def> rar';
        is $stack[4]{args}[2], 'link(q<abc>, q<def>)', 'token->trans = link(q<abc>, q<def>)';
        is $stack[5]{name}, 'arg2', 'name = arg2';
        is $stack[5]{args}[0], 'rar', 'arg2->args';
        is $stack[8]{name}, 'to_arg2', 'name = to_arg2';
        is scalar(@{$stack[8]{args}}), 3, '3 arguments to to_arg2';
        is $stack[8]{args}[0]{trans}, 'q<abc>', 'to_arg2[0]->trans = q<abc>';
        is $stack[8]{args}[1]{trans}, 'q<def>', 'to_arg2[1]->trans = q<def>';
        is $stack[8]{args}[2]{type}, 'verb', 'to_arg2[2]->type = verb';
        is $stack[8]{args}[2]{raw}, 'rar', 'to_arg2[2]->raw = rar';
        is $stack[8]{args}[2]{trans}, 'link', 'to_arg2[2]->trans = link';
        is $stack[8]{result}[0], 'link(q<abc>, q<def>)', 'to_arg2() = link(q<abc>, q<def>)';
        is $stack[9]{name}, 'translate', 'name = translate';
        is scalar(@{$stack[9]{args}}), 3, '3 arguments to translate';
        is $stack[9]{args}[0]{trans}, 'q<abc>', 'translate[0]->trans = q<abc>';
        is $stack[9]{args}[1]{trans}, 'q<def>', 'translate[1]->trans = q<def>';
        is $stack[9]{args}[2]{type}, 'verb', 'translate[2]->type = verb';
        is $stack[9]{args}[2]{raw}, 'rar', 'translate[2]->raw = rar';
        is $stack[9]{args}[2]{trans}, 'link', 'translate[2]->trans = link';
        is $stack[9]{result}[0], '<abc> <def> rar', 'translate()->raw = <abc> <def> rar';
        is $stack[9]{result}[1], 'link(q<abc>, q<def>)', 'translate()->trans = link(q<abc>, q<def>)';
        is $stack[10]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[10]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[10]{args}[1], '<abc> <def> rar', 'token->raw = <abc> <def> rar';
        is $stack[10]{args}[2], 'link(q<abc>, q<def>)', 'token->trans = link(q<abc>, q<def>)';
        is $stack[11]{name}, 'arg2', 'name = arg2';
        is $stack[11]{args}[0], 'rar', 'arg2->args';
},
sub {
        note "rename";
        my $step = shift;
        is $step, 7, 'step 7';
        my @stack = extract_stack($step);
        is scalar(@stack), 12, '12 entries on callstack';
        is $stack[2]{name}, 'to_arg2', 'name = to_arg2';
        is scalar(@{$stack[2]{args}}), 3, '3 arguments to to_arg2';
        is $stack[2]{args}[0]{trans}, 'q<abc>', 'to_arg2[0]->trans = q<abc>';
        is $stack[2]{args}[1]{trans}, 'q<def>', 'to_arg2[1]->trans = q<def>';
        is $stack[2]{args}[2]{type}, 'verb', 'to_arg2[2]->type = verb';
        is $stack[2]{args}[2]{raw}, 'pongchoH', 'to_arg2[2]->raw = pongchoH';
        is $stack[2]{args}[2]{trans}, 'rename', 'to_arg2[2]->trans = rename';
        is $stack[2]{result}[0], 'rename(q<abc>, q<def>)', 'to_arg2() = rename(q<abc>, q<def>)';
        is $stack[3]{name}, 'translate', 'name = translate';
        is scalar(@{$stack[3]{args}}), 3, '3 arguments to translate';
        is $stack[3]{args}[0]{trans}, 'q<abc>', 'translate[0]->trans = q<abc>';
        is $stack[3]{args}[1]{trans}, 'q<def>', 'translate[1]->trans = q<def>';
        is $stack[3]{args}[2]{type}, 'verb', 'translate[2]->type = verb';
        is $stack[3]{args}[2]{raw}, 'pongchoH', 'translate[2]->raw = pongchoH';
        is $stack[3]{args}[2]{trans}, 'rename', 'translate[2]->trans = rename';
        is $stack[3]{result}[0], '<abc> <def> pongchoH', 'translate()->raw = <abc> <def> pongchoH';
        is $stack[3]{result}[1], 'rename(q<abc>, q<def>)', 'translate()->trans = rename(q<abc>, q<def>)';
        is $stack[4]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[4]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[4]{args}[1], '<abc> <def> pongchoH', 'token->raw = <abc> <def> pongchoH';
        is $stack[4]{args}[2], 'rename(q<abc>, q<def>)', 'token->trans = rename(q<abc>, q<def>)';
        is $stack[5]{name}, 'arg2', 'name = arg2';
        is $stack[5]{args}[0], 'pongchoH', 'arg2->args';
        is $stack[8]{name}, 'to_arg2', 'name = to_arg2';
        is scalar(@{$stack[8]{args}}), 3, '3 arguments to to_arg2';
        is $stack[8]{args}[0]{trans}, 'q<abc>', 'to_arg2[0]->trans = q<abc>';
        is $stack[8]{args}[1]{trans}, 'q<def>', 'to_arg2[1]->trans = q<def>';
        is $stack[8]{args}[2]{type}, 'verb', 'to_arg2[2]->type = verb';
        is $stack[8]{args}[2]{raw}, 'pongchoH', 'to_arg2[2]->raw = pongchoH';
        is $stack[8]{args}[2]{trans}, 'rename', 'to_arg2[2]->trans = rename';
        is $stack[8]{result}[0], 'rename(q<abc>, q<def>)', 'to_arg2() = rename(q<abc>, q<def>)';
        is $stack[9]{name}, 'translate', 'name = translate';
        is scalar(@{$stack[9]{args}}), 3, '3 arguments to translate';
        is $stack[9]{args}[0]{trans}, 'q<abc>', 'translate[0]->trans = q<abc>';
        is $stack[9]{args}[1]{trans}, 'q<def>', 'translate[1]->trans = q<def>';
        is $stack[9]{args}[2]{type}, 'verb', 'translate[2]->type = verb';
        is $stack[9]{args}[2]{raw}, 'pongchoH', 'translate[2]->raw = pongchoH';
        is $stack[9]{args}[2]{trans}, 'rename', 'translate[2]->trans = rename';
        is $stack[9]{result}[0], '<abc> <def> pongchoH', 'translate()->raw = <abc> <def> pongchoH';
        is $stack[9]{result}[1], 'rename(q<abc>, q<def>)', 'translate()->trans = rename(q<abc>, q<def>)';
        is $stack[10]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[10]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[10]{args}[1], '<abc> <def> pongchoH', 'token->raw = <abc> <def> pongchoH';
        is $stack[10]{args}[2], 'rename(q<abc>, q<def>)', 'token->trans = rename(q<abc>, q<def>)';
        is $stack[11]{name}, 'arg2', 'name = arg2';
        is $stack[11]{args}[0], 'pongchoH', 'arg2->args';
},
sub {
        note "bless";
        my $step = shift;
        is $step, 8, 'step 8';
        my @stack = extract_stack($step);
        is scalar(@stack), 12, '12 entries on callstack';
        is $stack[2]{name}, 'to_arg2_da', 'name = to_arg2_da';
        is scalar(@{$stack[2]{args}}), 3, '3 arguments to to_arg2_da';
        is $stack[2]{args}[0]{trans}, '$ref', 'to_arg2_da[0]->trans = $ref';
        is $stack[2]{args}[1]{trans}, 'q<abc>', 'to_arg2_da[1]->trans = q<abc>';
        is $stack[2]{args}[2]{type}, 'verb', 'to_arg2_da[2]->type = verb';
        is $stack[2]{args}[2]{raw}, 'DoQ', 'to_arg2_da[2]->raw = DoQ';
        is $stack[2]{args}[2]{trans}, 'bless', 'to_arg2_da[2]->trans = bless';
        is $stack[2]{result}[0], 'bless($ref, q<abc>)', 'to_arg2_da() = bless($ref, q<abc>)';
        is $stack[3]{name}, 'translate', 'name = translate';
        is scalar(@{$stack[3]{args}}), 3, '3 arguments to translate';
        is $stack[3]{args}[0]{trans}, '$ref', 'translate[0]->trans = $ref';
        is $stack[3]{args}[1]{trans}, 'q<abc>', 'translate[1]->trans = q<abc>';
        is $stack[3]{args}[2]{type}, 'verb', 'translate[2]->type = verb';
        is $stack[3]{args}[2]{raw}, 'DoQ', 'translate[2]->raw = DoQ';
        is $stack[3]{args}[2]{trans}, 'bless', 'translate[2]->trans = bless';
        is $stack[3]{result}[0], 'refvaD <abc> DoQ', 'translate()->raw = refvaD <abc> DoQ';
        is $stack[3]{result}[1], 'bless($ref, q<abc>)', 'translate()->trans = bless($ref, q<abc>)';
        is $stack[4]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[4]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[4]{args}[1], 'refvaD <abc> DoQ', 'token->raw = refvaD <abc> DoQ';
        is $stack[4]{args}[2], 'bless($ref, q<abc>)', 'token->trans = bless($ref, q<abc>)';
        is $stack[5]{name}, 'arg2_da', 'name = arg2_da';
        is $stack[5]{args}[0], 'DoQ', 'arg2_da->args';
        is $stack[8]{name}, 'to_arg2_da', 'name = to_arg2_da';
        is scalar(@{$stack[8]{args}}), 3, '3 arguments to to_arg2_da';
        is $stack[8]{args}[0]{trans}, '$ref', 'to_arg2_da[0]->trans = $ref';
        is $stack[8]{args}[1]{trans}, 'q<abc>', 'to_arg2_da[1]->trans = q<abc>';
        is $stack[8]{args}[2]{type}, 'verb', 'to_arg2_da[2]->type = verb';
        is $stack[8]{args}[2]{raw}, 'DoQ', 'to_arg2_da[2]->raw = DoQ';
        is $stack[8]{args}[2]{trans}, 'bless', 'to_arg2_da[2]->trans = bless';
        is $stack[8]{result}[0], 'bless($ref, q<abc>)', 'to_arg2_da() = bless($ref, q<abc>)';
        is $stack[9]{name}, 'translate', 'name = translate';
        is scalar(@{$stack[9]{args}}), 3, '3 arguments to translate';
        is $stack[9]{args}[0]{trans}, '$ref', 'translate[0]->trans = $ref';
        is $stack[9]{args}[1]{trans}, 'q<abc>', 'translate[1]->trans = q<abc>';
        is $stack[9]{args}[2]{type}, 'verb', 'translate[2]->type = verb';
        is $stack[9]{args}[2]{raw}, 'DoQ', 'translate[2]->raw = DoQ';
        is $stack[9]{args}[2]{trans}, 'bless', 'translate[2]->trans = bless';
        is $stack[9]{result}[0], 'refvaD <abc> DoQ', 'translate()->raw = refvaD <abc> DoQ';
        is $stack[9]{result}[1], 'bless($ref, q<abc>)', 'translate()->trans = bless($ref, q<abc>)';
        is $stack[10]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[10]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[10]{args}[1], 'refvaD <abc> DoQ', 'token->raw = refvaD <abc> DoQ';
        is $stack[10]{args}[2], 'bless($ref, q<abc>)', 'token->trans = bless($ref, q<abc>)';
        is $stack[11]{name}, 'arg2_da', 'name = arg2_da';
        is $stack[11]{args}[0], 'DoQ', 'arg2_da->args';
},
sub {
        note "flock";
        my $step = shift;
        is $step, 9, 'step 9';
        my @stack = extract_stack($step);
        TODO: { local $TODO = 'test flock';
        todo_skip 'flock', 47 unless @stack > 10;
        is scalar(@stack), 12, '12 entries on callstack';
        is $stack[2]{name}, 'to_arg2_da', 'name = to_arg2_da';
        is scalar(@{$stack[2]{args}}), 3, '3 arguments to to_arg2_da';
        is $stack[2]{args}[0]{trans}, 'STDIN', 'to_arg2_da[0]->trans = STDIN';
        is $stack[2]{args}[1]{trans}, '5', 'to_arg2_da[1]->trans = 5';
        is $stack[2]{args}[2]{type}, 'verb', 'to_arg2_da[2]->type = verb';
        is $stack[2]{args}[2]{raw}, 'bot', 'to_arg2_da[2]->raw = bot';
        is $stack[2]{args}[2]{trans}, 'flock', 'to_arg2_da[2]->trans = flock';
        is $stack[2]{result}[0], 'flock(STDIN, 5)', 'to_arg2_da() = flock(STDIN, 5)';
        is $stack[3]{name}, 'translate', 'name = translate';
        is scalar(@{$stack[3]{args}}), 3, '3 arguments to translate';
        is $stack[3]{args}[0]{trans}, 'STDIN', 'translate[0]->trans = STDIN';
        is $stack[3]{args}[1]{trans}, '5', 'translate[1]->trans = 5';
        is $stack[3]{args}[2]{type}, 'verb', 'translate[2]->type = verb';
        is $stack[3]{args}[2]{raw}, 'bot', 'translate[2]->raw = bot';
        is $stack[3]{args}[2]{trans}, 'flock', 'translate[2]->trans = flock';
        is $stack[3]{result}[0], 'mungna\'vo\' vagh bot', 'translate()->raw = mungna\'vo\' vagh bot';
        is $stack[3]{result}[1], 'flock(STDIN, 5)', 'translate()->trans = flock(STDIN, 5)';
        is $stack[4]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[4]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[4]{args}[1], 'mungna\'vo\' vagh bot', 'token->raw = mungna\'vo\' vagh bot';
        is $stack[4]{args}[2], 'flock(STDIN, 5)', 'token->trans = flock(STDIN, 5)';
        is $stack[5]{name}, 'arg2_da', 'name = arg2_da';
        is $stack[5]{args}[0], 'bot', 'arg2_da->args';
        is $stack[8]{name}, 'to_arg2_da', 'name = to_arg2_da';
        is scalar(@{$stack[8]{args}}), 3, '3 arguments to to_arg2_da';
        is $stack[8]{args}[0]{trans}, 'STDOUT', 'to_arg2_da[0]->trans = STDOUT';
        is $stack[8]{args}[1]{trans}, '6', 'to_arg2_da[1]->trans = 6';
        is $stack[8]{args}[2]{type}, 'verb', 'to_arg2_da[2]->type = verb';
        is $stack[8]{args}[2]{raw}, 'bot', 'to_arg2_da[2]->raw = bot';
        is $stack[8]{args}[2]{trans}, 'flock', 'to_arg2_da[2]->trans = flock';
        is $stack[8]{result}[0], 'flock(STDOUT, 6)', 'to_arg2_da() = flock(STDOUT, 6)';
        is $stack[9]{name}, 'translate', 'name = translate';
        is scalar(@{$stack[9]{args}}), 3, '3 arguments to translate';
        is $stack[9]{args}[0]{trans}, 'STDOUT', 'translate[0]->trans = STDOUT';
        is $stack[9]{args}[1]{trans}, '6', 'translate[1]->trans = 6';
        is $stack[9]{args}[2]{type}, 'verb', 'translate[2]->type = verb';
        is $stack[9]{args}[2]{raw}, 'bot', 'translate[2]->raw = bot';
        is $stack[9]{args}[2]{trans}, 'flock', 'translate[2]->trans = flock';
        is $stack[9]{result}[0], 'ghochna\' jav bot', 'translate()->raw = ghochna\' jav bot';
        is $stack[9]{result}[1], 'flock(STDOUT, 6)', 'translate()->trans = flock(STDOUT, 6)';
        is $stack[10]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[10]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[10]{args}[1], 'ghochna\' jav bot', 'token->raw = ghochna\' jav bot';
        is $stack[10]{args}[2], 'flock(STDOUT, 6)', 'token->trans = flock(STDOUT, 6)';
        is $stack[11]{name}, 'arg2_da', 'name = arg2_da';
        is $stack[11]{args}[0], 'bot', 'arg2_da->args';
        }
},
sub {
        note "[...]";
        my $step = shift;
        is $step, 10, 'step 10';
        my @stack = extract_stack($step);
        note scalar(@stack), ' entries on callstack';
},
sub {
        note "{...}";
        my $step = shift;
        is $step, 11, 'step 11';
        my @stack = extract_stack($step);
        note scalar(@stack), ' entries on callstack';
},
];

my @module_args;
BEGIN { push @module_args, 'yIQIj' if $DEBUG; }
BEGIN { push @module_args, 'yImugh' if $TRANSLATE; }
no warnings 'void';
use Lingua::tlhInganHol::yIghun @module_args;
nabwIj!
varwIj! refwIj! refvaD nuqDaq var yInob!
ghommeywIj!
DIvI'pu'wI'! #'

pagh yIlIH! #'
wa' cha' tIqojHa'! #'
wa' cha' qojHa'! #'
pagh yIvan!
nabvaD 'olvo' pagh DIch yInob! #'
pagh yInabvetlh! #'

wa' yIlIH! #'
<ABC> <DE> tISo'! #'
<ABC> <DE> So'! #'
wa' yIvan! #'
nabvaD 'olvo' wa' DIch yInob!
wa' yInabvetlh! #'

cha' yIlIH! #'
<C> <D> tIboSHa'! #'
<C> <D> boSHa'! #'
cha' yIvan! #'
nabvaD 'olvo' cha' DIch yInob! #'
cha' yInabvetlh! #'

wej yIlIH! #'
<ABC> <AB> tISam ! #'
<ABC> <AB> Sam ! #'
wej yIvan! #'
nabvaD 'olvo' wej DIch yInob! #'
wej yInabvetlh! #'

loS yIlIH! #'
pagh <pong> tInaw'choH! #'
pagh <pong> naw'choH! #'
loS yIvan! #'
nabvaD 'olvo' loS DIch yInob! #'
loS yInabvetlh! #'

vagh yIlIH! #'
<pIn'a'> <pong> tIpIn'a'choH! #'
<pIn'a'> <pong> pIn'a'choH! #'
vagh yIvan! #'
nabvaD 'olvo' vagh DIch yInob! #'
vagh yInabvetlh! #'

jav yIlIH! #'
<abc> <def> tIrar! #'
<abc> <def> rar! #'
jav yIvan! #'
nabvaD 'olvo' jav DIch yInob! #'
jav yInabvetlh! #'

Soch yIlIH! #'
<abc> <def> tIpongchoH! #'
<abc> <def> pongchoH! #'
Soch yIvan! #'
nabvaD 'olvo' Soch DIch yInob! #'
Soch yInabvetlh! #'

chorgh yIlIH! #'
refvaD <abc> tIDoQ! #'
refvaD <abc> DoQ! #'
chorgh yIvan! #'
nabvaD 'olvo' chorgh DIch yInob! #'
chorgh yInabvetlh! #'

Hut yIlIH! #'
# mungna'vo' vagh yIbot! #'
# ghochna' jav bot! #'
Hut yIvan! #'
nabvaD 'olvo' Hut DIch yInob! #'
Hut yInabvetlh!

wa'maH yIlIH! #'
# ghommeyvo' wa' tIDIch! #'
# ghommeyvo' cha' tIDIchvo' wej DIch! #'
# ghommeyvo' loS tIDIchvaD! #'
# ghommeyvo' wa' DIch! #'
# ghommeyvo' cha' DIchvo' wej DIch! #'
# ghommeyvo' loS DIchvaD! #'
wa'maH yIvan! #'
nabvaD 'olvo' wa'maH DIch yInob! #'
wa'maH yInabvetlh! #'

wa'maH wa' yIlIH! #'
# DIvI'pu'vo' <abc> tISuq! #'
# DIvI'pu'vo' <def> tISuqvo' <ghi> Suq! #'
# DIvI'pu'vo' <jkl> tISuqvaD! #'
# DIvI'pu'vo' <abc> Suq! #'
# DIvI'pu'vo' <def> Suqvo' <ghi> Suq! #'
# DIvI'pu'vo' <jkl> SuqvaD! #'
wa'maH wa' yIvan! #'
nabvaD 'olvo' wa'maH wa' DIch yInob! #'
wa'maH wa' yInabvetlh! #'

yIdone_testing!
