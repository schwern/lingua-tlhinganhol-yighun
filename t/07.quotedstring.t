#!perl -w
# vim:set et si:
#
use Test::More
        tests => 29
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
);
}

my $Zol = [
(undef)x1,
sub {
        note "Double-quoted string (1)";
        my $step = shift;
        is $step, 1, 'step 1';
        my @stack = extract_stack($step, 2);
        is scalar(@stack), 1, '1 entry on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '<< maHIv>>', 'token->raw';
        my $result = eval $stack[0]{args}[2];
        is $@, '', 'no error evaluating token->trans';
        is $result, ' maHIv', 'token->trans';
},
sub {
        note "Double-quoted string (2)";
        my $step = shift;
        is $step, 2, 'step 2';
        my @stack = extract_stack($step, 2);
        is scalar(@stack), 1, '1 entry on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '<< tab\\tnewline\\nalarm\\a>>', 'token->raw';
        my $result = eval $stack[0]{args}[2];
        is $@, '', 'no error evaluating token->trans';
        is $result, " tab\tnewline\nalarm\a", 'token->trans';
},
sub {
        note "Single-quoted string (1)";
        my $step = shift;
        is $step, 3, 'step 3';
        my @stack = extract_stack($step, 2);
        is scalar(@stack), 1, '1 entry on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '< maHIv>', 'token->raw';
        my $result = eval $stack[0]{args}[2];
        is $@, '', 'no error evaluating token->trans';
        is $result, ' maHIv', 'token->trans';
},
sub {
        note "Single-quoted string (2)";
        my $step = shift;
        is $step, 4, 'step 4';
        my @stack = extract_stack($step, 2);
        is scalar(@stack), 1, '1 entry on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '< tab\\tnewline\\nalarm\\a>', 'token->raw';
        my $result = eval $stack[0]{args}[2];
        is $@, '', 'no error evaluating token->trans';
        is $result, ' tab\\tnewline\\nalarm\\a', 'token->trans';
},
];

my @module_args;
BEGIN { push @module_args, 'yIQIj' if $DEBUG; }
BEGIN { push @module_args, 'yImugh' if $TRANSLATE; }
no warnings 'void';
use Lingua::tlhInganHol::yIghun @module_args;
nabwIj!

wa' yIlIH! #'
<< maHIv>>!
wa' yIvan! #'
nabvaD 'olvo' wa' DIch yInob! #'
wa' yInabvetlh! #'

cha' yIlIH! #'
<< tab\tnewline\nalarm\a>>!
cha' yIvan! #'
nabvaD 'olvo' cha' DIch yInob! #'
cha' yInabvetlh! #'

wej yIlIH! #'
< maHIv>!
wej yIvan! #'
nabvaD 'olvo' wej DIch yInob! #'
wej yInabvetlh! #'

loS yIlIH! #'
< tab\tnewline\nalarm\a>!
loS yIvan! #'
nabvaD 'olvo' loS DIch yInob! #'
loS yInabvetlh! #'

yIdone_testing!
