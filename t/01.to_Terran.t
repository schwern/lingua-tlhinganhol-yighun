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
is to_Terran("wej DoD wa' loS wa' vagh Hut "), '3.14159', 'pi (with space)';

# test powers of phi, for longer numbers
is to_Terran("cha'"),                                                            '2', 'phi^ 1';
is to_Terran("wej"),                                                             '3', 'phi^ 2';
is to_Terran("loS"),                                                             '4', 'phi^ 3';
is to_Terran("Soch"),                                                            '7', 'phi^ 4';
is to_Terran("wa'maH wa'"),                                                     '11', 'phi^ 5';
is to_Terran("wa'maH chorgh"),                                                  '18', 'phi^ 6';
is to_Terran("cha'maH Hut"),                                                    '29', 'phi^ 7';
is to_Terran("loSmaH Soch"),                                                    '47', 'phi^ 8';
is to_Terran("SochmaH jav"),                                                    '76', 'phi^ 9';
is to_Terran("wa'vatlh cha'maH wej"),                                          '123', 'phi^10';
is to_Terran("wa'vatlh HutmaH Hut"),                                           '199', 'phi^11';
is to_Terran("wejvatlh cha'maH cha'"),                                         '322', 'phi^12';
is to_Terran("vaghvatlh cha'maH wa'"),                                         '521', 'phi^13';
is to_Terran("chorghvatlh loSmaH wej"),                                        '843', 'phi^14';
is to_Terran("wa'SaD wejvatlh javmaH loS"),                                   '1364', 'phi^15';
is to_Terran("cha'SanID cha'vatlh Soch"),                                     '2207', 'phi^16';
is to_Terran("wejSaD vaghvatlh SochmaH wa'"),                                 '3571', 'phi^17';
is to_Terran("vaghSanID Sochvatlh SochmaH chorgh"),                           '5778', 'phi^18';
is to_Terran("HutSaD wejvatlh loSmaH Hut"),                                   '9349', 'phi^19';
is to_Terran("wa'netlh vaghSanID wa'vatlh cha'maH Soch"),                    '15127', 'phi^20';
is to_Terran("cha'netlh loSSaD loSvatlh SochmaH jav"),                       '24476', 'phi^21';
is to_Terran("wejnetlh HutSanID javvatlh wej"),                              '39603', 'phi^22';
is to_Terran("javnetlh loSSaD SochmaH Hut"),                                 '64079', 'phi^23';
is to_Terran("wa'bIp wejSanID javvatlh chorghmaH cha'"),                    '103682', 'phi^24';
is to_Terran("wa'bIp javnetlh SochSaD Sochvatlh javmaH wa'"),               '167761', 'phi^25';
is to_Terran("cha'bIp Sochnetlh wa'SanID loSvatlh loSmaH wej"),             '271443', 'phi^26';
is to_Terran("loSbIp wejnetlh HutSaD cha'vatlh loS"),                       '439204', 'phi^27';
is to_Terran("SochbIp wa'netlh javvatlh loSmaH Soch"),                      '710647', 'phi^28';
is to_Terran("wa''uy' wa'bIp loSnetlh HutSaD chorghvatlh vaghmaH wa'"),    '1149851', 'phi^29';
is to_Terran("wa''uy' chorghbIp javnetlh loSvatlh HutmaH chorgh"),         '1860498', 'phi^30';
is to_Terran("wej'uy' wa'netlh wejvatlh loSmaH Hut"),                      '3010349', 'phi^31';
is to_Terran("loS'uy' chorghbIp Sochnetlh chorghvatlh loSmaH Soch"),       '4870847', 'phi^32';
is to_Terran("Soch'uy' chorghbIp chorghnetlh wa'SaD wa'vatlh HutmaH jav"), '7881196', 'phi^33';
