#!perl -w
# vim:set et:
#
use Test::More tests => 76;
use Carp;
use Data::Dumper;
use strict;
my $DEBUG;

BEGIN { $DEBUG = 0; }

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
);

=for comment
        tok
        nostop
        print_honourably
        readline_honourably
        top
        translate
        to_decl
        to_sub_decl
        to_usage
        to_go
        to_listop
        to_blockop
        to_match
        to_change
        to_arg1
        to_arg1_da
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
        decl
        sub_decl
        usage
        go
        listop
        blockop
        match
        change
        arg1
        arg1_da
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
        @stack = @stack[$start_index+1 .. $end_index-3];
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
];

my @module_args;
BEGIN { push @module_args, 'yIQIj' if $DEBUG; }
# BEGIN { push @module_args, 'yImugh' if $DEBUG; }
no warnings 'void';
use Lingua::tlhInganHol::yIghun @module_args;
nabwIj!

pagh yIlIH!
loSvatlh wa'maH cha' !
pagh yIvan!
nabvaD 'olvo' pagh DIch yInob!
pagh tInabvetlh! #'

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
