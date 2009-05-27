use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Lingua::tlhInganHol::yIghun',
    license             => 'perl',
    dist_author         => 'Damian Conway <DCONWAY@CPAN.org>',
    dist_version_from   => 'lib/Lingua/tlhInganHol/yIghun.pm',
    requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'Lingua-tlhInganHol-yIghun-*' ],
);

$builder->create_build_script();
