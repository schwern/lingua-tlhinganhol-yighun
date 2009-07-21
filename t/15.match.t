#!perl -w
# vim:set et si:
#
use Test::More
        tests => 43
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
        to_match
        match
);
}

my $Zol = [
(undef)x33,
sub {
        note "match 'pattern'";
        my $step = shift;
        is $step, 33, 'step 33';
        my @stack = extract_stack($step);
        is scalar(@stack), 6, '6 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token <data>';
        is $stack[0]{result}[0]{trans}, 'q< abc123>';
        is $stack[1]{name}, 'pushtok', 'Push token <pattern>';
        # Can't test this here, since to_match() changes the token in-place
        # is $stack[1]{result}[0]{trans}, 'q<\s+\w+\d+>';
        is $stack[2]{name}, 'to_match', 'to_match';
        is $stack[2]{args}[0]{type}, 'acc', 'data is acc';
        is $stack[2]{args}[1]{type}, 'acc', 'pattern is acc';
        is $stack[2]{args}[2]{type}, 'verb', 'op is verb';
        is $stack[2]{result}[0], 'q< abc123> =~ m<\s+\w+\d+>';
        is $stack[3]{name}, 'translate', 'translate';
        is $stack[3]{result}[0], '< abc123> <\s+\w+\d+> ghov', 'translate->raw';
        is $stack[3]{result}[1], 'q< abc123> =~ m<\s+\w+\d+>';
        is $stack[4]{name}, 'pushtok', 'Push token acc';
        is $stack[4]{result}[0]{type}, 'acc', 'token->type';
        is $stack[4]{result}[0]{raw}, '< abc123> <\s+\w+\d+> ghov', 'token->raw';
        is $stack[4]{result}[0]{trans}, 'q< abc123> =~ m<\s+\w+\d+>', 'token->trans';
        is $stack[5]{name}, 'match', 'match';
        is $stack[5]{result}[0]{type}, 'acc', 'token->type';
        is $stack[5]{result}[0]{raw}, '< abc123> <\s+\w+\d+> ghov', 'token->raw';
        is $stack[5]{result}[0]{trans}, 'q< abc123> =~ m<\s+\w+\d+>', 'token->trans';
},
sub {
        note 'match "pattern"';
        my $step = shift;
        is $step, 34, 'step 34';
        my @stack = extract_stack($step);
        is scalar(@stack), 6, '6 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token <data>';
        is $stack[0]{result}[0]{trans}, 'qq< abc123>';
        is $stack[1]{name}, 'pushtok', 'Push token <pattern>';
        # Can't test this here, since to_match() changes the token in-place
        # is $stack[1]{result}[0]{trans}, 'qq<\s+\w+\d+>';
        is $stack[2]{name}, 'to_match', 'to_match';
        is $stack[2]{args}[0]{type}, 'acc', 'data is acc';
        is $stack[2]{args}[1]{type}, 'acc', 'pattern is acc';
        is $stack[2]{args}[2]{type}, 'verb', 'op is verb';
        is $stack[2]{result}[0], 'qq< abc123> =~ m<\s+\w+\d+>';
        is $stack[3]{name}, 'translate', 'translate';
        is $stack[3]{result}[0], '<< abc123>> <<\s+\w+\d+>> ghov', 'translate->raw';
        is $stack[3]{result}[1], 'qq< abc123> =~ m<\s+\w+\d+>';
        is $stack[4]{name}, 'pushtok', 'Push token acc';
        is $stack[4]{result}[0]{type}, 'acc', 'token->type';
        is $stack[4]{result}[0]{raw}, '<< abc123>> <<\s+\w+\d+>> ghov', 'token->raw';
        is $stack[4]{result}[0]{trans}, 'qq< abc123> =~ m<\s+\w+\d+>', 'token->trans';
        is $stack[5]{name}, 'match', 'match';
        is $stack[5]{result}[0]{type}, 'acc', 'token->type';
        is $stack[5]{result}[0]{raw}, '<< abc123>> <<\s+\w+\d+>> ghov', 'token->raw';
        is $stack[5]{result}[0]{trans}, 'qq< abc123> =~ m<\s+\w+\d+>', 'token->trans';
},
];

my @module_args;
BEGIN { push @module_args, 'yIQIj' if $DEBUG; }
BEGIN { push @module_args, 'yImugh' if $TRANSLATE; }
no warnings 'void';
use Lingua::tlhInganHol::yIghun @module_args;
nabwIj!

wejmaH wej yIlIH!
< abc123> <\s+\w+\d+> yIghov!
wejmaH wej yIvan!
nabvaD 'olvo' wejmaH wej DIch yInob!
wejmaH wej yInabvetlh!

wejmaH loS yIlIH!
<< abc123>> <<\s+\w+\d+>> yIghov!
wejmaH loS yIvan!
nabvaD 'olvo' wejmaH loS DIch yInob!
wejmaH loS yInabvetlh!

yIdone_testing!
