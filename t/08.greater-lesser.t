#!perl -w
# vim:set et si:
#
use Test::More
        tests => 163
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
        greater
        lesser
);
}

my $Zol = [
(undef)x5,
sub {
        note "Comparison (>)";
        my $step = shift;
        is $step, 5, 'step 5';
        my @stack = extract_stack($step, 2);
        is scalar(@stack), 6, '6 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token(5)';
        is $stack[0]{args}[2], '5', 'token->trans = 5';
        is $stack[1]{name}, 'pushtok', 'Push token(greater)';
        is $stack[1]{args}[0], 'greater', 'token->type = greater';
        is $stack[1]{args}[1], "vagh tIn law'", 'token->raw';
        is $stack[1]{args}[2], '5 >', 'token->trans';
        is $stack[2]{name}, 'greater', 'greater';
        is $stack[2]{args}[0], 'tIn', 'tIn (greater)';
        is $stack[3]{name}, 'pushtok', 'Push token(2)';
        is $stack[3]{args}[2], '2', 'token->trans = 2';
        is $stack[4]{name}, 'pushtok', 'Push token(lesser)';
        is $stack[4]{args}[0], 'acc', 'token->type for lesser = acc';
        is $stack[4]{args}[1], "vagh tIn law' cha' tIn puS", 'token->raw';
        is $stack[4]{args}[2], '5 > 2', 'token->trans';
        is $stack[5]{name}, 'lesser', 'lesser';
        is $stack[5]{args}[0], 'tIn', 'tIn (lesser)';
},
sub {
        note "Comparison (><)";
        my $step = shift;
        is $step, 6, 'step 6';
        my @stack = extract_stack($step, 2);
        is scalar(@stack), 6, '6 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token(10)';
        is $stack[0]{args}[2], '10', 'token->trans = 10';
        is $stack[1]{name}, 'pushtok', 'Push token(greater)';
        is $stack[1]{args}[0], 'greater', 'token->type = greater';
        is $stack[1]{args}[1], "wa'maH tIn law'", 'token->raw';
        is $stack[1]{args}[2], '10 >', 'token->trans';
        is $stack[2]{name}, 'greater', 'greater';
        is $stack[2]{args}[0], 'tIn', 'tIn (greater)';
        is $stack[3]{name}, 'pushtok', 'Push token(300)';
        is $stack[3]{args}[2], '300', 'token->trans = 300';
        is $stack[4]{name}, 'pushtok', 'Push token(lesser)';
        is $stack[4]{args}[0], 'acc', 'token->type for lesser = acc';
        is $stack[4]{args}[1], "wa'maH tIn law' wejvatlh mach puS", 'token->raw';
        is $stack[4]{args}[2], '10 > 300', 'token->trans';
        is $stack[5]{name}, 'lesser', 'lesser';
        is $stack[5]{args}[0], 'mach', 'mach (lesser)';
        # TODO: If the two operators are not the same, this should
        # probably be checked and raise an exception.
        # Currently, we don't even notice this.
},
sub {
        note "Comparison (<)";
        my $step = shift;
        is $step, 7, 'step 7';
        my @stack = extract_stack($step, 2);
        is scalar(@stack), 6, '6 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token(5)';
        is $stack[0]{args}[2], '5', 'token->trans = 5';
        is $stack[1]{name}, 'pushtok', 'Push token(greater)';
        is $stack[1]{args}[0], 'greater', 'token->type = greater';
        is $stack[1]{args}[1], "vagh mach law'", 'token->raw';
        is $stack[1]{args}[2], '5 <', 'token->trans';
        is $stack[2]{name}, 'greater', 'greater';
        is $stack[2]{args}[0], 'mach', 'mach (greater)';
        is $stack[3]{name}, 'pushtok', 'Push token(2)';
        is $stack[3]{args}[2], '2', 'token->trans = 2';
        is $stack[4]{name}, 'pushtok', 'Push token(lesser)';
        is $stack[4]{args}[0], 'acc', 'token->type for lesser = acc';
        is $stack[4]{args}[1], "vagh mach law' cha' mach puS", 'token->raw';
        is $stack[4]{args}[2], '5 < 2', 'token->trans';
        is $stack[5]{name}, 'lesser', 'lesser';
        is $stack[5]{args}[0], 'mach', 'mach (lesser)';
},
sub {
        note "Comparison (<=)";
        my $step = shift;
        is $step, 8, 'step 8';
        my @stack = extract_stack($step, 2);
        is scalar(@stack), 6, '6 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token(5)';
        is $stack[0]{args}[2], '5', 'token->trans = 5';
        is $stack[1]{name}, 'pushtok', 'Push token(greater)';
        is $stack[1]{args}[0], 'greater', 'token->type = greater';
        is $stack[1]{args}[1], "vagh tInbe' law'", 'token->raw';
        is $stack[1]{args}[2], '5 <=', 'token->trans';
        is $stack[2]{name}, 'greater', 'greater';
        is $stack[2]{args}[0], "tInbe'", "tInbe' (greater)";
        is $stack[3]{name}, 'pushtok', 'Push token(2)';
        is $stack[3]{args}[2], '2', 'token->trans = 2';
        is $stack[4]{name}, 'pushtok', 'Push token(lesser)';
        is $stack[4]{args}[0], 'acc', 'token->type for lesser = acc';
        is $stack[4]{args}[1], "vagh tInbe' law' cha' tInbe' puS", 'token->raw';
        is $stack[4]{args}[2], '5 <= 2', 'token->trans';
        is $stack[5]{name}, 'lesser', 'lesser';
        is $stack[5]{args}[0], "tInbe'", "tInbe' (lesser)";
},
sub {
        note "Comparison (>=)";
        my $step = shift;
        is $step, 9, 'step 9';
        my @stack = extract_stack($step, 2);
        is scalar(@stack), 6, '6 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token(5)';
        is $stack[0]{args}[2], '5', 'token->trans = 5';
        is $stack[1]{name}, 'pushtok', 'Push token(greater)';
        is $stack[1]{args}[0], 'greater', 'token->type = greater';
        is $stack[1]{args}[1], "vagh machbe' law'", 'token->raw';
        is $stack[1]{args}[2], '5 >=', 'token->trans';
        is $stack[2]{name}, 'greater', 'greater';
        is $stack[2]{args}[0], "machbe'", "machbe' (greater)";
        is $stack[3]{name}, 'pushtok', 'Push token(2)';
        is $stack[3]{args}[2], '2', 'token->trans = 2';
        is $stack[4]{name}, 'pushtok', 'Push token(lesser)';
        is $stack[4]{args}[0], 'acc', 'token->type for lesser = acc';
        is $stack[4]{args}[1], "vagh machbe' law' cha' machbe' puS", 'token->raw';
        is $stack[4]{args}[2], '5 >= 2', 'token->trans';
        is $stack[5]{name}, 'lesser', 'lesser';
        is $stack[5]{args}[0], "machbe'", "machbe' (lesser)";
},
sub {
        note "Comparison (lt)";
        my $step = shift;
        is $step, 10, 'step 10';
        my @stack = extract_stack($step, 2);
        is scalar(@stack), 6, '6 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token(q<jup>)';
        is $stack[0]{args}[2], 'q<jup>', 'token->trans = q<jup>';
        is $stack[1]{name}, 'pushtok', 'Push token(greater)';
        is $stack[1]{args}[0], 'greater', 'token->type = greater';
        is $stack[1]{args}[1], "<jup> nung law'", 'token->raw';
        is $stack[1]{args}[2], 'q<jup> lt', 'token->trans';
        is $stack[2]{name}, 'greater', 'greater';
        is $stack[2]{args}[0], "nung", "nung (greater)";
        is $stack[3]{name}, 'pushtok', 'Push token(q<jagh>)';
        is $stack[3]{args}[2], 'q<jagh>', 'token->trans = q<jagh>';
        is $stack[4]{name}, 'pushtok', 'Push token(lesser)';
        is $stack[4]{args}[0], 'acc', 'token->type for lesser = acc';
        is $stack[4]{args}[1], "<jup> nung law' <jagh> nung puS", 'token->raw';
        is $stack[4]{args}[2], 'q<jup> lt q<jagh>', 'token->trans';
        is $stack[5]{name}, 'lesser', 'lesser';
        is $stack[5]{args}[0], "nung", "nung (lesser)";
},
sub {
        note "Comparison (gt)";
        my $step = shift;
        is $step, 11, 'step 11';
        my @stack = extract_stack($step, 2);
        is scalar(@stack), 6, '6 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token(q<jup>)';
        is $stack[0]{args}[2], 'q<jup>', 'token->trans = q<jup>';
        is $stack[1]{name}, 'pushtok', 'Push token(greater)';
        is $stack[1]{args}[0], 'greater', 'token->type = greater';
        is $stack[1]{args}[1], "<jup> tlha' law'", 'token->raw';
        is $stack[1]{args}[2], 'q<jup> gt', 'token->trans';
        is $stack[2]{name}, 'greater', 'greater';
        is $stack[2]{args}[0], "tlha'", "tlha' (greater)";
        is $stack[3]{name}, 'pushtok', 'Push token(q<jagh>)';
        is $stack[3]{args}[2], 'q<jagh>', 'token->trans = q<jagh>';
        is $stack[4]{name}, 'pushtok', 'Push token(lesser)';
        is $stack[4]{args}[0], 'acc', 'token->type for lesser = acc';
        is $stack[4]{args}[1], "<jup> tlha' law' <jagh> tlha' puS", 'token->raw';
        is $stack[4]{args}[2], 'q<jup> gt q<jagh>', 'token->trans';
        is $stack[5]{name}, 'lesser', 'lesser';
        is $stack[5]{args}[0], "tlha'", "tlha' (lesser)";
},
sub {
        note "Comparison (ge)";
        my $step = shift;
        is $step, 12, 'step 12';
        my @stack = extract_stack($step, 2);
        is scalar(@stack), 6, '6 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token(q<jup>)';
        is $stack[0]{args}[2], 'q<jup>', 'token->trans = q<jup>';
        is $stack[1]{name}, 'pushtok', 'Push token(greater)';
        is $stack[1]{args}[0], 'greater', 'token->type = greater';
        is $stack[1]{args}[1], "<jup> nungbe' law'", 'token->raw';
        is $stack[1]{args}[2], 'q<jup> ge', 'token->trans';
        is $stack[2]{name}, 'greater', 'greater';
        is $stack[2]{args}[0], "nungbe'", "nungbe' (greater)";
        is $stack[3]{name}, 'pushtok', 'Push token(q<jagh>)';
        is $stack[3]{args}[2], 'q<jagh>', 'token->trans = q<jagh>';
        is $stack[4]{name}, 'pushtok', 'Push token(lesser)';
        is $stack[4]{args}[0], 'acc', 'token->type for lesser = acc';
        is $stack[4]{args}[1], "<jup> nungbe' law' <jagh> nungbe' puS", 'token->raw';
        is $stack[4]{args}[2], 'q<jup> ge q<jagh>', 'token->trans';
        is $stack[5]{name}, 'lesser', 'lesser';
        is $stack[5]{args}[0], "nungbe'", "nungbe' (lesser)";
},
sub {
        note "Comparison (le)";
        my $step = shift;
        is $step, 13, 'step 13';
        my @stack = extract_stack($step, 2);
        is scalar(@stack), 6, '6 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token(q<jup>)';
        is $stack[0]{args}[2], 'q<jup>', 'token->trans = q<jup>';
        is $stack[1]{name}, 'pushtok', 'Push token(greater)';
        is $stack[1]{args}[0], 'greater', 'token->type = greater';
        is $stack[1]{args}[1], "<jup> tlha'be' law'", 'token->raw';
        is $stack[1]{args}[2], 'q<jup> le', 'token->trans';
        is $stack[2]{name}, 'greater', 'greater';
        is $stack[2]{args}[0], "tlha'be'", "tlha'be' (greater)";
        is $stack[3]{name}, 'pushtok', 'Push token(q<jagh>)';
        is $stack[3]{args}[2], 'q<jagh>', 'token->trans = q<jagh>';
        is $stack[4]{name}, 'pushtok', 'Push token(lesser)';
        is $stack[4]{args}[0], 'acc', 'token->type for lesser = acc';
        is $stack[4]{args}[1], "<jup> tlha'be' law' <jagh> tlha'be' puS", 'token->raw';
        is $stack[4]{args}[2], 'q<jup> le q<jagh>', 'token->trans';
        is $stack[5]{name}, 'lesser', 'lesser';
        is $stack[5]{args}[0], "tlha'be'", "tlha'be' (lesser)";
},
];

