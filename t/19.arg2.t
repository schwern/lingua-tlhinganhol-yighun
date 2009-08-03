#!perl -w
# vim:set et si:
#
use Test::More
        tests => 861
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
        is scalar(@stack), 46, '46 entries on callstack';

        note "tIDIch";
        is $stack[0]{name}, 'pushtok', 'name = pushtok(array)';
        is $stack[0]{args}[0], 'abl', 'token->type = abl';
        is $stack[0]{args}[1], 'ghommeyvo\'', 'token->raw = ghommeyvo\'';
        is $stack[0]{args}[2], '@ghom', 'token->trans = @ghom';
        is $stack[1]{name}, 'pushtok', 'name = pushtok(index)';
        is $stack[1]{args}[0], 'acc', 'token->type = acc';
        is $stack[1]{args}[1], 'wa\'', 'token->raw = wa\'';
        is $stack[1]{args}[2], '1', 'token->trans = 1';
        is $stack[2]{name}, 'to_arg2_a', 'name = to_arg2_a';
        is $stack[2]{args}[0]{trans}, '$ghom', 'to_arg2_a[0]->trans (after s///) = $ghom';
        is $stack[2]{args}[1]{trans}, '1', 'to_arg2_a[1]->trans = 1';
        is $stack[2]{args}[2]{type}, 'verb', 'to_arg2_a[2]->type = verb';
        is $stack[2]{args}[2]{raw}, 'DIch', 'to_arg2_a[2]->raw = DIch';
        is $stack[2]{args}[2]{trans}, '[1]', 'to_arg2_a[2]->trans (after s///) = [1]';
        is scalar(@{$stack[2]{result}}), 1, 'to_arg2_a() has 1 result';
        is $stack[2]{result}[0], '$ghom[1]', 'to_arg2_a() = $ghom[1]';
        is $stack[3]{name}, 'translate', 'name = translate';
        is $stack[3]{result}[0], 'ghommeyvo\' wa\' DIch', 'translate()->raw = ghommeyvo\' wa\' DIch';
        is $stack[3]{result}[1], '$ghom[1]', 'translate()-trans = $ghom[1]';
        is $stack[4]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[4]{args}[0], 'acc', 'token->type = acc';
        is $stack[4]{args}[1], 'ghommeyvo\' wa\' DIch', 'token->raw = ghommeyvo\' wa\' DIch';
        is $stack[4]{args}[2], '$ghom[1]', 'token->trans = $ghom[1]';
        is $stack[5]{name}, 'arg2_a', 'name = arg2_a';
        is $stack[5]{args}[0], 'DIch', 'arg2_a[0] = DIch';

        note "tIDIchvo\'";
        is $stack[6]{name}, 'pushtok', 'name = pushtok(array 1)';
        is $stack[6]{args}[0], 'abl', 'token->type = abl';
        is $stack[6]{args}[1], 'ghommeyvo\'', 'token->raw = ghommeyvo\'';
        is $stack[6]{args}[2], '@ghom', 'token->trans = @ghom';
        is $stack[7]{name}, 'pushtok', 'name = pushtok(index 1)';
        is $stack[7]{args}[0], 'acc', 'token->type = acc';
        is $stack[7]{args}[1], 'cha\'', 'token->raw = cha\'';
        is $stack[7]{args}[2], '2', 'token->trans = 2';
        is $stack[8]{name}, 'to_arg2_a', 'name = to_arg2_a (1)';
        is $stack[8]{args}[0]{trans}, '$ghom', 'to_arg2_a[0]->trans (after s///) = $ghom';
        is $stack[8]{args}[1]{trans}, '2', 'to_arg2_a[1]->trans = 2';
        is $stack[8]{args}[2]{type}, 'verb', 'to_arg2_a[2]->type = verb';
        is $stack[8]{args}[2]{raw}, 'DIchvo\'', 'to_arg2_a[2]->raw = DIchvo\'';
        is $stack[8]{args}[2]{trans}, '[2]', 'to_arg2_a[2]->trans (after s///) = [2]';
        is scalar(@{$stack[8]{result}}), 1, 'to_arg2_a() has 1 result';
        is $stack[8]{result}[0], '$ghom[2]', 'to_arg2_a() = $ghom[2]';
        is $stack[9]{name}, 'translate', 'name = translate (1)';
        is $stack[9]{result}[0], 'ghommeyvo\' cha\' DIchvo\'', 'translate()->raw = ghommeyvo\' cha\' DIchvo\'';
        is $stack[9]{result}[1], '$ghom[2]', 'translate()-trans = $ghom[2]';
        is $stack[10]{name}, 'pushtok', 'name = pushtok(func 1)';
        is $stack[10]{args}[0], 'abl', 'token->type = abl';
        is $stack[10]{args}[1], 'ghommeyvo\' cha\' DIchvo\'', 'token->raw = ghommeyvo\' cha\' DIchvo\'';
        is $stack[10]{args}[2], '$ghom[2]', 'token->trans = $ghom[2]';
        is $stack[11]{name}, 'arg2_a', 'name = arg2_a (1)';
        is $stack[11]{args}[0], 'DIchvo\'', 'arg2_a[0] = DIchvo\'';
        is $stack[12]{name}, 'pushtok', 'name = pushtok (index 2)';
        is $stack[12]{args}[2], '3', 'token->trans = 3';
        is $stack[13]{name}, 'to_arg2_a', 'name = to_arg2_a (2)';
        is $stack[13]{args}[0]{trans}, '$ghom[2]->', 'to_arg2_a[0]->trans = $ghom[2]->';
        is $stack[13]{args}[1]{trans}, '3', 'to_arg2_a[1]->trans = 3';
        is $stack[13]{args}[2]{type}, 'verb', 'to_arg2_a[2]->type = verb';
        is $stack[13]{args}[2]{raw}, 'DIch', 'to_arg2_a[2]->raw = DIch';
        is $stack[13]{args}[2]{trans}, '[3]', 'to_arg2_a[2]->trans = [3]';
        is scalar(@{$stack[13]{result}}), 1, 'to_arg2_a() has 1 result';
        is $stack[13]{result}[0], '$ghom[2]->[3]', 'to_arg2_a() = $ghom[2]->[3]';
        is $stack[14]{name}, 'translate', 'name = translate (2)';
        is $stack[14]{result}[0], 'ghommeyvo\' cha\' DIchvo\' wej DIch', 'translate()->raw = ghommeyvo\' cha\' DIchvo\' wej DIch';
        is $stack[14]{result}[1], '$ghom[2]->[3]', 'translate()->trans = $ghom[2]->[3]';
        is $stack[15]{name}, 'pushtok', 'name = pushtok (func 2)';
        is $stack[15]{args}[0], 'acc', 'token->type = acc';
        is $stack[15]{args}[1], 'ghommeyvo\' cha\' DIchvo\' wej DIch', 'token->raw = ghommeyvo\' cha\' DIchvo\' wej DIch';
        is $stack[15]{args}[2], '$ghom[2]->[3]', 'token->trans = $ghom[2]->[3]';
        is $stack[16]{name}, 'arg2_a', 'name = arg2_a (2)';
        is $stack[16]{args}[0], 'DIch', 'arg2_a[0] = DIch';

        note "tIDIchvaD";
        is $stack[17]{name}, 'pushtok', 'name = pushtok(array)';
        is $stack[17]{args}[0], 'abl', 'token->type = abl';
        is $stack[17]{args}[1], 'ghommeyvo\'', 'token->raw = ghommeyvo\'';
        is $stack[17]{args}[2], '@ghom', 'token->trans = @ghom';
        is $stack[18]{name}, 'pushtok', 'name = pushtok(index)';
        is $stack[18]{args}[0], 'acc', 'token->type = acc';
        is $stack[18]{args}[1], 'loS', 'token->raw = loS';
        is $stack[18]{args}[2], '4', 'token->trans = 4';
        is $stack[19]{name}, 'to_arg2_a', 'name = to_arg2_a';
        is $stack[19]{args}[0]{trans}, '$ghom', 'to_arg2_a[0]->trans (after s///) = $ghom';
        is $stack[19]{args}[1]{trans}, '4', 'to_arg2_a[1]->trans = 4';
        is $stack[19]{args}[2]{type}, 'verb', 'to_arg2_a[2]->type = verb';
        is $stack[19]{args}[2]{raw}, 'DIchvaD', 'to_arg2_a[2]->raw = DIchvaD';
        is $stack[19]{args}[2]{trans}, '[4]', 'to_arg2_a[2]->trans (after s///) = [4]';
        is scalar(@{$stack[19]{result}}), 1, 'to_arg2_a() has 1 result';
        is $stack[19]{result}[0], '$ghom[4]', 'to_arg2_a() = $ghom[4]';
        is $stack[20]{name}, 'translate', 'name = translate';
        is $stack[20]{result}[0], 'ghommeyvo\' loS DIchvaD', 'translate()->raw = ghommeyvo\' loS DIchvaD';
        is $stack[20]{result}[1], '$ghom[4]', 'translate()-trans = $ghom[4]';
        is $stack[21]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[21]{args}[0], 'dat', 'token->type = dat';
        is $stack[21]{args}[1], 'ghommeyvo\' loS DIchvaD', 'token->raw = ghommeyvo\' loS DIchvaD';
        is $stack[21]{args}[2], '$ghom[4]', 'token->trans = $ghom[4]';
        is $stack[22]{name}, 'arg2_a', 'name = arg2_a';
        is $stack[22]{args}[0], 'DIchvaD', 'arg2_a[0] = DIchvaD';

        note "DIch";
        is $stack[23]{name}, 'pushtok', 'name = pushtok(array)';
        is $stack[23]{args}[0], 'abl', 'token->type = abl';
        is $stack[23]{args}[1], 'ghommeyvo\'', 'token->raw = ghommeyvo\'';
        is $stack[23]{args}[2], '@ghom', 'token->trans = @ghom';
        is $stack[24]{name}, 'pushtok', 'name = pushtok(index)';
        is $stack[24]{args}[0], 'acc', 'token->type = acc';
        is $stack[24]{args}[1], 'vagh', 'token->raw = vagh';
        is $stack[24]{args}[2], '5', 'token->trans = 5';
        is $stack[25]{name}, 'to_arg2_a', 'name = to_arg2_a';
        is $stack[25]{args}[0]{trans}, '$ghom', 'to_arg2_a[0]->trans (after s///) = $ghom';
        is $stack[25]{args}[1]{trans}, '5', 'to_arg2_a[1]->trans = 5';
        is $stack[25]{args}[2]{type}, 'verb', 'to_arg2_a[2]->type = verb';
        is $stack[25]{args}[2]{raw}, 'DIch', 'to_arg2_a[2]->raw = DIch';
        is $stack[25]{args}[2]{trans}, '[5]', 'to_arg2_a[2]->trans (after s///) = [5]';
        is scalar(@{$stack[25]{result}}), 1, 'to_arg2_a() has 1 result';
        is $stack[25]{result}[0], '$ghom[5]', 'to_arg2_a() = $ghom[5]';
        is $stack[26]{name}, 'translate', 'name = translate';
        is $stack[26]{result}[0], 'ghommeyvo\' vagh DIch', 'translate()->raw = ghommeyvo\' vagh DIch';
        is $stack[26]{result}[1], '$ghom[5]', 'translate()-trans = $ghom[5]';
        is $stack[27]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[27]{args}[0], 'acc', 'token->type = acc';
        is $stack[27]{args}[1], 'ghommeyvo\' vagh DIch', 'token->raw = ghommeyvo\' vagh DIch';
        is $stack[27]{args}[2], '$ghom[5]', 'token->trans = $ghom[5]';
        is $stack[28]{name}, 'arg2_a', 'name = arg2_a';
        is $stack[28]{args}[0], 'DIch', 'arg2_a[0] = DIch';

        note "DIchvo\'";
        is $stack[29]{name}, 'pushtok', 'name = pushtok(array 1)';
        is $stack[29]{args}[0], 'abl', 'token->type = abl';
        is $stack[29]{args}[1], 'ghommeyvo\'', 'token->raw = ghommeyvo\'';
        is $stack[29]{args}[2], '@ghom', 'token->trans = @ghom';
        is $stack[30]{name}, 'pushtok', 'name = pushtok(index 1)';
        is $stack[30]{args}[0], 'acc', 'token->type = acc';
        is $stack[30]{args}[1], 'jav', 'token->raw = jav';
        is $stack[30]{args}[2], '6', 'token->trans = 6';
        is $stack[31]{name}, 'to_arg2_a', 'name = to_arg2_a (1)';
        is $stack[31]{args}[0]{trans}, '$ghom', 'to_arg2_a[0]->trans (after s///) = $ghom';
        is $stack[31]{args}[1]{trans}, '6', 'to_arg2_a[1]->trans = 6';
        is $stack[31]{args}[2]{type}, 'verb', 'to_arg2_a[2]->type = verb';
        is $stack[31]{args}[2]{raw}, 'DIchvo\'', 'to_arg2_a[2]->raw = DIchvo\'';
        is $stack[31]{args}[2]{trans}, '[6]', 'to_arg2_a[2]->trans (after s///) = [6]';
        is scalar(@{$stack[31]{result}}), 1, 'to_arg2_a() has 1 result';
        is $stack[31]{result}[0], '$ghom[6]', 'to_arg2_a() = $ghom[6]';
        is $stack[32]{name}, 'translate', 'name = translate (1)';
        is $stack[32]{result}[0], 'ghommeyvo\' jav DIchvo\'', 'translate()->raw = ghommeyvo\' jav DIchvo\'';
        is $stack[32]{result}[1], '$ghom[6]', 'translate()-trans = $ghom[6]';
        is $stack[33]{name}, 'pushtok', 'name = pushtok(func 1)';
        is $stack[33]{args}[0], 'abl', 'token->type = abl';
        is $stack[33]{args}[1], 'ghommeyvo\' jav DIchvo\'', 'token->raw = ghommeyvo\' jav DIchvo\'';
        is $stack[33]{args}[2], '$ghom[6]', 'token->trans = $ghom[6]';
        is $stack[34]{name}, 'arg2_a', 'name = arg2_a (1)';
        is $stack[34]{args}[0], 'DIchvo\'', 'arg2_a[0] = DIchvo\'';
        is $stack[35]{name}, 'pushtok', 'name = pushtok (index 2)';
        is $stack[35]{args}[2], '7', 'token->trans = 7';
        is $stack[36]{name}, 'to_arg2_a', 'name = to_arg2_a (2)';
        is $stack[36]{args}[0]{trans}, '$ghom[6]->', 'to_arg2_a[0]->trans = $ghom[6]->';
        is $stack[36]{args}[1]{trans}, '7', 'to_arg2_a[1]->trans = 7';
        is $stack[36]{args}[2]{type}, 'verb', 'to_arg2_a[2]->type = verb';
        is $stack[36]{args}[2]{raw}, 'DIch', 'to_arg2_a[2]->raw = DIch';
        is $stack[36]{args}[2]{trans}, '[7]', 'to_arg2_a[2]->trans = [7]';
        is scalar(@{$stack[36]{result}}), 1, 'to_arg2_a() has 1 result';
        is $stack[36]{result}[0], '$ghom[6]->[7]', 'to_arg2_a() = $ghom[6]->[7]';
        is $stack[37]{name}, 'translate', 'name = translate (2)';
        is $stack[37]{result}[0], 'ghommeyvo\' jav DIchvo\' Soch DIch', 'translate()->raw = ghommeyvo\' jav DIchvo\' Soch DIch';
        is $stack[37]{result}[1], '$ghom[6]->[7]', 'translate()->trans = $ghom[6]->[7]';
        is $stack[38]{name}, 'pushtok', 'name = pushtok (func 2)';
        is $stack[38]{args}[0], 'acc', 'token->type = acc';
        is $stack[38]{args}[1], 'ghommeyvo\' jav DIchvo\' Soch DIch', 'token->raw = ghommeyvo\' jav DIchvo\' Soch DIch';
        is $stack[38]{args}[2], '$ghom[6]->[7]', 'token->trans = $ghom[6]->[7]';
        is $stack[39]{name}, 'arg2_a', 'name = arg2_a (2)';
        is $stack[39]{args}[0], 'DIch', 'arg2_a[0] = DIch';

        note "DIchvaD";
        is $stack[40]{name}, 'pushtok', 'name = pushtok(array)';
        is $stack[40]{args}[0], 'abl', 'token->type = abl';
        is $stack[40]{args}[1], 'ghommeyvo\'', 'token->raw = ghommeyvo\'';
        is $stack[40]{args}[2], '@ghom', 'token->trans = @ghom';
        is $stack[41]{name}, 'pushtok', 'name = pushtok(index)';
        is $stack[41]{args}[0], 'acc', 'token->type = acc';
        is $stack[41]{args}[1], 'chorgh', 'token->raw = chorgh';
        is $stack[41]{args}[2], '8', 'token->trans = 8';
        is $stack[42]{name}, 'to_arg2_a', 'name = to_arg2_a';
        is $stack[42]{args}[0]{trans}, '$ghom', 'to_arg2_a[0]->trans (after s///) = $ghom';
        is $stack[42]{args}[1]{trans}, '8', 'to_arg2_a[1]->trans = 8';
        is $stack[42]{args}[2]{type}, 'verb', 'to_arg2_a[2]->type = verb';
        is $stack[42]{args}[2]{raw}, 'DIchvaD', 'to_arg2_a[2]->raw = DIchvaD';
        is $stack[42]{args}[2]{trans}, '[8]', 'to_arg2_a[2]->trans (after s///) = [8]';
        is scalar(@{$stack[42]{result}}), 1, 'to_arg2_a() has 1 result';
        is $stack[42]{result}[0], '$ghom[8]', 'to_arg2_a() = $ghom[8]';
        is $stack[43]{name}, 'translate', 'name = translate';
        is $stack[43]{result}[0], 'ghommeyvo\' chorgh DIchvaD', 'translate()->raw = ghommeyvo\' chorgh DIchvaD';
        is $stack[43]{result}[1], '$ghom[8]', 'translate()-trans = $ghom[8]';
        is $stack[44]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[44]{args}[0], 'dat', 'token->type = dat';
        is $stack[44]{args}[1], 'ghommeyvo\' chorgh DIchvaD', 'token->raw = ghommeyvo\' chorgh DIchvaD';
        is $stack[44]{args}[2], '$ghom[8]', 'token->trans = $ghom[8]';
        is $stack[45]{name}, 'arg2_a', 'name = arg2_a';
        is $stack[45]{args}[0], 'DIchvaD', 'arg2_a[0] = DIchvaD';
},
sub {
        note "{...}";
        my $step = shift;
        is $step, 11, 'step 11';
        my @stack = extract_stack($step);
        is scalar(@stack), 46, '46 entries on callstack';

        note "tISuq";
        is $stack[0]{name}, 'pushtok', 'name = pushtok(array)';
        is $stack[0]{args}[0], 'abl', 'token->type = abl';
        is $stack[0]{args}[1], 'DIvI\'pu\'vo\'', 'token->raw = DIvI\'pu\'vo\'';
        is $stack[0]{args}[2], '%DIvIZ', 'token->trans = %DIvIZ';
        is $stack[1]{name}, 'pushtok', 'name = pushtok(index)';
        is $stack[1]{args}[0], 'acc', 'token->type = acc';
        is $stack[1]{args}[1], '<abc>', 'token->raw = <abc>';
        is $stack[1]{args}[2], 'q<abc>', 'token->trans = q<abc>';
        is $stack[2]{name}, 'to_arg2_a', 'name = to_arg2_a';
        is $stack[2]{args}[0]{trans}, '$DIvIZ', 'to_arg2_a[0]->trans (after s///) = $DIvIZ';
        is $stack[2]{args}[1]{trans}, 'q<abc>', 'to_arg2_a[1]->trans = q<abc>';
        is $stack[2]{args}[2]{type}, 'verb', 'to_arg2_a[2]->type = verb';
        is $stack[2]{args}[2]{raw}, 'Suq', 'to_arg2_a[2]->raw = Suq';
        is $stack[2]{args}[2]{trans}, '{q<abc>}', 'to_arg2_a[2]->trans (after s///) = {q<abc>}';
        is scalar(@{$stack[2]{result}}), 1, 'to_arg2_a() has 1 result';
        is $stack[2]{result}[0], '$DIvIZ{q<abc>}', 'to_arg2_a() = $DIvIZ{q<abc>}';
        is $stack[3]{name}, 'translate', 'name = translate';
        is $stack[3]{result}[0], 'DIvI\'pu\'vo\' <abc> Suq', 'translate()->raw = DIvI\'pu\'vo\' <abc> Suq';
        is $stack[3]{result}[1], '$DIvIZ{q<abc>}', 'translate()-trans = $DIvIZ{q<abc>}';
        is $stack[4]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[4]{args}[0], 'acc', 'token->type = acc';
        is $stack[4]{args}[1], 'DIvI\'pu\'vo\' <abc> Suq', 'token->raw = DIvI\'pu\'vo\' <abc> Suq';
        is $stack[4]{args}[2], '$DIvIZ{q<abc>}', 'token->trans = $DIvIZ{q<abc>}';
        is $stack[5]{name}, 'arg2_a', 'name = arg2_a';
        is $stack[5]{args}[0], 'Suq', 'arg2_a[0] = Suq';

        note "tISuqvo\'";
        is $stack[6]{name}, 'pushtok', 'name = pushtok(array 1)';
        is $stack[6]{args}[0], 'abl', 'token->type = abl';
        is $stack[6]{args}[1], 'DIvI\'pu\'vo\'', 'token->raw = DIvI\'pu\'vo\'';
        is $stack[6]{args}[2], '%DIvIZ', 'token->trans = %DIvIZ';
        is $stack[7]{name}, 'pushtok', 'name = pushtok(index 1)';
        is $stack[7]{args}[0], 'acc', 'token->type = acc';
        is $stack[7]{args}[1], '<def>', 'token->raw = <def>';
        is $stack[7]{args}[2], 'q<def>', 'token->trans = q<def>';
        is $stack[8]{name}, 'to_arg2_a', 'name = to_arg2_a (1)';
        is $stack[8]{args}[0]{trans}, '$DIvIZ', 'to_arg2_a[0]->trans (after s///) = $DIvIZ';
        is $stack[8]{args}[1]{trans}, 'q<def>', 'to_arg2_a[1]->trans = q<def>';
        is $stack[8]{args}[2]{type}, 'verb', 'to_arg2_a[2]->type = verb';
        is $stack[8]{args}[2]{raw}, 'Suqvo\'', 'to_arg2_a[2]->raw = Suqvo\'';
        is $stack[8]{args}[2]{trans}, '{q<def>}', 'to_arg2_a[2]->trans (after s///) = {q<def>}';
        is scalar(@{$stack[8]{result}}), 1, 'to_arg2_a() has 1 result';
        is $stack[8]{result}[0], '$DIvIZ{q<def>}', 'to_arg2_a() = $DIvIZ{q<def>}';
        is $stack[9]{name}, 'translate', 'name = translate (1)';
        is $stack[9]{result}[0], 'DIvI\'pu\'vo\' <def> Suqvo\'', 'translate()->raw = DIvI\'pu\'vo\' <def> Suqvo\'';
        is $stack[9]{result}[1], '$DIvIZ{q<def>}', 'translate()-trans = $DIvIZ{q<def>}';
        is $stack[10]{name}, 'pushtok', 'name = pushtok(func 1)';
        is $stack[10]{args}[0], 'abl', 'token->type = abl';
        is $stack[10]{args}[1], 'DIvI\'pu\'vo\' <def> Suqvo\'', 'token->raw = DIvI\'pu\'vo\' <def> Suqvo\'';
        is $stack[10]{args}[2], '$DIvIZ{q<def>}', 'token->trans = $DIvIZ{q<def>}';
        is $stack[11]{name}, 'arg2_a', 'name = arg2_a (1)';
        is $stack[11]{args}[0], 'Suqvo\'', 'arg2_a[0] = Suqvo\'';
        is $stack[12]{name}, 'pushtok', 'name = pushtok (index 2)';
        is $stack[12]{args}[2], 'q<ghi>', 'token->trans = q<ghi>';
        is $stack[13]{name}, 'to_arg2_a', 'name = to_arg2_a (2)';
        is $stack[13]{args}[0]{trans}, '$DIvIZ{q<def>}->', 'to_arg2_a[0]->trans = $DIvIZ{q<def>}->';
        is $stack[13]{args}[1]{trans}, 'q<ghi>', 'to_arg2_a[1]->trans = q<ghi>';
        is $stack[13]{args}[2]{type}, 'verb', 'to_arg2_a[2]->type = verb';
        is $stack[13]{args}[2]{raw}, 'Suq', 'to_arg2_a[2]->raw = Suq';
        is $stack[13]{args}[2]{trans}, '{q<ghi>}', 'to_arg2_a[2]->trans = {q<ghi>}';
        is scalar(@{$stack[13]{result}}), 1, 'to_arg2_a() has 1 result';
        is $stack[13]{result}[0], '$DIvIZ{q<def>}->{q<ghi>}', 'to_arg2_a() = $DIvIZ{q<def>}->{q<ghi>}';
        is $stack[14]{name}, 'translate', 'name = translate (2)';
        is $stack[14]{result}[0], 'DIvI\'pu\'vo\' <def> Suqvo\' <ghi> Suq', 'translate()->raw = DIvI\'pu\'vo\' <def> Suqvo\' <ghi> Suq';
        is $stack[14]{result}[1], '$DIvIZ{q<def>}->{q<ghi>}', 'translate()->trans = $DIvIZ{q<def>}->{q<ghi>}';
        is $stack[15]{name}, 'pushtok', 'name = pushtok (func 2)';
        is $stack[15]{args}[0], 'acc', 'token->type = acc';
        is $stack[15]{args}[1], 'DIvI\'pu\'vo\' <def> Suqvo\' <ghi> Suq', 'token->raw = DIvI\'pu\'vo\' <def> Suqvo\' <ghi> Suq';
        is $stack[15]{args}[2], '$DIvIZ{q<def>}->{q<ghi>}', 'token->trans = $DIvIZ{q<def>}->{q<ghi>}';
        is $stack[16]{name}, 'arg2_a', 'name = arg2_a (2)';
        is $stack[16]{args}[0], 'Suq', 'arg2_a[0] = Suq';

        note "tISuqvaD";
        is $stack[17]{name}, 'pushtok', 'name = pushtok(array)';
        is $stack[17]{args}[0], 'abl', 'token->type = abl';
        is $stack[17]{args}[1], 'DIvI\'pu\'vo\'', 'token->raw = DIvI\'pu\'vo\'';
        is $stack[17]{args}[2], '%DIvIZ', 'token->trans = %DIvIZ';
        is $stack[18]{name}, 'pushtok', 'name = pushtok(index)';
        is $stack[18]{args}[0], 'acc', 'token->type = acc';
        is $stack[18]{args}[1], '<jkl>', 'token->raw = <jkl>';
        is $stack[18]{args}[2], 'q<jkl>', 'token->trans = q<jkl>';
        is $stack[19]{name}, 'to_arg2_a', 'name = to_arg2_a';
        is $stack[19]{args}[0]{trans}, '$DIvIZ', 'to_arg2_a[0]->trans (after s///) = $DIvIZ';
        is $stack[19]{args}[1]{trans}, 'q<jkl>', 'to_arg2_a[1]->trans = q<jkl>';
        is $stack[19]{args}[2]{type}, 'verb', 'to_arg2_a[2]->type = verb';
        is $stack[19]{args}[2]{raw}, 'SuqvaD', 'to_arg2_a[2]->raw = SuqvaD';
        is $stack[19]{args}[2]{trans}, '{q<jkl>}', 'to_arg2_a[2]->trans (after s///) = {q<jkl>}';
        is scalar(@{$stack[19]{result}}), 1, 'to_arg2_a() has 1 result';
        is $stack[19]{result}[0], '$DIvIZ{q<jkl>}', 'to_arg2_a() = $DIvIZ{q<jkl>}';
        is $stack[20]{name}, 'translate', 'name = translate';
        is $stack[20]{result}[0], 'DIvI\'pu\'vo\' <jkl> SuqvaD', 'translate()->raw = DIvI\'pu\'vo\' <jkl> SuqvaD';
        is $stack[20]{result}[1], '$DIvIZ{q<jkl>}', 'translate()-trans = $DIvIZ{q<jkl>}';
        is $stack[21]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[21]{args}[0], 'dat', 'token->type = dat';
        is $stack[21]{args}[1], 'DIvI\'pu\'vo\' <jkl> SuqvaD', 'token->raw = DIvI\'pu\'vo\' <jkl> SuqvaD';
        is $stack[21]{args}[2], '$DIvIZ{q<jkl>}', 'token->trans = $DIvIZ{q<jkl>}';
        is $stack[22]{name}, 'arg2_a', 'name = arg2_a';
        is $stack[22]{args}[0], 'SuqvaD', 'arg2_a[0] = SuqvaD';

        note "Suq";
        is $stack[23]{name}, 'pushtok', 'name = pushtok(array)';
        is $stack[23]{args}[0], 'abl', 'token->type = abl';
        is $stack[23]{args}[1], 'DIvI\'pu\'vo\'', 'token->raw = DIvI\'pu\'vo\'';
        is $stack[23]{args}[2], '%DIvIZ', 'token->trans = %DIvIZ';
        is $stack[24]{name}, 'pushtok', 'name = pushtok(index)';
        is $stack[24]{args}[0], 'acc', 'token->type = acc';
        is $stack[24]{args}[1], '<mno>', 'token->raw = <mno>';
        is $stack[24]{args}[2], 'q<mno>', 'token->trans = q<mno>';
        is $stack[25]{name}, 'to_arg2_a', 'name = to_arg2_a';
        is $stack[25]{args}[0]{trans}, '$DIvIZ', 'to_arg2_a[0]->trans (after s///) = $DIvIZ';
        is $stack[25]{args}[1]{trans}, 'q<mno>', 'to_arg2_a[1]->trans = q<mno>';
        is $stack[25]{args}[2]{type}, 'verb', 'to_arg2_a[2]->type = verb';
        is $stack[25]{args}[2]{raw}, 'Suq', 'to_arg2_a[2]->raw = Suq';
        is $stack[25]{args}[2]{trans}, '{q<mno>}', 'to_arg2_a[2]->trans (after s///) = {q<mno>}';
        is scalar(@{$stack[25]{result}}), 1, 'to_arg2_a() has 1 result';
        is $stack[25]{result}[0], '$DIvIZ{q<mno>}', 'to_arg2_a() = $DIvIZ{q<mno>}';
        is $stack[26]{name}, 'translate', 'name = translate';
        is $stack[26]{result}[0], 'DIvI\'pu\'vo\' <mno> Suq', 'translate()->raw = DIvI\'pu\'vo\' <mno> Suq';
        is $stack[26]{result}[1], '$DIvIZ{q<mno>}', 'translate()-trans = $DIvIZ{q<mno>}';
        is $stack[27]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[27]{args}[0], 'acc', 'token->type = acc';
        is $stack[27]{args}[1], 'DIvI\'pu\'vo\' <mno> Suq', 'token->raw = DIvI\'pu\'vo\' <mno> Suq';
        is $stack[27]{args}[2], '$DIvIZ{q<mno>}', 'token->trans = $DIvIZ{q<mno>}';
        is $stack[28]{name}, 'arg2_a', 'name = arg2_a';
        is $stack[28]{args}[0], 'Suq', 'arg2_a[0] = Suq';

        note "Suqvo\'";
        is $stack[29]{name}, 'pushtok', 'name = pushtok(array 1)';
        is $stack[29]{args}[0], 'abl', 'token->type = abl';
        is $stack[29]{args}[1], 'DIvI\'pu\'vo\'', 'token->raw = DIvI\'pu\'vo\'';
        is $stack[29]{args}[2], '%DIvIZ', 'token->trans = %DIvIZ';
        is $stack[30]{name}, 'pushtok', 'name = pushtok(index 1)';
        is $stack[30]{args}[0], 'acc', 'token->type = acc';
        is $stack[30]{args}[1], '<pqr>', 'token->raw = <pqr>';
        is $stack[30]{args}[2], 'q<pqr>', 'token->trans = q<pqr>';
        is $stack[31]{name}, 'to_arg2_a', 'name = to_arg2_a (1)';
        is $stack[31]{args}[0]{trans}, '$DIvIZ', 'to_arg2_a[0]->trans (after s///) = $DIvIZ';
        is $stack[31]{args}[1]{trans}, 'q<pqr>', 'to_arg2_a[1]->trans = q<pqr>';
        is $stack[31]{args}[2]{type}, 'verb', 'to_arg2_a[2]->type = verb';
        is $stack[31]{args}[2]{raw}, 'Suqvo\'', 'to_arg2_a[2]->raw = Suqvo\'';
        is $stack[31]{args}[2]{trans}, '{q<pqr>}', 'to_arg2_a[2]->trans (after s///) = {q<pqr>}';
        is scalar(@{$stack[31]{result}}), 1, 'to_arg2_a() has 1 result';
        is $stack[31]{result}[0], '$DIvIZ{q<pqr>}', 'to_arg2_a() = $DIvIZ{q<pqr>}';
        is $stack[32]{name}, 'translate', 'name = translate (1)';
        is $stack[32]{result}[0], 'DIvI\'pu\'vo\' <pqr> Suqvo\'', 'translate()->raw = DIvI\'pu\'vo\' <pqr> Suqvo\'';
        is $stack[32]{result}[1], '$DIvIZ{q<pqr>}', 'translate()-trans = $DIvIZ{q<pqr>}';
        is $stack[33]{name}, 'pushtok', 'name = pushtok(func 1)';
        is $stack[33]{args}[0], 'abl', 'token->type = abl';
        is $stack[33]{args}[1], 'DIvI\'pu\'vo\' <pqr> Suqvo\'', 'token->raw = DIvI\'pu\'vo\' <pqr> Suqvo\'';
        is $stack[33]{args}[2], '$DIvIZ{q<pqr>}', 'token->trans = $DIvIZ{q<pqr>}';
        is $stack[34]{name}, 'arg2_a', 'name = arg2_a (1)';
        is $stack[34]{args}[0], 'Suqvo\'', 'arg2_a[0] = Suqvo\'';
        is $stack[35]{name}, 'pushtok', 'name = pushtok (index 2)';
        is $stack[35]{args}[2], 'q<stu>', 'token->trans = q<stu>';
        is $stack[36]{name}, 'to_arg2_a', 'name = to_arg2_a (2)';
        is $stack[36]{args}[0]{trans}, '$DIvIZ{q<pqr>}->', 'to_arg2_a[0]->trans = $DIvIZ{q<pqr>}->';
        is $stack[36]{args}[1]{trans}, 'q<stu>', 'to_arg2_a[1]->trans = q<stu>';
        is $stack[36]{args}[2]{type}, 'verb', 'to_arg2_a[2]->type = verb';
        is $stack[36]{args}[2]{raw}, 'Suq', 'to_arg2_a[2]->raw = Suq';
        is $stack[36]{args}[2]{trans}, '{q<stu>}', 'to_arg2_a[2]->trans = {q<stu>}';
        is scalar(@{$stack[36]{result}}), 1, 'to_arg2_a() has 1 result';
        is $stack[36]{result}[0], '$DIvIZ{q<pqr>}->{q<stu>}', 'to_arg2_a() = $DIvIZ{q<pqr>}->{q<stu>}';
        is $stack[37]{name}, 'translate', 'name = translate (2)';
        is $stack[37]{result}[0], 'DIvI\'pu\'vo\' <pqr> Suqvo\' <stu> Suq', 'translate()->raw = DIvI\'pu\'vo\' <pqr> Suqvo\' <stu> Suq';
        is $stack[37]{result}[1], '$DIvIZ{q<pqr>}->{q<stu>}', 'translate()->trans = $DIvIZ{q<pqr>}->{q<stu>}';
        is $stack[38]{name}, 'pushtok', 'name = pushtok (func 2)';
        is $stack[38]{args}[0], 'acc', 'token->type = acc';
        is $stack[38]{args}[1], 'DIvI\'pu\'vo\' <pqr> Suqvo\' <stu> Suq', 'token->raw = DIvI\'pu\'vo\' <pqr> Suqvo\' <stu> Suq';
        is $stack[38]{args}[2], '$DIvIZ{q<pqr>}->{q<stu>}', 'token->trans = $DIvIZ{q<pqr>}->{q<stu>}';
        is $stack[39]{name}, 'arg2_a', 'name = arg2_a (2)';
        is $stack[39]{args}[0], 'Suq', 'arg2_a[0] = Suq';

        note "SuqvaD";
        is $stack[40]{name}, 'pushtok', 'name = pushtok(array)';
        is $stack[40]{args}[0], 'abl', 'token->type = abl';
        is $stack[40]{args}[1], 'DIvI\'pu\'vo\'', 'token->raw = DIvI\'pu\'vo\'';
        is $stack[40]{args}[2], '%DIvIZ', 'token->trans = %DIvIZ';
        is $stack[41]{name}, 'pushtok', 'name = pushtok(index)';
        is $stack[41]{args}[0], 'acc', 'token->type = acc';
        is $stack[41]{args}[1], '<vwx>', 'token->raw = <vwx>';
        is $stack[41]{args}[2], 'q<vwx>', 'token->trans = q<vwx>';
        is $stack[42]{name}, 'to_arg2_a', 'name = to_arg2_a';
        is $stack[42]{args}[0]{trans}, '$DIvIZ', 'to_arg2_a[0]->trans (after s///) = $DIvIZ';
        is $stack[42]{args}[1]{trans}, 'q<vwx>', 'to_arg2_a[1]->trans = q<vwx>';
        is $stack[42]{args}[2]{type}, 'verb', 'to_arg2_a[2]->type = verb';
        is $stack[42]{args}[2]{raw}, 'SuqvaD', 'to_arg2_a[2]->raw = SuqvaD';
        is $stack[42]{args}[2]{trans}, '{q<vwx>}', 'to_arg2_a[2]->trans (after s///) = {q<vwx>}';
        is scalar(@{$stack[42]{result}}), 1, 'to_arg2_a() has 1 result';
        is $stack[42]{result}[0], '$DIvIZ{q<vwx>}', 'to_arg2_a() = $DIvIZ{q<vwx>}';
        is $stack[43]{name}, 'translate', 'name = translate';
        is $stack[43]{result}[0], 'DIvI\'pu\'vo\' <vwx> SuqvaD', 'translate()->raw = DIvI\'pu\'vo\' <vwx> SuqvaD';
        is $stack[43]{result}[1], '$DIvIZ{q<vwx>}', 'translate()-trans = $DIvIZ{q<vwx>}';
        is $stack[44]{name}, 'pushtok', 'name = pushtok(func)';
        is $stack[44]{args}[0], 'dat', 'token->type = dat';
        is $stack[44]{args}[1], 'DIvI\'pu\'vo\' <vwx> SuqvaD', 'token->raw = DIvI\'pu\'vo\' <vwx> SuqvaD';
        is $stack[44]{args}[2], '$DIvIZ{q<vwx>}', 'token->trans = $DIvIZ{q<vwx>}';
        is $stack[45]{name}, 'arg2_a', 'name = arg2_a';
        is $stack[45]{args}[0], 'SuqvaD', 'arg2_a[0] = SuqvaD';
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
ghommeyvo' wa' tIDIch! #'
ghommeyvo' cha' tIDIchvo' wej tIDIch! #'
ghommeyvo' loS tIDIchvaD! #'
ghommeyvo' vagh DIch! #'
ghommeyvo' jav DIchvo' Soch DIch! #'
ghommeyvo' chorgh DIchvaD! #'
wa'maH yIvan! #'
nabvaD 'olvo' wa'maH DIch yInob! #'
wa'maH yInabvetlh! #'

wa'maH wa' yIlIH! #'
DIvI'pu'vo' <abc> tISuq! #'
DIvI'pu'vo' <def> tISuqvo' <ghi> tISuq! #'
DIvI'pu'vo' <jkl> tISuqvaD! #'
DIvI'pu'vo' <mno> Suq! #'
DIvI'pu'vo' <pqr> Suqvo' <stu> Suq! #'
DIvI'pu'vo' <vwx> SuqvaD! #'
wa'maH wa' yIvan! #'
nabvaD 'olvo' wa'maH wa' DIch yInob! #'
wa'maH wa' yInabvetlh! #'

yIdone_testing!
