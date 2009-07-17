#!perl -w
# vim:set et si:
#
use Test::More
        # tests => 858
;
use Carp;
use Data::Dumper;
use strict;
my $DEBUG;
my $TRANSLATE;

BEGIN { $DEBUG = 0; }
BEGIN { $TRANSLATE = 0; }

BEGIN { require_ok 'Lingua::tlhInganHol::yIghun' }

my @callstack;
my $vars;
BEGIN { $vars = {} }

# dummy subroutines to find our place in the call stack
sub lIH { }
sub van { }

# Wrap a called subroutine in a way that will record the call stack.
sub wrap {
        my $subname = shift;
        my $fullname = 'Lingua::tlhInganHol::yIghun::' . $subname;
        if (!defined(&$fullname)) {
                croak "Can't wrap non-existent function $subname";
        }
        no strict "refs";
        my $original_function = *{$fullname}{CODE};

        no warnings 'redefine';
        *{$fullname} = sub {
                local $Data::Dumper::Terse = 1;
                local $Data::Dumper::Indent = 0;
                # local $Data::Dumper::Useqq = 1;
                my $origname = $subname;
                warn ">>> $origname [$#callstack] " . Dumper([ @_ ]) if $DEBUG;
                my $entry = {name => $origname, args => [ @_ ]};
                my $result;
                $result = (wantarray ? [ $original_function->(@_) ] : $original_function->(@_));
                $entry->{result} = [ wantarray ? @$result : $result ];
                push @callstack, $entry;
                warn "<<< $origname [$#callstack] => " . Dumper($result) if $DEBUG;
                # warn Dumper [ \@callstack ] if $DEBUG;
                return (wantarray ? @$result : $result);
        }
}

BEGIN {
wrap $_ for qw(
        to_Terran
        from_Terran
        pushtok
        greater
        lesser
        translate
        decl
        to_decl
        to_sub_decl
        sub_decl
        to_usage
        usage
        to_listop
        listop
        to_blockop
        blockop
        to_match
        match
        to_change
        change
        to_arg0
        to_arg1
        to_arg1_da
        arg0
        arg1
        arg1_da
);

=for comment
        tok
        nostop
        print_honourably
        readline_honourably
        top
        to_go
        to_arg2
        to_arg2_da
        to_arg2_a
        to_args
        to_args_u
        to_args_ur
        to_args_da
        to_unop
        to_unop_dpre
        to_unop_dpost
        to_binop
        to_binop_d
        to_ternop
        to_control
        go
        arg2
        arg2_da
        arg2_a
        unop
        unop_dpre
        unop_dpost
        binop
        binop_d
        ternop
        args_da
        args
        args_u
        args_ur
        control
        object
        done
        startblock
        endblock
        startlist
        endlist
        conj_l

=cut

}

my %end_index;

sub extract_stack($) {
        my $step = shift;
        # Find the portion of the callstack that's actually part of this step
        my @stack = @callstack;
        my($start_index, $end_index) = (-1, -1);
        my $i;
        for ($i = $end_index{($step - 1)} || 0; $i <= $#stack; $i++) {
                my $entry = $stack[$i];
                $start_index = $i
                        if $entry->{name} eq 'pushtok'
                        && $entry->{args}->[2] =~ /^lIH\($step\)$/;
                $end_index{$step} = $end_index = $i
                        if $entry->{name} eq 'pushtok'
                        && $entry->{args}->[2] =~ /^van\($step\)$/;
        }
        carp "Can't find start index for step $step!" unless $start_index >= 0;
        carp "Can't find end index for step $step!" unless $end_index >= 0;
        @stack = @stack[$start_index+1 .. $end_index-4];
        warn "Step $step: using stack " . Dumper(\@stack) if $DEBUG;
        return @stack;
}