my @module_args;
BEGIN { push @module_args, 'yIQIj' if $DEBUG; }
BEGIN { push @module_args, 'yImugh' if $TRANSLATE; }
no warnings 'void';
use Lingua::tlhInganHol::yIghun @module_args;
nabwIj!

vagh yIlIH!
vagh tIn law' cha' tIn puS!
vagh yIvan!
nabvaD 'olvo' vagh DIch yInob!
vagh yInabvetlh!

jav yIlIH!
wa'maH tIn law' wejvatlh mach puS!
jav yIvan!
nabvaD 'olvo' jav DIch yInob!
jav yInabvetlh!

Soch yIlIH!
vagh mach law' cha' mach puS!
Soch yIvan!
nabvaD 'olvo' Soch DIch yInob!
Soch yInabvetlh!

chorgh yIlIH!
vagh tInbe' law' cha' tInbe' puS!
chorgh yIvan!
nabvaD 'olvo' chorgh DIch yInob!
chorgh yInabvetlh!

Hut yIlIH!
vagh machbe' law' cha' machbe' puS!
Hut yIvan!
nabvaD 'olvo'  Hut DIch yInob!
Hut yInabvetlh!

wa'maH yIlIH! #'
<jup> nung law' <jagh> nung puS! #'
wa'maH yIvan! #'
nabvaD 'olvo' wa'maH DIch yInob! #'
wa'maH yInabvetlh! #'

wa'maH wa' yIlIH!
<jup> tlha' law' <jagh> tlha' puS! #'
wa'maH wa' yIvan!
nabvaD 'olvo' wa'maH wa' DIch yInob!
wa'maH wa' yInabvetlh!

wa'maH cha' yIlIH!
<jup> nungbe' law' <jagh> nungbe' puS! #'
wa'maH cha' yIvan!
nabvaD 'olvo' wa'maH cha' DIch yInob!
wa'maH cha' yInabvetlh!

wa'maH wej yIlIH! #'
<jup> tlha'be' law' <jagh> tlha'be' puS! #'
wa'maH wej yIvan! #'
nabvaD 'olvo' wa'maH wej DIch yInob! #'
wa'maH wej yInabvetlh! #'

yIdone_testing!
