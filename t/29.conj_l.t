#!perl -w
# vim:set et si:
#
use Test::More
        tests => 73
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
        conj_l
        done
);
}

my $Zol = [
(undef)x14,
sub {
        note "Low-priority and";
        my $step = shift;
        is $step, 14, 'step 14';
        my @stack = extract_stack($step);
        # extract_stack doesn't remove the stack entry for the "done"
        # that finished the previous command, so get rid of that here.
        shift @stack;
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token(a)';
        is $stack[0]{args}[2], 'q<a>', 'token->trans = a';
        is $stack[1]{name}, 'pushtok', 'Push token(and)';
        is $stack[1]{args}[0], 'sent_conj', 'token->type = sent_conj';
        is $stack[1]{args}[1], "'ej", 'token->raw';
        is $stack[1]{args}[2], 'and', 'token->trans = and';
        is $stack[2]{name}, 'conj_l', 'conj_l';
        is $stack[2]{args}[0], "'ej", 'conj_l()';
        is $stack[3]{name}, 'pushtok', 'Push token(b)';
        is $stack[3]{args}[2], 'q<b>', 'token->trans = b';
        is $stack[4]{name}, 'done', 'Done (and)';
        like $stack[4]{result}[0], qr/\Qq<a> and q<b>;\E\n\z/, 'cmd (and)';
},
sub {
        note "Low-priority or";
        my $step = shift;
        is $step, 15, 'step 15';
        my @stack = extract_stack($step);
        # extract_stack doesn't remove the stack entry for the "done"
        # that finished the previous command, so get rid of that here.
        shift @stack;
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token(a)';
        is $stack[0]{args}[2], 'q<a>', 'token->trans = a';
        is $stack[1]{name}, 'pushtok', 'Push token(or)';
        is $stack[1]{args}[0], 'sent_conj', 'token->type = sent_conj';
        is $stack[1]{args}[1], "qoj", 'token->raw';
        is $stack[1]{args}[2], 'or', 'token->trans = or';
        is $stack[2]{name}, 'conj_l', 'conj_l';
        is $stack[2]{args}[0], "qoj", 'conj_l()';
        is $stack[3]{name}, 'pushtok', 'Push token(b)';
        is $stack[3]{args}[2], 'q<b>', 'token->trans = b';
        is $stack[4]{name}, 'done', 'Done (or)';
        like $stack[4]{result}[0], qr/\Qq<a> or q<b>;\E\n\z/, 'cmd (or)';
},
sub {
        note "Low-priority and with multiple arguments";
        my $step = shift;
        is $step, 16, 'step 16';
        my @stack = extract_stack($step);
        # extract_stack doesn't remove the stack entry for the "done"
        # that finished the previous command, so get rid of that here.
        shift @stack;
        is scalar(@stack), 8, '8 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token(a)';
        is $stack[0]{args}[2], 'q<a>', 'token->trans = a';
        is $stack[1]{name}, 'pushtok', 'Push token(and)';
        is $stack[1]{args}[0], 'sent_conj', 'token->type = sent_conj';
        is $stack[1]{args}[1], "'ej", 'token->raw';
        is $stack[1]{args}[2], 'and', 'token->trans = and';
        is $stack[2]{name}, 'conj_l', 'conj_l';
        is $stack[2]{args}[0], "'ej", 'conj_l()';
        is $stack[3]{name}, 'pushtok', 'Push token(b)';
        is $stack[3]{args}[2], 'q<b>', 'token->trans = b';
        is $stack[4]{name}, 'pushtok', 'Push token(and)';
        is $stack[4]{args}[0], 'sent_conj', 'token->type = sent_conj';
        is $stack[4]{args}[1], "'ej", 'token->raw';
        is $stack[4]{args}[2], 'and', 'token->trans = and';
        is $stack[5]{name}, 'conj_l', 'conj_l';
        is $stack[5]{args}[0], "'ej", 'conj_l()';
        is $stack[6]{name}, 'pushtok', 'Push token(c)';
        is $stack[6]{args}[2], 'q<c>', 'token->trans = c';
        is $stack[7]{name}, 'done', 'Done (multiple and)';
        like $stack[7]{result}[0], qr/\Qq<a> and q<b> and q<c>;\E\n\z/, 'cmd (multiple and)';
},
sub {
        note "Low-priority or with multiple arguments";
        my $step = shift;
        is $step, 17, 'step 17';
        my @stack = extract_stack($step);
        # extract_stack doesn't remove the stack entry for the "done"
        # that finished the previous command, so get rid of that here.
        shift @stack;
        is scalar(@stack), 8, '8 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token(a)';
        is $stack[0]{args}[2], 'q<a>', 'token->trans = a';
        is $stack[1]{name}, 'pushtok', 'Push token(or)';
        is $stack[1]{args}[0], 'sent_conj', 'token->type = sent_conj';
        is $stack[1]{args}[1], "qoj", 'token->raw';
        is $stack[1]{args}[2], 'or', 'token->trans = or';
        is $stack[2]{name}, 'conj_l', 'conj_l';
        is $stack[2]{args}[0], "qoj", 'conj_l()';
        is $stack[3]{name}, 'pushtok', 'Push token(b)';
        is $stack[3]{args}[2], 'q<b>', 'token->trans = b';
        is $stack[4]{name}, 'pushtok', 'Push token(or)';
        is $stack[4]{args}[0], 'sent_conj', 'token->type = sent_conj';
        is $stack[4]{args}[1], "qoj", 'token->raw';
        is $stack[4]{args}[2], 'or', 'token->trans = or';
        is $stack[5]{name}, 'conj_l', 'conj_l';
        is $stack[5]{args}[0], "qoj", 'conj_l()';
        is $stack[6]{name}, 'pushtok', 'Push token(c)';
        is $stack[6]{args}[2], 'q<c>', 'token->trans = c';
        is $stack[7]{name}, 'done', 'Done (multiple or)';
        like $stack[7]{result}[0], qr/\Qq<a> or q<b> or q<c>;\E\n\z/, 'cmd (multiple or)';
},
];

my @module_args;
BEGIN { push @module_args, 'yIQIj' if $DEBUG; }
BEGIN { push @module_args, 'yImugh' if $TRANSLATE; }
no warnings 'void';
use Lingua::tlhInganHol::yIghun @module_args;
nabwIj!

wa'maH loS yIlIH! #'
<a> 'ej <b>! #'
wa'maH loS yIvan! #'
nabvaD 'olvo' wa'maH loS DIch yInob! #'
wa'maH loS yInabvetlh! #'

wa'maH vagh yIlIH! #'
<a> qoj <b>!
wa'maH vagh yIvan! #'
nabvaD 'olvo' wa'maH vagh DIch yInob! #'
wa'maH vagh yInabvetlh! #'

wa'maH jav yIlIH! #'
<a> 'ej <b> 'ej <c>!
wa'maH jav yIvan! #'
nabvaD 'olvo' wa'maH jav DIch yInob! #'
wa'maH jav yInabvetlh! #'

wa'maH Soch yIlIH! #'
<a> qoj <b> qoj <c>!
wa'maH Soch yIvan! #'
nabvaD 'olvo' wa'maH Soch DIch yInob! #'
wa'maH Soch yInabvetlh! #'

yIdone_testing!
