#!perl -w
# vim:set et si:
#
use Test::More
        tests => 112
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
        to_sub_decl
        sub_decl
);
}

my $Zol = [
(undef)x19,
sub {
        note "sub declaration (just block)";
        my $step = shift;
        is $step, 19, 'step 19';
        my @stack = extract_stack($step);
        is scalar(@stack), 6, '6 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token startblock';
        is $stack[0]{args}[0], 'start of block', 'token->type';
        is $stack[0]{args}[1], '{', 'token->raw';
        is $stack[0]{args}[2], '{', 'token->trans';
        is $stack[1]{name}, 'pushtok', 'Push token endblock';
        is $stack[1]{args}[0], 'block', 'token->type';
        is $stack[1]{args}[1], '{...}', 'token->raw';
        is $stack[1]{args}[2], '{}', 'token->trans';
        is $stack[2]{name}, 'to_sub_decl';
        is $stack[2]{args}[0]{type}, 'block', 'block->type';
        is $stack[2]{args}[0]{trans}, '{}', 'block->trans';
        is $stack[2]{args}[1]{type}, '', 'block->type';
        is $stack[2]{args}[1]{trans}, '', 'name->trans';
        is $stack[2]{args}[2]{type}, 'verb', 'block->type';
        is $stack[2]{args}[2]{trans}, 'sub', 'cmd->trans';
        is $stack[2]{result}[0], 'sub {}', 'to_sub_decl()';
        is $stack[3]{name}, 'translate';
        is $stack[3]{args}[0]{type}, 'block', 'block->type';
        is $stack[3]{args}[0]{trans}, '{}', 'block->trans';
        is $stack[3]{args}[1]{type}, '', 'block->type';
        is $stack[3]{args}[1]{trans}, '', 'name->trans';
        is $stack[3]{args}[2]{type}, 'verb', 'block->type';
        is $stack[3]{args}[2]{trans}, 'sub', 'cmd->trans';
        like $stack[3]{result}[0], qr/^\s*\{\.\.\.\}\s+nab\s*$/, 'translate()->raw';
        like $stack[3]{result}[1], qr/^\s*sub\s+\{\}\s*$/, 'translate()->trans';
        is $stack[4]{name}, 'pushtok';
        is $stack[4]{args}[0], 'acc', 'token->type';
        like $stack[4]{args}[1], qr/^\s*\{\.\.\.\}\s+nab\s*$/, 'token->raw';
        like $stack[4]{args}[2], qr/^\s*sub\s+\{\}\s*$/, 'token->trans';
        is $stack[5]{name}, 'sub_decl';
        is $stack[5]{args}[0], 'nab';
        is ref $stack[5]{result}[0], 'HASH', 'sub_decl()';
        is $stack[5]{result}[0]{type}, 'acc', 'token->type';
        like $stack[5]{result}[0]{raw}, qr/^\s*\{\.\.\.\}\s+nab\s*$/, 'token->raw';
        like $stack[5]{result}[0]{trans}, qr/^\s*sub\s+\{\}\s*$/, 'token->trans';
},
sub {
        note "sub declaration (just name)";
        my $step = shift;
        is $step, 20, 'step 20';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push subname token';
        is $stack[0]{args}[0], 'acc', 'token->type';
        is $stack[0]{args}[1], 'exampletwenty', 'token->raw';
        is $stack[0]{args}[2], '$exampletwenty', 'token->trans';
        is $stack[1]{name}, 'to_sub_decl';
        is $stack[1]{args}[0]{type}, '', 'block->type';
        is $stack[1]{args}[0]{trans}, '', 'block->trans';
        is $stack[1]{args}[1]{type}, 'acc', 'block->type';
        is $stack[1]{args}[1]{trans}, 'exampletwenty', 'name->trans';
        is $stack[1]{args}[2]{type}, 'verb', 'block->type';
        is $stack[1]{args}[2]{trans}, 'sub', 'cmd->trans';
        is $stack[1]{result}[0], 'sub exampletwenty', 'to_sub_decl';
        is $stack[2]{name}, 'translate';
        is $stack[2]{args}[0]{type}, '', 'block->type';
        is $stack[2]{args}[0]{trans}, '', 'block->trans';
        is $stack[2]{args}[1]{type}, 'acc', 'block->type';
        is $stack[2]{args}[1]{trans}, 'exampletwenty', 'name->trans';
        is $stack[2]{args}[2]{type}, 'verb', 'block->type';
        is $stack[2]{args}[2]{trans}, 'sub', 'cmd->trans';
        like $stack[2]{result}[0], qr/^\s*exampletwenty\s+nab\s*$/, 'translate()->raw';
        like $stack[2]{result}[1], qr/^\s*sub\s+exampletwenty\s*$/, 'translate()->trans';
        is $stack[3]{name}, 'pushtok';
        is $stack[3]{args}[0], 'cmd', 'token->type';
        like $stack[3]{args}[1], qr/^\s*exampletwenty\s+nab\s*$/, 'token->trans';
        like $stack[3]{args}[2], qr/^\s*sub\s+exampletwenty\s*$/, 'token->raw';
        is $stack[4]{name}, 'sub_decl';
        is $stack[4]{args}[0], 'nab';
        is ref $stack[4]{result}[0], 'HASH', 'sub_decl()';
        is $stack[4]{result}[0]{type}, 'cmd', 'token->type';
        like $stack[4]{result}[0]{raw}, qr/^\s*exampletwenty\s+nab\s*$/, 'token->raw';
        like $stack[4]{result}[0]{trans}, qr/^\s*sub\s+exampletwenty\s*$/, 'token->trans';
},
sub {
        note "sub declaration (name and block)";
        my $step = shift;
        is $step, 21, 'step 21';
        my @stack = extract_stack($step);
        is scalar(@stack), 7, '7 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token startblock';
        is $stack[0]{args}[0], 'start of block', 'token->type';
        is $stack[0]{args}[1], '{', 'token->raw';
        is $stack[0]{args}[2], '{', 'token->trans';
        is $stack[1]{name}, 'pushtok', 'Push token endblock';
        is $stack[1]{args}[0], 'block', 'token->type';
        is $stack[1]{args}[1], '{...}', 'token->raw';
        is $stack[1]{args}[2], '{}', 'token->trans';
        is $stack[2]{name}, 'pushtok', 'Push subname token';
        is $stack[2]{args}[0], 'acc', 'token->type';
        is $stack[2]{args}[1], 'exampletwentyone', 'token->raw';
        is $stack[2]{args}[2], '$exampletwentyone', 'token->trans';
        is $stack[3]{name}, 'to_sub_decl';
        is $stack[3]{args}[0]{type}, 'block', 'block->type';
        is $stack[3]{args}[0]{trans}, '{}', 'block->trans';
        is $stack[3]{args}[1]{type}, 'acc', 'block->type';
        is $stack[3]{args}[1]{trans}, 'exampletwentyone', 'name->trans';
        is $stack[3]{args}[2]{type}, 'verb', 'block->type';
        is $stack[3]{args}[2]{trans}, 'sub', 'cmd->trans';
        is $stack[3]{result}[0], 'sub exampletwentyone {}', 'to_sub_decl()';
        is $stack[4]{name}, 'translate';
        is $stack[4]{args}[0]{type}, 'block', 'block->type';
        is $stack[4]{args}[0]{trans}, '{}', 'block->trans';
        is $stack[4]{args}[1]{type}, 'acc', 'block->type';
        is $stack[4]{args}[1]{trans}, 'exampletwentyone', 'name->trans';
        is $stack[4]{args}[2]{type}, 'verb', 'block->type';
        is $stack[4]{args}[2]{trans}, 'sub', 'cmd->trans';
        like $stack[4]{result}[0], qr/^\s*\{\.\.\.\}\s+exampletwentyone\s+nab\s*$/, 'translate()->raw';
        like $stack[4]{result}[1], qr/^\s*sub\s+exampletwentyone\s+\{\}\s*$/, 'translate()->trans';
        is $stack[5]{name}, 'pushtok';
        is $stack[5]{args}[0], 'cmd';
        like $stack[5]{args}[1], qr/^\s*\{\.\.\.\}\s+exampletwentyone\s+nab\s*$/, 'translate()->raw';
        like $stack[5]{args}[2], qr/^\s*sub\s+exampletwentyone\s+\{\}\s*$/, 'translate()->trans';
        is $stack[6]{name}, 'sub_decl';
        is $stack[6]{args}[0], 'nab';
        is ref $stack[6]{result}[0], 'HASH', 'sub_decl()';
        is $stack[6]{result}[0]{type}, 'cmd', 'token->type';
        like $stack[6]{result}[0]{raw}, qr/^\s*\{\.\.\.\}\s+exampletwentyone\s+nab\s*$/, 'token->raw';
        like $stack[6]{result}[0]{trans}, qr/^\s*sub\s+exampletwentyone\s+\{\}\s*$/, 'token->trans';
},
];

my @module_args;
BEGIN { push @module_args, 'yIQIj' if $DEBUG; }
BEGIN { push @module_args, 'yImugh' if $TRANSLATE; }
no warnings 'void';
use Lingua::tlhInganHol::yIghun @module_args;
nabwIj!

wa'maH Hut yIlIH! #'
{ } nab!
wa'maH Hut yIvan! #'
nabvaD 'olvo' wa'maH Hut DIch yInob! #'
wa'maH Hut yInabvetlh! #'

cha'maH yIlIH! #'
exampletwenty nab!
cha'maH yIvan! #'
nabvaD 'olvo' cha'maH DIch yInob! #'
cha'maH yInabvetlh! #'

cha'maH wa' yIlIH!
{ } exampletwentyone nab!
cha'maH wa' yIvan!
nabvaD 'olvo' cha'maH wa' DIch yInob!
cha'maH wa' yInabvetlh!

yIdone_testing!