my $Zol = [sub {
        note "Simple number";
        my $step = shift;
        is $step, 0, 'step 0';
        my @stack = extract_stack($step);
        is scalar(@stack), 2, '2 entries on callstack';
        is $stack[0]{name}, 'to_Terran', 'translate number first';
        is scalar(@{$stack[0]{args}}), 1, 'to_Terran($)';
        is $stack[0]{args}[0], "loSvatlh wa'maH cha'", 'to_Terran(arg)';
        is scalar(@{$stack[0]{result}}), 1, '$ = to_Terran';
        is $stack[0]{result}[0], '412', 'to_Terran = 412';
        is $stack[1]{name}, 'pushtok', 'Push token';
        is $stack[1]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[1]{args}[1], "loSvatlh wa'maH cha'", 'token->raw';
        is $stack[1]{args}[2], '412', 'token->trans = 412';
},
sub {
        note "Double-quoted string (1)";
        my $step = shift;
        is $step, 1, 'step 1';
        my @stack = extract_stack($step);
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
        my @stack = extract_stack($step);
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
        my @stack = extract_stack($step);
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
        my @stack = extract_stack($step);
        is scalar(@stack), 1, '1 entry on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token';
        is $stack[0]{args}[0], 'acc', 'token->type = "acc"';
        is $stack[0]{args}[1], '< tab\\tnewline\\nalarm\\a>', 'token->raw';
        my $result = eval $stack[0]{args}[2];
        is $@, '', 'no error evaluating token->trans';
        is $result, ' tab\\tnewline\\nalarm\\a', 'token->trans';
},
sub {
        note "Comparison (>)";
        my $step = shift;
        is $step, 5, 'step 5';
        my @stack = extract_stack($step);
        is scalar(@stack), 8, '8 entries on callstack';
        is $stack[1]{name}, 'pushtok', 'Push token(5)';
        is $stack[1]{args}[2], '5', 'token->trans = 5';
        is $stack[2]{name}, 'pushtok', 'Push token(greater)';
        is $stack[2]{args}[0], 'greater', 'token->type = greater';
        is $stack[2]{args}[1], "vagh tIn law'", 'token->raw';
        is $stack[2]{args}[2], '5 >', 'token->trans';
        is $stack[3]{name}, 'greater', 'greater';
        is $stack[3]{args}[0], 'tIn', 'tIn (greater)';
        is $stack[5]{name}, 'pushtok', 'Push token(2)';
        is $stack[5]{args}[2], '2', 'token->trans = 2';
        is $stack[6]{name}, 'pushtok', 'Push token(lesser)';
        is $stack[6]{args}[0], 'acc', 'token->type for lesser = acc';
        is $stack[6]{args}[1], "vagh tIn law' cha' tIn puS", 'token->raw';
        is $stack[6]{args}[2], '5 > 2', 'token->trans';
        is $stack[7]{name}, 'lesser', 'lesser';
        is $stack[7]{args}[0], 'tIn', 'tIn (lesser)';
},
sub {
        note "Comparison (><)";
        my $step = shift;
        is $step, 6, 'step 6';
        my @stack = extract_stack($step);
        is scalar(@stack), 8, '8 entries on callstack';
        is $stack[1]{name}, 'pushtok', 'Push token(10)';
        is $stack[1]{args}[2], '10', 'token->trans = 10';
        is $stack[2]{name}, 'pushtok', 'Push token(greater)';
        is $stack[2]{args}[0], 'greater', 'token->type = greater';
        is $stack[2]{args}[1], "wa'maH tIn law'", 'token->raw';
        is $stack[2]{args}[2], '10 >', 'token->trans';
        is $stack[3]{name}, 'greater', 'greater';
        is $stack[3]{args}[0], 'tIn', 'tIn (greater)';
        is $stack[5]{name}, 'pushtok', 'Push token(300)';
        is $stack[5]{args}[2], '300', 'token->trans = 300';
        is $stack[6]{name}, 'pushtok', 'Push token(lesser)';
        is $stack[6]{args}[0], 'acc', 'token->type for lesser = acc';
        is $stack[6]{args}[1], "wa'maH tIn law' wejvatlh mach puS", 'token->raw';
        is $stack[6]{args}[2], '10 > 300', 'token->trans';
        is $stack[7]{name}, 'lesser', 'lesser';
        is $stack[7]{args}[0], 'mach', 'mach (lesser)';
        # TODO: If the two operators are not the same, this should
        # probably be checked and raise an exception.
        # Currently, we don't even notice this.
},
sub {
        note "Comparison (<)";
        my $step = shift;
        is $step, 7, 'step 7';
        my @stack = extract_stack($step);
        is scalar(@stack), 8, '8 entries on callstack';
        is $stack[1]{name}, 'pushtok', 'Push token(5)';
        is $stack[1]{args}[2], '5', 'token->trans = 5';
        is $stack[2]{name}, 'pushtok', 'Push token(greater)';
        is $stack[2]{args}[0], 'greater', 'token->type = greater';
        is $stack[2]{args}[1], "vagh mach law'", 'token->raw';
        is $stack[2]{args}[2], '5 <', 'token->trans';
        is $stack[3]{name}, 'greater', 'greater';
        is $stack[3]{args}[0], 'mach', 'mach (greater)';
        is $stack[5]{name}, 'pushtok', 'Push token(2)';
        is $stack[5]{args}[2], '2', 'token->trans = 2';
        is $stack[6]{name}, 'pushtok', 'Push token(lesser)';
        is $stack[6]{args}[0], 'acc', 'token->type for lesser = acc';
        is $stack[6]{args}[1], "vagh mach law' cha' mach puS", 'token->raw';
        is $stack[6]{args}[2], '5 < 2', 'token->trans';
        is $stack[7]{name}, 'lesser', 'lesser';
        is $stack[7]{args}[0], 'mach', 'mach (lesser)';
},
sub {
        note "Comparison (<=)";
        my $step = shift;
        is $step, 8, 'step 8';
        my @stack = extract_stack($step);
        is scalar(@stack), 8, '8 entries on callstack';
        is $stack[1]{name}, 'pushtok', 'Push token(5)';
        is $stack[1]{args}[2], '5', 'token->trans = 5';
        is $stack[2]{name}, 'pushtok', 'Push token(greater)';
        is $stack[2]{args}[0], 'greater', 'token->type = greater';
        is $stack[2]{args}[1], "vagh tInbe' law'", 'token->raw';
        is $stack[2]{args}[2], '5 <=', 'token->trans';
        is $stack[3]{name}, 'greater', 'greater';
        is $stack[3]{args}[0], "tInbe'", "tInbe' (greater)";
        is $stack[5]{name}, 'pushtok', 'Push token(2)';
        is $stack[5]{args}[2], '2', 'token->trans = 2';
        is $stack[6]{name}, 'pushtok', 'Push token(lesser)';
        is $stack[6]{args}[0], 'acc', 'token->type for lesser = acc';
        is $stack[6]{args}[1], "vagh tInbe' law' cha' tInbe' puS", 'token->raw';
        is $stack[6]{args}[2], '5 <= 2', 'token->trans';
        is $stack[7]{name}, 'lesser', 'lesser';
        is $stack[7]{args}[0], "tInbe'", "tInbe' (lesser)";
},
sub {
        note "Comparison (>=)";
        my $step = shift;
        is $step, 9, 'step 9';
        my @stack = extract_stack($step);
        is scalar(@stack), 8, '8 entries on callstack';
        is $stack[1]{name}, 'pushtok', 'Push token(5)';
        is $stack[1]{args}[2], '5', 'token->trans = 5';
        is $stack[2]{name}, 'pushtok', 'Push token(greater)';
        is $stack[2]{args}[0], 'greater', 'token->type = greater';
        is $stack[2]{args}[1], "vagh machbe' law'", 'token->raw';
        is $stack[2]{args}[2], '5 >=', 'token->trans';
        is $stack[3]{name}, 'greater', 'greater';
        is $stack[3]{args}[0], "machbe'", "machbe' (greater)";
        is $stack[5]{name}, 'pushtok', 'Push token(2)';
        is $stack[5]{args}[2], '2', 'token->trans = 2';
        is $stack[6]{name}, 'pushtok', 'Push token(lesser)';
        is $stack[6]{args}[0], 'acc', 'token->type for lesser = acc';
        is $stack[6]{args}[1], "vagh machbe' law' cha' machbe' puS", 'token->raw';
        is $stack[6]{args}[2], '5 >= 2', 'token->trans';
        is $stack[7]{name}, 'lesser', 'lesser';
        is $stack[7]{args}[0], "machbe'", "machbe' (lesser)";
},
sub {
        note "Comparison (lt)";
        my $step = shift;
        is $step, 10, 'step 10';
        my @stack = extract_stack($step);
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
        my @stack = extract_stack($step);
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
        my @stack = extract_stack($step);
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
        my @stack = extract_stack($step);
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
sub {
        # TODO: actually test the generated code
        # For this, we'd have to mock "done", I suppose,
        # since the code is not actually pieced together anywhere else.
        # But this would lead to lots more "useless" stack entries.
        note "Low-priority and";
        my $step = shift;
        is $step, 14, 'step 14';
        my @stack = extract_stack($step);
        is scalar(@stack), 3, '3 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token(a)';
        is $stack[0]{args}[2], 'q<a>', 'token->trans = a';
        is $stack[1]{name}, 'pushtok', 'Push token(and)';
        is $stack[1]{args}[0], 'sent_conj', 'token->type = sent_conj';
        is $stack[1]{args}[1], "'ej", 'token->raw';
        is $stack[1]{args}[2], 'and', 'token->trans = and';
        is $stack[2]{name}, 'pushtok', 'Push token(b)';
        is $stack[2]{args}[2], 'q<b>', 'token->trans = b';
},
sub {
        note "Low-priority or";
        my $step = shift;
        is $step, 15, 'step 15';
        my @stack = extract_stack($step);
        is scalar(@stack), 3, '3 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token(a)';
        is $stack[0]{args}[2], 'q<a>', 'token->trans = a';
        is $stack[1]{name}, 'pushtok', 'Push token(or)';
        is $stack[1]{args}[0], 'sent_conj', 'token->type = sent_conj';
        is $stack[1]{args}[1], "qoj", 'token->raw';
        is $stack[1]{args}[2], 'or', 'token->trans = or';
        is $stack[2]{name}, 'pushtok', 'Push token(b)';
        is $stack[2]{args}[2], 'q<b>', 'token->trans = b';
},
sub {
        note "Low-priority and with multiple arguments";
        my $step = shift;
        is $step, 16, 'step 16';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token(a)';
        is $stack[0]{args}[2], 'q<a>', 'token->trans = a';
        is $stack[1]{name}, 'pushtok', 'Push token(and)';
        is $stack[1]{args}[0], 'sent_conj', 'token->type = sent_conj';
        is $stack[1]{args}[1], "'ej", 'token->raw';
        is $stack[1]{args}[2], 'and', 'token->trans = and';
        is $stack[2]{name}, 'pushtok', 'Push token(b)';
        is $stack[2]{args}[2], 'q<b>', 'token->trans = b';
        is $stack[3]{name}, 'pushtok', 'Push token(and)';
        is $stack[3]{args}[0], 'sent_conj', 'token->type = sent_conj';
        is $stack[3]{args}[1], "'ej", 'token->raw';
        is $stack[3]{args}[2], 'and', 'token->trans = and';
        is $stack[4]{name}, 'pushtok', 'Push token(c)';
        is $stack[4]{args}[2], 'q<c>', 'token->trans = c';
},
sub {
        note "Low-priority or with multiple arguments";
        my $step = shift;
        is $step, 17, 'step 17';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token(a)';
        is $stack[0]{args}[2], 'q<a>', 'token->trans = a';
        is $stack[1]{name}, 'pushtok', 'Push token(or)';
        is $stack[1]{args}[0], 'sent_conj', 'token->type = sent_conj';
        is $stack[1]{args}[1], "qoj", 'token->raw';
        is $stack[1]{args}[2], 'or', 'token->trans = or';
        is $stack[2]{name}, 'pushtok', 'Push token(b)';
        is $stack[2]{args}[2], 'q<b>', 'token->trans = b';
        is $stack[3]{name}, 'pushtok', 'Push token(or)';
        is $stack[3]{args}[0], 'sent_conj', 'token->type = sent_conj';
        is $stack[3]{args}[1], "qoj", 'token->raw';
        is $stack[3]{args}[2], 'or', 'token->trans = or';
        is $stack[4]{name}, 'pushtok', 'Push token(c)';
        is $stack[4]{args}[2], 'q<c>', 'token->trans = c';
},
sub {
        note "decl (packages)";
        my $step = shift;
        is $step, 18, 'step 18';
        my @stack = extract_stack($step);
        is scalar(@stack), 2*5, '10 entries on callstack';
        is $stack[0]{name}, 'pushtok', "Push token(wo''a')";
        is $stack[0]{args}[0], 'acc', 'token->type = acc';
        is $stack[0]{args}[1], "wo''a'", 'token->raw';
        is $stack[0]{args}[2], '$woZZaZ', 'token->trans = $woZZaZ';
        # is $stack[0]{name}, 'decl -> translate -> to_decl -> pushtok';
        is $stack[1]{name}, 'to_decl', 'to_decl';
        is $stack[1]{args}[0]{raw}, "wo''a'", 'to_decl[0]->raw';
        is $stack[1]{args}[0]{trans}, 'woZZaZ', 'to_decl[0]->trans';
        is $stack[1]{args}[1]{raw}, 'yoS', 'to_decl[1]->raw';
        is $stack[1]{args}[1]{trans}, 'package', 'to_decl[1]->trans';
        is $stack[1]{result}[0], 'package woZZaZ';
        is $stack[2]{name}, 'translate', 'Translate';
        is ref $stack[2]{args}[0], 'HASH', 'translate[0] = HASH';
        is $stack[2]{args}[0]{type}, 'acc', 'translate[0]->type';
        is $stack[2]{args}[0]{raw}, "wo''a'", 'translate[0]->raw';
        is $stack[2]{args}[0]{trans}, 'woZZaZ', 'translate[0]->trans';
        is ref $stack[2]{args}[1], 'HASH', 'translate[1] = HASH';
        is $stack[2]{args}[1]{type}, 'adj', 'translate[1]->type';
        is $stack[2]{args}[1]{raw}, 'yoS', 'translate[1]->raw';
        is $stack[2]{args}[1]{trans}, 'package', 'translate[1]->trans';
        is $stack[2]{result}[0], "wo''a' yoS", 'translate()->raw';
        is $stack[2]{result}[1], 'package woZZaZ', 'translate()->trans';
        is $stack[3]{name}, 'pushtok', 'Push token(command)';
        is $stack[3]{args}[0], 'cmd', 'token->type = cmd';
        is $stack[3]{args}[1], "wo''a' yoS", 'token->raw';
        is $stack[3]{args}[2], 'package woZZaZ', 'token->trans = package woZZaZ';
        is $stack[4]{name}, 'decl', 'decl';
        is $stack[4]{args}[0], 'yoS', 'decl(yoS)';
        is $stack[5+2]{name}, 'translate', 'Translate (2)';
        is $stack[5+2]{result}[1], 'package main', 'translate()->trans';
},
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
sub {
        note "listop 1: sort";
        my $step = shift;
        is $step, 26, 'step 26';
        my @stack = extract_stack($step);
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
        my @stack = extract_stack($step);
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
        my @stack = extract_stack($step);
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
sub {
        note "blockop 1: eval BLOCK";
        my $step = shift;
        is $step, 29, 'step 29';
        my @stack = extract_stack($step);
        is scalar(@stack), 8, '8 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token {';
        is $stack[0]{result}[0]{trans}, '{';
        is $stack[1]{name}, 'to_Terran';
        is $stack[1]{result}[0], '0';
        is $stack[2]{name}, 'pushtok', 'Push token 0 (in eval block)';
        is $stack[2]{result}[0]{trans}, '0';
        is $stack[3]{name}, 'pushtok', 'Push token }';
        is $stack[3]{result}[0]{raw}, '{...}';
        is $stack[3]{result}[0]{trans}, "{0;\n}";
        is $stack[4]{name}, 'to_blockop', 'to_blockop';
        is scalar(@{$stack[4]{args}}), 2, '2 args for to_blockop';
        is $stack[4]{args}[0]{type}, 'block';
        is $stack[4]{result}[0], "eval {0;\n}", 'to_blockop()';
        is $stack[5]{name}, 'translate', 'translate';
        is $stack[5]{result}[0], "{...} chov", 'translate->raw';
        is $stack[5]{result}[1], "eval {0;\n}", 'translate->trans';
        is $stack[6]{name}, 'pushtok', 'Push token acc';
        is $stack[6]{result}[0]{type}, 'acc', 'token->type';
        is $stack[6]{result}[0]{raw}, "{...} chov", 'token->raw';
        is $stack[6]{result}[0]{trans}, "eval {0;\n}", 'token->trans';
        is $stack[7]{name}, 'blockop', 'blockop';
        is $stack[7]{result}[0]{type}, 'acc', 'token->type';
        is $stack[7]{result}[0]{raw}, "{...} chov", 'token->raw';
        is $stack[7]{result}[0]{trans}, "eval {0;\n}", 'token->trans';
},
sub {
        note "blockop 2: eval SCALAR";
        my $step = shift;
        is $step, 30, 'step 30';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token <0>';
        is $stack[0]{result}[0]{trans}, 'q<0>';
        is $stack[1]{name}, 'to_blockop', 'to_blockop';
        is scalar(@{$stack[1]{args}}), 2, '2 args for to_blockop';
        is $stack[1]{args}[0]{type}, 'acc';
        is $stack[1]{result}[0], "eval q<0>", 'to_blockop()';
        is $stack[2]{name}, 'translate', 'translate';
        is $stack[2]{result}[0], "<0> chov", 'translate->raw';
        is $stack[2]{result}[1], "eval q<0>", 'translate->trans';
        is $stack[3]{name}, 'pushtok', 'Push token acc';
        is $stack[3]{result}[0]{type}, 'acc', 'token->type';
        is $stack[3]{result}[0]{raw}, "<0> chov", 'token->raw';
        is $stack[3]{result}[0]{trans}, "eval q<0>", 'token->trans';
        is $stack[4]{name}, 'blockop', 'blockop';
        is $stack[4]{result}[0]{type}, 'acc', 'token->type';
        is $stack[4]{result}[0]{raw}, "<0> chov", 'token->raw';
        is $stack[4]{result}[0]{trans}, "eval q<0>", 'token->trans';
},
sub {
        note "blockop 3: do BLOCK";
        my $step = shift;
        is $step, 31, 'step 31';
        my @stack = extract_stack($step);
        is scalar(@stack), 8, '8 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token {';
        is $stack[0]{result}[0]{trans}, '{';
        is $stack[1]{name}, 'to_Terran';
        is $stack[1]{result}[0], '0';
        is $stack[2]{name}, 'pushtok', 'Push token 0 (in do block)';
        is $stack[2]{result}[0]{trans}, '0';
        is $stack[3]{name}, 'pushtok', 'Push token }';
        is $stack[3]{result}[0]{raw}, '{...}';
        is $stack[3]{result}[0]{trans}, "{0;\n}";
        is $stack[4]{name}, 'to_blockop', 'to_blockop';
        is scalar(@{$stack[4]{args}}), 2, '2 args for to_blockop';
        is $stack[4]{args}[0]{type}, 'block';
        is $stack[4]{result}[0], "do {0;\n}", 'to_blockop()';
        is $stack[5]{name}, 'translate', 'translate';
        is $stack[5]{result}[0], "{...} vang", 'translate->raw';
        is $stack[5]{result}[1], "do {0;\n}", 'translate->trans';
        is $stack[6]{name}, 'pushtok', 'Push token acc';
        is $stack[6]{result}[0]{type}, 'acc', 'token->type';
        is $stack[6]{result}[0]{raw}, "{...} vang", 'token->raw';
        is $stack[6]{result}[0]{trans}, "do {0;\n}", 'token->trans';
        is $stack[7]{name}, 'blockop', 'blockop';
        is $stack[7]{result}[0]{type}, 'acc', 'token->type';
        is $stack[7]{result}[0]{raw}, "{...} vang", 'token->raw';
        is $stack[7]{result}[0]{trans}, "do {0;\n}", 'token->trans';
},
sub {
        note "blockop 4: do SCALAR";
        my $step = shift;
        is $step, 32, 'step 32';
        my @stack = extract_stack($step);
        is scalar(@stack), 5, '5 entries on callstack';
        is $stack[0]{name}, 'pushtok', 'Push token <0>';
        is $stack[0]{result}[0]{trans}, 'q<0>';
        is $stack[1]{name}, 'to_blockop', 'to_blockop';
        is scalar(@{$stack[1]{args}}), 2, '2 args for to_blockop';
        is $stack[1]{args}[0]{type}, 'acc';
        is $stack[1]{result}[0], "do q<0>", 'to_blockop()';
        is $stack[2]{name}, 'translate', 'translate';
        is $stack[2]{result}[0], "<0> vang", 'translate->raw';
        is $stack[2]{result}[1], "do q<0>", 'translate->trans';
        is $stack[3]{name}, 'pushtok', 'Push token acc';
        is $stack[3]{result}[0]{type}, 'acc', 'token->type';
        is $stack[3]{result}[0]{raw}, "<0> vang", 'token->raw';
        is $stack[3]{result}[0]{trans}, "do q<0>", 'token->trans';
        is $stack[4]{name}, 'blockop', 'blockop';
        is $stack[4]{result}[0]{type}, 'acc', 'token->type';
        is $stack[4]{result}[0]{raw}, "<0> vang", 'token->raw';
        is $stack[4]{result}[0]{trans}, "do q<0>", 'token->trans';
},
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
sub {
        note 'time';
        my $step = shift;
        is $step, 39, 'step 39';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg0', 'to_arg0';
        is $stack[0]{result}[0], 'time', 'to_arg0() -> time';
        is $stack[1]{name}, 'translate', 'translate';
        is $stack[1]{result}[0], 'poH', 'translate->raw';
        is $stack[1]{result}[1], 'time', 'translate->trans';
        is $stack[2]{name}, 'pushtok', 'Push token acc';
        is $stack[2]{result}[0]{type}, 'acc', 'token->type';
        is $stack[2]{result}[0]{raw}, 'poH', 'token->raw';
        is $stack[2]{result}[0]{trans}, 'time', 'token->trans';
        is $stack[3]{name}, 'arg0', 'arg0';
        is $stack[3]{result}[0]{type}, 'acc', 'token->type';
        is $stack[3]{result}[0]{raw}, 'poH', 'token->raw';
        is $stack[3]{result}[0]{trans}, 'time', 'token->trans';
},
sub {
        note 'wantarray';
        my $step = shift;
        is $step, 40, 'step 40';
        my @stack = extract_stack($step);
        is scalar(@stack), 4, '4 entries on callstack';
        is $stack[0]{name}, 'to_arg0', 'to_arg0';
        is $stack[0]{result}[0], 'wantarray', 'to_arg0() -> wantarray';
        is $stack[1]{name}, 'translate', 'translate';
        is $stack[1]{result}[0], 'ghomneH', 'translate->raw';
        is $stack[1]{result}[1], 'wantarray', 'translate->trans';
        is $stack[2]{name}, 'pushtok', 'Push token acc';
        is $stack[2]{result}[0]{type}, 'acc', 'token->type';
        is $stack[2]{result}[0]{raw}, 'ghomneH', 'token->raw';
        is $stack[2]{result}[0]{trans}, 'wantarray', 'token->trans';
        is $stack[3]{name}, 'arg0', 'arg0';
        is $stack[3]{result}[0]{type}, 'acc', 'token->type';
        is $stack[3]{result}[0]{raw}, 'ghomneH', 'token->raw';
        is $stack[3]{result}[0]{trans}, 'wantarray', 'token->trans';
},
sub {
        note 'fork';
        my $step = shift;
        is $step, 41, 'step 41';
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

pagh yIlIH!
loSvatlh wa'maH cha' !
pagh yIvan!
nabvaD 'olvo' pagh DIch yInob!
pagh yInabvetlh!

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

wa'maH chorgh yIlIH! #'
wo''a' yoS! #'
main yoS!
wa'maH chorgh yIvan! #'
nabvaD 'olvo' wa'maH chorgh DIch yInob! #'
wa'maH chorgh yInabvetlh! #'

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

cha'maH Hut yIlIH! #'
{ pagh! } yIchov!
cha'maH Hut yIvan! #'
nabvaD 'olvo' cha'maH Hut DIch yInob! #'
cha'maH Hut yInabvetlh! #'

wejmaH yIlIH!
<0> yIchov!
wejmaH yIvan!
nabvaD 'olvo' wejmaH DIch yInob!
wejmaH yInabvetlh!

wejmaH wa' yIlIH! #'
{ pagh! } yIvang!
wejmaH wa' yIvan! #'
nabvaD 'olvo' wejmaH wa' DIch yInob! #'
wejmaH wa' yInabvetlh! #'

wejmaH cha' yIlIH! #'
<0> yIvang!
wejmaH cha' yIvan! #'
nabvaD 'olvo' wejmaH cha' DIch yInob! #'
wejmaH cha' yInabvetlh! #'

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

wejmaH Hut yIlIH!
yIpoH!
wejmaH Hut yIvan!
nabvaD 'olvo' wejmaH Hut DIch yInob!
wejmaH Hut yInabvetlh!

loSmaH yIlIH!
yIghomneH!
loSmaH yIvan!
nabvaD 'olvo' loSmaH DIch yInob!
loSmaH yInabvetlh!

loSmaH wa' yIlIH! #'
# fork: exit if we're the child
# my $pid; $pid = fork; if ($pid == 0) { exit; }
pIDwIj! pIDvaD yIbogh yInob! { yImej! } pID pagh mI'rap'a' teHchugh! #'
loSmaH wa' yIvan! #'
nabvaD 'olvo' loSmaH wa' DIch yInob! #'
loSmaH wa' yInabvetlh! #'

yIdone_testing!
