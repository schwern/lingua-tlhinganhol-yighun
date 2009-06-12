#!perl -w

use Test::More;

my $have_test_pod = eval "use Test::Pod 1.14; 1";
plan skip_all => "Test::Pod 1.14 required for testing POD" unless $have_test_pod;

all_pod_files_ok();
