use Test::More qw(no_plan);

require_ok Lingua::tlhInganHol::yIghun;

*from_Terran = \&Lingua::tlhInganHol::yIghun::from_Terran;

is from_Terran(''), 'pagh', 'blank string -> zero';
is from_Terran(undef), 'pagh', 'undef -> zero';
is from_Terran(0), 'pagh', 'zero: 0';
is from_Terran('00000'), 'pagh', 'zeroes: 00000';
is from_Terran('abc'), 'pagh', 'garbage: abc';
is from_Terran('a1b2c3'), 'pagh', 'garbage: a1b2c3';
is from_Terran('7x8y9z'), 'Soch', 'garbage: 7x8y9z';
is from_Terran('7x8y9z.123'), 'Soch', 'garbage plus decimal point';
is from_Terran('7x8y9'), 'Soch', 'garbage: 7x8y9';
is from_Terran('7x8y9.123'), 'Soch', 'garbage plus decimal point';
is from_Terran('.'), 'pagh', 'decimal point';
is from_Terran('0.'), 'pagh', 'zero: 0.';
is from_Terran('.0'), 'pagh', 'zero: .0';
is from_Terran('0.0'), 'pagh', 'zero: 0.0';
is from_Terran('0.4'), 'pagh DoD loS', 'small decimal: 0.4';
is from_Terran('.4'), 'pagh DoD loS', 'leading decimal point: .4';
is from_Terran('4.0'), 'loS', 'ignore a single .0';
is from_Terran('4.'), 'loS', 'ignore trailing decimal point';
is from_Terran('4.00'), 'loS DoD pagh pagh', 'multiple trailing .0: 4.00';
is from_Terran(1.1), "wa' DoD wa'", 'decimal: 1.1';
is from_Terran(1), "wa'", 'units: 1';
is from_Terran(20), "cha'maH", 'tens: 20';
is from_Terran(300), "wejvatlh", 'hundreds: 300';
is from_Terran(4000), "loSSaD", 'thousands: 4000';
is from_Terran(50_000), "vaghnetlh", 'ten-thousands: 50_000';
is from_Terran(600_000), "javbIp", 'hundred-thousands: 600_000';
is from_Terran(7_000_000), "Soch'uy'", 'millions: 7_000_000';
is from_Terran(2_000_000), "cha''uy'", 'millions: 2_000_000 (checking apostrophes)';
is from_Terran(12), "wa'maH cha'", 'more than one unit: 12';
is from_Terran(123), "wa'vatlh cha'maH wej", 'more than one unit: 123';
is from_Terran(10203), "wa'netlh cha'vatlh wej", 'zeroes in the middle';
is from_Terran(40005), "loSnetlh vagh", 'zeroes in the middle (2)';
is from_Terran(60070), "javnetlh SochmaH", 'zeroes in the middle (3)';
