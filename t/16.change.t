#!perl -w
# vim:set et si:
#
use Test::More
        tests => 101
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
        to_change
        change
);
}

my $Zol = [
(undef)x35,
sub {
        note "s 'pattern' 'replacement'";
        my $step = shift;
        is $step, 35, 'step 35';
        my @stack = extract_stack($step);
        is scalar(@stack), 7, '7 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token <data>';
        is $stack[0]{result}[0]{type}, 'dat', 'token->type';
        is $stack[0]{result}[0]{raw}, 'varvaD', 'token->raw';
        is $stack[0]{result}[0]{trans}, '$var', 'token->trans';
        is $stack[1]{name}, 'pushtok', 'Push token <pattern>';
        # Can't test this here, since to_change() changes the token in-place
        # is $stack[1]{result}[0]{trans}, 'q< abc >';
        is $stack[2]{name}, 'pushtok', 'Push token <replacement>';
        # is $stack[2]{result}[0]{trans}, 'q< def >';
        is $stack[3]{name}, 'to_change', 'to_change';
        is $stack[3]{args}[0]{type}, 'dat', 'expression is dat';
        is $stack[3]{args}[1]{type}, 'acc', 'pattern is acc';
        is $stack[3]{args}[2]{type}, 'acc', 'replacement is acc';
        is $stack[3]{args}[3]{type}, 'verb', 'op is verb';
        is $stack[3]{result}[0], '$var =~ s< abc >< def >';
        is $stack[4]{name}, 'translate', 'translate';
        is $stack[4]{result}[0], 'varvaD < abc > < def > tam', 'translate->raw';
        is $stack[4]{result}[1], '$var =~ s< abc >< def >';
        is $stack[5]{name}, 'pushtok', 'Push token acc';
        is $stack[5]{result}[0]{type}, 'acc', 'token->type';
        is $stack[5]{result}[0]{raw}, 'varvaD < abc > < def > tam', 'token->raw';
        is $stack[5]{result}[0]{trans}, '$var =~ s< abc >< def >', 'token->trans';
        is $stack[6]{name}, 'change', 'change';
        is $stack[6]{result}[0]{type}, 'acc', 'token->type';
        is $stack[6]{result}[0]{raw}, 'varvaD < abc > < def > tam', 'token->raw';
        is $stack[6]{result}[0]{trans}, '$var =~ s< abc >< def >', 'token->trans';
},
sub {
        note 's "pattern" "replacement"';
        my $step = shift;
        is $step, 36, 'step 36';
        my @stack = extract_stack($step);
        is scalar(@stack), 7, '7 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token <data>';
        is $stack[0]{result}[0]{type}, 'dat', 'token->type';
        is $stack[0]{result}[0]{raw}, 'varvaD', 'token->raw';
        is $stack[0]{result}[0]{trans}, '$var', 'token->trans';
        is $stack[1]{name}, 'pushtok', 'Push token <pattern>';
        # Can't test this here, since to_change() changes the token in-place
        # is $stack[1]{result}[0]{trans}, 'qq< abc >';
        is $stack[2]{name}, 'pushtok', 'Push token <replacement>';
        # is $stack[2]{result}[0]{trans}, 'qq< def >';
        is $stack[3]{name}, 'to_change', 'to_change';
        is $stack[3]{args}[0]{type}, 'dat', 'expression is dat';
        is $stack[3]{args}[1]{type}, 'acc', 'pattern is acc';
        is $stack[3]{args}[2]{type}, 'acc', 'replacement is acc';
        is $stack[3]{args}[3]{type}, 'verb', 'op is verb';
        is $stack[3]{result}[0], '$var =~ s< abc >< def >';
        is $stack[4]{name}, 'translate', 'translate';
        is $stack[4]{result}[0], 'varvaD << abc >> << def >> tam', 'translate->raw';
        is $stack[4]{result}[1], '$var =~ s< abc >< def >';
        is $stack[5]{name}, 'pushtok', 'Push token acc';
        is $stack[5]{result}[0]{type}, 'acc', 'token->type';
        is $stack[5]{result}[0]{raw}, 'varvaD << abc >> << def >> tam', 'token->raw';
        is $stack[5]{result}[0]{trans}, '$var =~ s< abc >< def >', 'token->trans';
        is $stack[6]{name}, 'change', 'change';
        is $stack[6]{result}[0]{type}, 'acc', 'token->type';
        is $stack[6]{result}[0]{raw}, 'varvaD << abc >> << def >> tam', 'token->raw';
        is $stack[6]{result}[0]{trans}, '$var =~ s< abc >< def >', 'token->trans';
},
sub {
        note "tr 'pattern' 'replacement'";
        my $step = shift;
        is $step, 37, 'step 37';
        my @stack = extract_stack($step);
        is scalar(@stack), 7, '7 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token <data>';
        is $stack[0]{result}[0]{type}, 'dat', 'token->type';
        is $stack[0]{result}[0]{raw}, 'varvaD', 'token->raw';
        is $stack[0]{result}[0]{trans}, '$var', 'token->trans';
        is $stack[1]{name}, 'pushtok', 'Push token <pattern>';
        # Can't test this here, since to_change() changes the token in-place
        # is $stack[1]{result}[0]{trans}, 'q< abc >';
        is $stack[2]{name}, 'pushtok', 'Push token <replacement>';
        # is $stack[2]{result}[0]{trans}, 'q< def >';
        is $stack[3]{name}, 'to_change', 'to_change';
        is $stack[3]{args}[0]{type}, 'dat', 'expression is dat';
        is $stack[3]{args}[1]{type}, 'acc', 'pattern is acc';
        is $stack[3]{args}[2]{type}, 'acc', 'replacement is acc';
        is $stack[3]{args}[3]{type}, 'verb', 'op is verb';
        is $stack[3]{result}[0], '$var =~ tr< abc >< def >';
        is $stack[4]{name}, 'translate', 'translate';
        is $stack[4]{result}[0], 'varvaD < abc > < def > mugh', 'translate->raw';
        is $stack[4]{result}[1], '$var =~ tr< abc >< def >';
        is $stack[5]{name}, 'pushtok', 'Push token acc';
        is $stack[5]{result}[0]{type}, 'acc', 'token->type';
        is $stack[5]{result}[0]{raw}, 'varvaD < abc > < def > mugh', 'token->raw';
        is $stack[5]{result}[0]{trans}, '$var =~ tr< abc >< def >', 'token->trans';
        is $stack[6]{name}, 'change', 'change';
        is $stack[6]{result}[0]{type}, 'acc', 'token->type';
        is $stack[6]{result}[0]{raw}, 'varvaD < abc > < def > mugh', 'token->raw';
        is $stack[6]{result}[0]{trans}, '$var =~ tr< abc >< def >', 'token->trans';
},
sub {
        note 'tr "pattern" "replacement"';
        my $step = shift;
        is $step, 38, 'step 38';
        my @stack = extract_stack($step);
        is scalar(@stack), 7, '7 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token <data>';
        is $stack[0]{result}[0]{type}, 'dat', 'token->type';
        is $stack[0]{result}[0]{raw}, 'varvaD', 'token->raw';
        is $stack[0]{result}[0]{trans}, '$var', 'token->trans';
        is $stack[1]{name}, 'pushtok', 'Push token <pattern>';
        # Can't test this here, since to_change() changes the token in-place
        # is $stack[1]{result}[0]{trans}, 'qq< abc >';
        is $stack[2]{name}, 'pushtok', 'Push token <replacement>';
        # is $stack[2]{result}[0]{trans}, 'qq< def >';
        is $stack[3]{name}, 'to_change', 'to_change';
        is $stack[3]{args}[0]{type}, 'dat', 'expression is dat';
        is $stack[3]{args}[1]{type}, 'acc', 'pattern is acc';
        is $stack[3]{args}[2]{type}, 'acc', 'replacement is acc';
        is $stack[3]{args}[3]{type}, 'verb', 'op is verb';
        is $stack[3]{result}[0], '$var =~ tr< abc >< def >';
        is $stack[4]{name}, 'translate', 'translate';
        is $stack[4]{result}[0], 'varvaD << abc >> << def >> mugh', 'translate->raw';
        is $stack[4]{result}[1], '$var =~ tr< abc >< def >';
        is $stack[5]{name}, 'pushtok', 'Push token acc';
        is $stack[5]{result}[0]{type}, 'acc', 'token->type';
        is $stack[5]{result}[0]{raw}, 'varvaD << abc >> << def >> mugh', 'token->raw';
        is $stack[5]{result}[0]{trans}, '$var =~ tr< abc >< def >', 'token->trans';
        is $stack[6]{name}, 'change', 'change';
        is $stack[6]{result}[0]{type}, 'acc', 'token->type';
        is $stack[6]{result}[0]{raw}, 'varvaD << abc >> << def >> mugh', 'token->raw';
        is $stack[6]{result}[0]{trans}, '$var =~ tr< abc >< def >', 'token->trans';
},
];

my @module_args;
BEGIN { push @module_args, 'yIQIj' if $DEBUG; }
BEGIN { push @module_args, 'yImugh' if $TRANSLATE; }
no warnings 'void';
use Lingua::tlhInganHol::yIghun @module_args;
nabwIj!

varwIj!
varvaD <bla> yInob!

wejmaH vagh yIlIH!
varvaD < abc > < def > tItam !
wejmaH vagh yIvan!
nabvaD 'olvo' wejmaH vagh DIch yInob!
wejmaH vagh yInabvetlh!

wejmaH jav yIlIH!
varvaD << abc >> << def >> tItam !
wejmaH jav yIvan!
nabvaD 'olvo' wejmaH jav DIch yInob!
wejmaH jav yInabvetlh!

wejmaH Soch yIlIH!
varvaD < abc > < def > tImugh!
wejmaH Soch yIvan!
nabvaD 'olvo' wejmaH Soch DIch yInob!
wejmaH Soch yInabvetlh!

wejmaH chorgh yIlIH!
varvaD << abc >> << def >> tImugh!
wejmaH chorgh yIvan!
nabvaD 'olvo' wejmaH chorgh DIch yInob!
wejmaH chorgh yInabvetlh!

yIdone_testing!
