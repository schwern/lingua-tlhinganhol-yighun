#!perl -w
# vim:set et si:
#
use Carp;
use Data::Dumper;
use strict;
my $DEBUG;

BEGIN { $DEBUG = 0; }

my @callstack;

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

my %end_index;

sub extract_stack($;$) {
        my $step = shift;
        my $skip = shift || 3;
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
        @stack = @stack[$start_index+1 .. $end_index-$skip];
        warn "Step $step: using stack " . Dumper(\@stack) if $DEBUG;
        return @stack;
}

'teH';
