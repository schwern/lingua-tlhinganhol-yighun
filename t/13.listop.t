#!perl -w
# vim:set et si:
#
use Test::More
        tests => 127
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
        to_listop
        listop
);
}

my $Zol = [
(undef)x26,
sub {
        note "listop 1: sort";
        my $step = shift;
        is $step, 26, 'step 26';
        my @stack = extract_stack($step, 4);
        is scalar(@stack), 14, '14 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token {';
        is $stack[0]{result}[0]{trans}, '{';
        is $stack[1]{name}, 'to_Terran';
        is $stack[1]{result}[0], '0';
        is $stack[2]{name}, 'pushtok', 'Push token 0 (in sort block)';
        is $stack[2]{result}[0]{trans}, '0';
        is $stack[3]{name}, 'pushtok', 'Push token }';
        is $stack[3]{result}[0]{raw}, '{...}';
        is $stack[3]{result}[0]{trans}, "{0;\n}";
        is $stack[4]{name}, 'to_Terran';
        is $stack[4]{result}[0], '1';
        is $stack[5]{name}, 'pushtok', 'Push token 1';
        is $stack[5]{result}[0]{trans}, '1';
        is $stack[6]{name}, 'to_Terran';
        is $stack[6]{result}[0], '2';
        is $stack[7]{name}, 'pushtok', 'Push token 2';
        is $stack[7]{result}[0]{trans}, '2';
        is $stack[8]{name}, 'to_Terran';
        is $stack[8]{result}[0], '3';
        is $stack[9]{name}, 'pushtok', 'Push token 3';
        is $stack[9]{result}[0]{trans}, '3';
        is $stack[10]{name}, 'to_listop', 'to_listop';
        is scalar(@{$stack[10]{args}}), 5, '5 args for to_listop';
        is $stack[10]{args}[0]{type}, 'block';
        is $stack[10]{args}[1]{type}, 'acc';
        is $stack[10]{args}[2]{type}, 'acc';
        is $stack[10]{args}[3]{type}, 'acc';
        is $stack[10]{args}[4]{type}, 'verb';
        is $stack[10]{result}[0], "sort {0;\n} 1,2,3", 'to_listop()';
        is $stack[11]{name}, 'translate', 'translate';
        is $stack[11]{result}[0], "{...} wa' cha' wej mISHa'moH", 'translate->raw';
        is $stack[11]{result}[1], "sort {0;\n} 1,2,3", 'translate->trans';
        is $stack[12]{name}, 'pushtok', 'Push token acc';
        is $stack[12]{result}[0]{type}, 'acc', 'token->type';
        is $stack[12]{result}[0]{raw}, "{...} wa' cha' wej mISHa'moH", 'token->raw';
        is $stack[12]{result}[0]{trans}, "sort {0;\n} 1,2,3", 'token->trans';
        is $stack[13]{name}, 'listop', 'listop';
        is $stack[13]{result}[0]{type}, 'acc', 'token->type';
        is $stack[13]{result}[0]{raw}, "{...} wa' cha' wej mISHa'moH", 'token->raw';
        is $stack[13]{result}[0]{trans}, "sort {0;\n} 1,2,3", 'token->trans';
},
sub {
        note "listop 2: grep";
        my $step = shift;
        is $step, 27, 'step 27';
        my @stack = extract_stack($step, 4);
        is scalar(@stack), 14, '14 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token {';
        is $stack[0]{result}[0]{trans}, '{';
        is $stack[1]{name}, 'to_Terran';
        is $stack[1]{result}[0], '0';
        is $stack[2]{name}, 'pushtok', 'Push token 0 (in grep block)';
        is $stack[2]{result}[0]{trans}, '0';
        is $stack[3]{name}, 'pushtok', 'Push token }';
        is $stack[3]{result}[0]{raw}, '{...}';
        is $stack[3]{result}[0]{trans}, "{0;\n}";
        is $stack[4]{name}, 'to_Terran';
        is $stack[4]{result}[0], '1';
        is $stack[5]{name}, 'pushtok', 'Push token 1';
        is $stack[5]{result}[0]{trans}, '1';
        is $stack[6]{name}, 'to_Terran';
        is $stack[6]{result}[0], '2';
        is $stack[7]{name}, 'pushtok', 'Push token 2';
        is $stack[7]{result}[0]{trans}, '2';
        is $stack[8]{name}, 'to_Terran';
        is $stack[8]{result}[0], '3';
        is $stack[9]{name}, 'pushtok', 'Push token 3';
        is $stack[9]{result}[0]{trans}, '3';
        is $stack[10]{name}, 'to_listop', 'to_listop';
        is scalar(@{$stack[10]{args}}), 5, '5 args for to_listop';
        is $stack[10]{args}[0]{type}, 'block';
        is $stack[10]{args}[1]{type}, 'acc';
        is $stack[10]{args}[2]{type}, 'acc';
        is $stack[10]{args}[3]{type}, 'acc';
        is $stack[10]{args}[4]{type}, 'verb';
        is $stack[10]{result}[0], "grep {0;\n} 1,2,3", 'to_listop()';
        is $stack[11]{name}, 'translate', 'translate';
        is $stack[11]{result}[0], "{...} wa' cha' wej wIv", 'translate->raw';
        is $stack[11]{result}[1], "grep {0;\n} 1,2,3", 'translate->trans';
        is $stack[12]{name}, 'pushtok', 'Push token acc';
        is $stack[12]{result}[0]{type}, 'acc', 'token->type';
        is $stack[12]{result}[0]{raw}, "{...} wa' cha' wej wIv", 'token->raw';
        is $stack[12]{result}[0]{trans}, "grep {0;\n} 1,2,3", 'token->trans';
        is $stack[13]{name}, 'listop', 'listop';
        is $stack[13]{result}[0]{type}, 'acc', 'token->type';
        is $stack[13]{result}[0]{raw}, "{...} wa' cha' wej wIv", 'token->raw';
        is $stack[13]{result}[0]{trans}, "grep {0;\n} 1,2,3", 'token->trans';
},
sub {
        note "listop 3: map";
        my $step = shift;
        is $step, 28, 'step 28';
        my @stack = extract_stack($step, 4);
        is scalar(@stack), 14, '14 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token {';
        is $stack[0]{result}[0]{trans}, '{';
        is $stack[1]{name}, 'to_Terran';
        is $stack[1]{result}[0], '0';
        is $stack[2]{name}, 'pushtok', 'Push token 0 (in map block)';
        is $stack[2]{result}[0]{trans}, '0';
        is $stack[3]{name}, 'pushtok', 'Push token }';
        is $stack[3]{result}[0]{raw}, '{...}';
        is $stack[3]{result}[0]{trans}, "{0;\n}";
        is $stack[4]{name}, 'to_Terran';
        is $stack[4]{result}[0], '1';
        is $stack[5]{name}, 'pushtok', 'Push token 1';
        is $stack[5]{result}[0]{trans}, '1';
        is $stack[6]{name}, 'to_Terran';
        is $stack[6]{result}[0], '2';
        is $stack[7]{name}, 'pushtok', 'Push token 2';
        is $stack[7]{result}[0]{trans}, '2';
        is $stack[8]{name}, 'to_Terran';
        is $stack[8]{result}[0], '3';
        is $stack[9]{name}, 'pushtok', 'Push token 3';
        is $stack[9]{result}[0]{trans}, '3';
        is $stack[10]{name}, 'to_listop', 'to_listop';
        is scalar(@{$stack[10]{args}}), 5, '5 args for to_listop';
        is $stack[10]{args}[0]{type}, 'block';
        is $stack[10]{args}[1]{type}, 'acc';
        is $stack[10]{args}[2]{type}, 'acc';
        is $stack[10]{args}[3]{type}, 'acc';
        is $stack[10]{args}[4]{type}, 'verb';
        is $stack[10]{result}[0], "map {0;\n} 1,2,3", 'to_listop()';
        is $stack[11]{name}, 'translate', 'translate';
        is $stack[11]{result}[0], "{...} wa' cha' wej choH", 'translate->raw';
        is $stack[11]{result}[1], "map {0;\n} 1,2,3", 'translate->trans';
        is $stack[12]{name}, 'pushtok', 'Push token acc';
        is $stack[12]{result}[0]{type}, 'acc', 'token->type';
        is $stack[12]{result}[0]{raw}, "{...} wa' cha' wej choH", 'token->raw';
        is $stack[12]{result}[0]{trans}, "map {0;\n} 1,2,3", 'token->trans';
        is $stack[13]{name}, 'listop', 'listop';
        is $stack[13]{result}[0]{type}, 'acc', 'token->type';
        is $stack[13]{result}[0]{raw}, "{...} wa' cha' wej choH", 'token->raw';
        is $stack[13]{result}[0]{trans}, "map {0;\n} 1,2,3", 'token->trans';
},
];

my @module_args;
BEGIN { push @module_args, 'yIQIj' if $DEBUG; }
BEGIN { push @module_args, 'yImugh' if $TRANSLATE; }
no warnings 'void';
use Lingua::tlhInganHol::yIghun @module_args;
nabwIj!

cha'maH jav yIlIH! #'
{ pagh! } wa' cha' wej tImISHa'moH! #'
cha'maH jav yIvan! #'
nabvaD 'olvo' cha'maH jav DIch yInob! #'
cha'maH jav yInabvetlh! #'

cha'maH Soch yIlIH! #'
{ pagh! } wa' cha' wej tIwIv!
cha'maH Soch yIvan! #'
nabvaD 'olvo' cha'maH Soch DIch yInob! #'
cha'maH Soch yInabvetlh! #'

cha'maH chorgh yIlIH! #'
{ pagh! } wa' cha' wej tIchoH!
cha'maH chorgh yIvan! #'
nabvaD 'olvo' cha'maH chorgh DIch yInob! #'
cha'maH chorgh yInabvetlh! #'

yIdone_testing!
