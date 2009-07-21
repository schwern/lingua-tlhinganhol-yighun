#!perl -w
# vim:set et si:
#
use Test::More
        tests => 105
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
        to_usage
        usage
);
}

my $Zol = [
(undef)x22,
sub {
        note "use (1)";
        my $step = shift;
        is $step, 22, 'step 22';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok';
        is $stack[0]{args}[0], 'acc', 'token->type';
        is $stack[0]{args}[1], 'constant', 'token->raw';
        is $stack[0]{args}[2], '$constant', 'token->trans';
        is $stack[1]{name}, 'to_usage';
        is $stack[1]{result}[0], 'use constant';
        is $stack[2]{name}, 'translate';
        is $stack[2]{args}[0]{type}, 'acc';
        is $stack[2]{args}[0]{raw}, 'constant';
        is $stack[2]{args}[0]{trans}, 'constant';
        is $stack[2]{args}[1]{type}, 'verb';
        is $stack[2]{args}[1]{raw}, "lo'";
        is $stack[2]{args}[1]{trans}, 'use';
        is $stack[2]{result}[0], "constant lo'";
        is $stack[2]{result}[1], 'use constant';
        is $stack[3]{name}, 'pushtok';
        is $stack[3]{result}[0]{type}, 'cmd';
        is $stack[3]{result}[0]{raw}, "constant lo'";
        is $stack[3]{result}[0]{trans}, 'use constant';
        is $stack[4]{name}, 'usage';
        is $stack[4]{args}[0], "lo'";
        is $stack[4]{result}[0]{type}, 'cmd';
        is $stack[4]{result}[0]{raw}, "constant lo'";
        is $stack[4]{result}[0]{trans}, 'use constant';
},
sub {
        note "use (2)";
        my $step = shift;
        is $step, 23, 'step 23';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok';
        is $stack[0]{args}[0], 'acc', 'token->type';
        is $stack[0]{args}[1], 'constant', 'token->raw';
        is $stack[0]{args}[2], '$constant', 'token->trans';
        is $stack[1]{name}, 'to_usage';
        is $stack[1]{result}[0], 'use constant';
        is $stack[2]{name}, 'translate';
        is $stack[2]{args}[0]{type}, 'acc';
        is $stack[2]{args}[0]{raw}, 'constant';
        is $stack[2]{args}[0]{trans}, 'constant';
        is $stack[2]{args}[1]{type}, 'verb';
        is $stack[2]{args}[1]{raw}, "lo'";
        is $stack[2]{args}[1]{trans}, 'use';
        is $stack[2]{result}[0], "constant lo'";
        is $stack[2]{result}[1], 'use constant';
        is $stack[3]{name}, 'pushtok';
        is $stack[3]{result}[0]{type}, 'cmd';
        is $stack[3]{result}[0]{raw}, "constant lo'";
        is $stack[3]{result}[0]{trans}, 'use constant';
        is $stack[4]{name}, 'usage';
        is $stack[4]{args}[0], "lo'";
        is $stack[4]{result}[0]{type}, 'cmd';
        is $stack[4]{result}[0]{raw}, "constant lo'";
        is $stack[4]{result}[0]{trans}, 'use constant';
},
sub {
        note "use (3)";
        my $step = shift;
        is $step, 24, 'step 24';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok';
        is $stack[0]{args}[0], 'acc', 'token->type';
        is $stack[0]{args}[1], 'constant', 'token->raw';
        is $stack[0]{args}[2], '$constant', 'token->trans';
        is $stack[1]{name}, 'to_usage';
        is $stack[1]{result}[0], 'no constant';
        is $stack[2]{name}, 'translate';
        is $stack[2]{args}[0]{type}, 'acc';
        is $stack[2]{args}[0]{raw}, 'constant';
        is $stack[2]{args}[0]{trans}, 'constant';
        is $stack[2]{args}[1]{type}, 'verb';
        is $stack[2]{args}[1]{raw}, "lo'Qo'";
        is $stack[2]{args}[1]{trans}, 'no';
        is $stack[2]{result}[0], "constant lo'Qo'";
        is $stack[2]{result}[1], 'no constant';
        is $stack[3]{name}, 'pushtok';
        is $stack[3]{result}[0]{type}, 'cmd';
        is $stack[3]{result}[0]{raw}, "constant lo'Qo'";
        is $stack[3]{result}[0]{trans}, 'no constant';
        is $stack[4]{name}, 'usage';
        is $stack[4]{args}[0], "lo'Qo'";
        is $stack[4]{result}[0]{type}, 'cmd';
        is $stack[4]{result}[0]{raw}, "constant lo'Qo'";
        is $stack[4]{result}[0]{trans}, 'no constant';
},
sub {
        note "use (4)";
        my $step = shift;
        is $step, 25, 'step 25';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok';
        is $stack[0]{args}[0], 'acc', 'token->type';
        is $stack[0]{args}[1], 'constant', 'token->raw';
        is $stack[0]{args}[2], '$constant', 'token->trans';
        is $stack[1]{name}, 'to_usage';
        is $stack[1]{result}[0], 'no constant';
        is $stack[2]{name}, 'translate';
        is $stack[2]{args}[0]{type}, 'acc';
        is $stack[2]{args}[0]{raw}, 'constant';
        is $stack[2]{args}[0]{trans}, 'constant';
        is $stack[2]{args}[1]{type}, 'verb';
        is $stack[2]{args}[1]{raw}, "lo'Qo'";
        is $stack[2]{args}[1]{trans}, 'no';
        is $stack[2]{result}[0], "constant lo'Qo'";
        is $stack[2]{result}[1], 'no constant';
        is $stack[3]{name}, 'pushtok';
        is $stack[3]{result}[0]{type}, 'cmd';
        is $stack[3]{result}[0]{raw}, "constant lo'Qo'";
        is $stack[3]{result}[0]{trans}, 'no constant';
        is $stack[4]{name}, 'usage';
        is $stack[4]{args}[0], "lo'Qo'";
        is $stack[4]{result}[0]{type}, 'cmd';
        is $stack[4]{result}[0]{raw}, "constant lo'Qo'";
        is $stack[4]{result}[0]{trans}, 'no constant';
},
];

my @module_args;
BEGIN { push @module_args, 'yIQIj' if $DEBUG; }
BEGIN { push @module_args, 'yImugh' if $TRANSLATE; }
no warnings 'void';
use Lingua::tlhInganHol::yIghun @module_args;
nabwIj!

cha'maH cha' yIlIH!
constant lo'! #'
cha'maH cha' yIvan!
nabvaD 'olvo' cha'maH cha' DIch yInob!
cha'maH cha' yInabvetlh!

cha'maH wej yIlIH! #'
constant yIlo'! #'
cha'maH wej yIvan! #'
nabvaD 'olvo' cha'maH wej DIch yInob! #'
cha'maH wej yInabvetlh! #'

cha'maH loS yIlIH! #'
constant lo'Qo'!
cha'maH loS yIvan! #'
nabvaD 'olvo' cha'maH loS DIch yInob! #'
cha'maH loS yInabvetlh! #'

cha'maH vagh yIlIH! #'
constant yIlo'Qo'!
cha'maH vagh yIvan! #'
nabvaD 'olvo' cha'maH vagh DIch yInob! #'
cha'maH vagh yInabvetlh! #'

yIdone_testing!
