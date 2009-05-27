use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Lingua::tlhInganHol::yIghun',
    AUTHOR              => 'Damian Conway <DCONWAY@CPAN.org>',
    VERSION_FROM        => 'lib/Lingua/tlhInganHol/yIghun.pm',
    ABSTRACT_FROM       => 'lib/Lingua/tlhInganHol/yIghun.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Lingua-tlhInganHol-yIghun-*' },
);
