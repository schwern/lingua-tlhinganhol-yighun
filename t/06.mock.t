#!perl -w
#
use Test::More tests => 11;
use Carp;
use Data::Dumper;
my $DEBUG;

BEGIN { $DEBUG = 0; }

BEGIN { require_ok 'Lingua::tlhInganHol::yIghun' }

my @callstack;

# Wrap a called subroutine in a way that will record the call stack.
sub wrap {
        my $subname = shift;
        my $fullname = 'Lingua::tlhInganHol::yIghun::' . $subname;
        if (!defined(&$fullname)) {
                croak "Can't wrap non-existent function $subname";
        }
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
        greater
        lesser
        conj_l

=cut

}

# number
note "Simple number";

my $Zol = [sub {
        # remove stuff that's just for calling us
        splice @callstack, -6;
        is scalar(@callstack), 3, '3 entries on callstack';
        is $callstack[0]{name}, 'to_Terran', 'translate number first';
        is scalar(@{$callstack[0]{args}}), 1, 'to_Terran($)';
        is $callstack[0]{args}[0], "loSvatlh wa'maH cha'", 'to_Terran(arg)';
        is scalar(@{$callstack[0]{result}}), 1, '$ = to_Terran';
        is $callstack[0]{result}[0], '412', 'to_Terran = 412';
        is $callstack[1]{name}, 'pushtok', 'Push token';
        is $callstack[1]{args}[0], 'acc', 'token->type = "acc"';
        is $callstack[1]{args}[1], "loSvatlh wa'maH cha'", 'token->raw';
        is $callstack[1]{args}[2], '412', 'token->trans = 412';
}];

my @module_args;
BEGIN { push @module_args, 'yIQIj' if $DEBUG; }
no warnings 'void';
use Lingua::tlhInganHol::yIghun @module_args;
loSvatlh wa'maH cha' !
# TODO: should be 'nabwIj*vaD*' but that grammar isn't currently accepted
# (and this syntax should *not* be accepted, but is... in fact, the
# documentation uses the plain -wIj form in assignments a couple of times!)
nabwIj 'olvo' pagh DIch yInob!
yInabvetlh!
