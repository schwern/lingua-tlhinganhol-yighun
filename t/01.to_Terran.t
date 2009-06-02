use Test::More qw(no_plan);

require_ok Lingua::tlhInganHol::yIghun;

is Lingua::tlhInganHol::yIghun::to_Terran(undef), '', 'undef';
is Lingua::tlhInganHol::yIghun::to_Terran(''), '', 'empty string';
is scalar(Lingua::tlhInganHol::yIghun::to_Terran('abc')), undef, 'garbarge';
isn't Lingua::tlhInganHol::yIghun::to_Terran('maH'), '10', 'maH';
is Lingua::tlhInganHol::yIghun::to_Terran("cha'"), '2', "cha'";
is Lingua::tlhInganHol::yIghun::to_Terran("wa'maH"), '10', "wa'maH";
isn't Lingua::tlhInganHol::yIghun::to_Terran("wa'mah"), '10', "wa'mah";
is Lingua::tlhInganHol::yIghun::to_Terran("HutmaH vagh"), '95', "HutmaH vagh";
isn't Lingua::tlhInganHol::yIghun::to_Terran("Hut vagh"), '95', "Hut vagh";
TODO: {
	local $TODO = 'Decimals currently need a trailing space; this should be fixed.';
	is Lingua::tlhInganHol::yIghun::to_Terran("HutmaH vagh DoD cha' Soch"), '95.27', "HutmaH vagh DoD cha' Soch";
}
is Lingua::tlhInganHol::yIghun::to_Terran("HutmaH vagh DoD cha' Soch "), '95.27', "HutmaH vagh DoD cha' Soch (with space)";
