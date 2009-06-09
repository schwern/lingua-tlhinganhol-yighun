use Test::More qw(no_plan);

require_ok Lingua::tlhInganHol::yIghun;

*to_Terran = \&Lingua::tlhInganHol::yIghun::to_Terran;

is to_Terran(undef), '', 'undef';
is to_Terran(''), '', 'empty string';
is scalar(to_Terran('abc')), undef, 'garbarge';
isnt to_Terran('maH'), '10', 'maH';
is to_Terran("cha'"), '2', "cha'";
is to_Terran("wa'maH"), '10', "wa'maH";
isnt to_Terran("wa'mah"), '10', "wa'mah";
is to_Terran("HutmaH vagh"), '95', "HutmaH vagh";
isnt to_Terran("Hut vagh"), '95', "Hut vagh";
TODO: {
	local $TODO = 'Decimals currently need a trailing space; this should be fixed.';
	is to_Terran("HutmaH vagh DoD cha' Soch"), '95.27', "HutmaH vagh DoD cha' Soch";
}
is to_Terran("HutmaH vagh DoD cha' Soch "), '95.27', "HutmaH vagh DoD cha' Soch (with space)";
