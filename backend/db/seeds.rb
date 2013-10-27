# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

CSV.parse("140:9003102,,S Bellevue (Berlin),,52.5197640,13.3469160,,,0,
141:9003103,,S Tiergarten (Berlin),,52.5144000,13.3364690,,,0,
192:9007104,,S Nordbahnhof (Berlin),,52.5318700,13.3881230,,,0,
210:9008101,,S Humboldthain (Berlin),,52.5447420,13.3787260,,,0,
255:9012101,,S Anhalter Bahnhof (Berlin),,52.5044990,13.3823550,,,0,
353:9020202,,S Beusselstr. (Berlin),,52.5343140,13.3287030,,,0,
399:9024101,,S Charlottenburg Bhf (Berlin),,52.5051520,13.3034770,,,0,
400:9024102,,S Westkreuz (Berlin),,52.5011520,13.2830360,,,0,
408:9024203,,S Savignyplatz (Berlin),,52.5049710,13.3198200,,,0,
427:9025321,,S Olympiastadion (Berlin),,52.5111350,13.2411110,,,0,
430:9025424,,S Pichelsberg (Berlin),,52.5105570,13.2267480,,,0,
438:9026105,,S Heerstr. (Berlin),,52.5082730,13.2585140,,,0,
450:9026207,,S Westend (Berlin),,52.5186100,13.2842370,,,0,
514:9029101,,S Spandau Bhf (Berlin),,52.5347600,13.1976520,,,0,
545:9030202,,S Stresow (Berlin),,52.5324810,13.2096750,,,0,
702:9040101,,S Halensee (Berlin),,52.4966980,13.2901510,,,0,
724:9044101,,S Hohenzollerndamm (Berlin),,52.4883140,13.3007120,,,0,
765:9048101,,S Grunewald (Berlin),,52.4886800,13.2619440,,,0,
794:9049201,,S Zehlendorf (Berlin),,52.4312090,13.2592270,,,0,
795:9049202,,S Sundgauer Str. (Berlin),,52.4361870,13.2735010,,,0,
836:9050301,,S Mexikoplatz (Berlin),,52.4371660,13.2320600,,,0,
842:9050355,,S Schlachtensee (Berlin),,52.4401170,13.2161130,,,0,
888:9052201,,S Nikolassee (Berlin),,52.4316380,13.1936180,,,0,
931:9053301,,S Wannsee Bhf (Berlin),,52.4210010,13.1779550,,,0,
964:9057101,,S Yorckstr. S1 (Berlin),,52.4922390,13.3678510,,,0,
978:9058102,,S Priesterweg (Berlin),,52.4592390,13.3560280,,,0,
984:9058108,,S Yorckstr. S2 S25 (Berlin),,52.4923410,13.3721820,,,0,
996:9060101,,S Friedenau (Berlin),,52.4709320,13.3417590,,,0,
1022:9062281,,S Rathaus Steglitz (Berlin),,52.4559610,13.3224730,,,0,
1025:9063101,,S Feuerbachstr. (Berlin),,52.4635780,13.3324120,,,0,
1065:9064256,,S Osdorfer Str. (Berlin),,52.4181260,13.3142840,,,0,
1071:9064301,,S Lichterfelde Ost Bhf (Berlin),,52.4291050,13.3282840,,,0,
1093:9066101,,S Lichterfelde West (Berlin),,52.4432620,13.2948390,,,0,
1094:9066102,,S Botanischer Garten (Berlin),,52.4475520,13.3060410,,,0,
1146:9067221,,S Lankwitz (Berlin),,52.4390340,13.3427600,,,0,
1190:9068301,,S Attilastr. (Berlin),,52.4471700,13.3605990,,,0,
1269:9072101,,S Buckower Chaussee (Berlin),,52.4109190,13.3826890,,,0,
1278:9073101,,S Marienfelde (Berlin),,52.4238160,13.3750220,,,0,
1312:9074201,,S Lichtenrade (Berlin),,52.3871610,13.3967960,,,0,
1313:9074202,,S Schichauweg (Berlin),,52.3983830,13.3902450,,,0,
1370:9077106,,S Sonnenallee (Berlin),,52.4738220,13.4559980,,,0,
1558:9084101,,S Wilhelmsruh (Berlin),,52.5815880,13.3632840,,,0,
1571:9085105,,S Alt-Reinickendorf (Berlin),,52.5779690,13.3497470,,,0,
1644:9089303,,S Tegel (Berlin),,52.5888810,13.2883280,,,0,
1648:9089375,,S Tegel (Berlin) Bus,,52.5884470,13.2885070,,,0,
1703:9091203,,S Heiligensee (Berlin),,52.6250270,13.2290620,,,0,
1704:9091205,,S Schulzendorf (Berlin),,52.6133470,13.2460090,,,0,
1713:9092201,,S Frohnau (Berlin),,52.6329580,13.2895640,,,0,
1737:9093201,,S Hermsdorf (Berlin),,52.6178920,13.3078590,,,0,
1749:9094101,,S Waidmannslust (Berlin),,52.6068140,13.3205490,,,0,
1816:9096405,,S Eichborndamm (Berlin),,52.5775450,13.3155830,,,0,
1838:9100002,,S Hackescher Markt (Berlin),,52.5222630,13.4025540,,,0,
1843:9100007,,S Oranienburger Str. (Berlin),,52.5251610,13.3930680,,,0,
1917:9110002,,S Prenzlauer Allee (Berlin),,52.5448790,13.4277460,,,0,
1918:9110003,,S Greifswalder Str. (Berlin),,52.5404260,13.4392460,,,0,
1919:9110004,,S Landsberger Allee (Berlin),,52.5287720,13.4559440,,,0,
1926:9110011,,S Bornholmer Str. (Berlin),,52.5550320,13.3978480,,,0,
1927:9110012,,S Storkower Str. (Berlin),,52.5241950,13.4648840,,,0,
1969:9120003,,S Ostkreuz (Berlin),,52.5028510,13.4690930,,,0,
1971:9120005,,S Ostbahnhof (Berlin),,52.5100010,13.4357470,,,0,
1976:9120011,,S Warschauer Str. (Berlin),,52.5077480,13.4509920,,,0,
2021:9130001,,S Pankow-Heinersdorf (Berlin),,52.5776030,13.4290900,,,0,
2023:9130003,,S Wollankstr. (Berlin),,52.5649740,13.3931500,,,0,
2141:9135001,,S Buch (Berlin),,52.6361780,13.4920970,,,0,
2210:9142001,,S Blankenburg (Berlin),,52.5910690,13.4429720,,,0,
2221:9143001,,S Karow Bhf (Berlin),,52.6145020,13.4689460,,,0,
2285:9151001,,S Wartenberg (Berlin),,52.5732660,13.5042380,,,0,
2297:9152002,,S Gehrenseestr. (Berlin),,52.5557360,13.5256530,,,0,
2319:9160001,,S Rummelsburg (Berlin),,52.5010760,13.4788560,,,0,
2320:9160002,,S Betriebsbahnhof Rummelsburg (Berlin),,52.4939570,13.4975090,,,0,
2399:9162001,,S Karlshorst Bhf (Berlin),,52.4810380,13.5259810,,,0
2419:9170001,,S Marzahn (Berlin),,52.5428530,13.5419220,,,0,
2420:9170002,,S Raoul-Wallenberg-Str. (Berlin),,52.5507490,13.5483920,,,0,
2421:9170003,,S Mehrower Allee (Berlin),,52.5578160,13.5543920,,,0,
2422:9170004,,S Ahrensfelde Bhf (Berlin),,52.5701770,13.5657290,,,0,
2423:9170005,,S Poelchaustr. (Berlin),,52.5347510,13.5360080,,,0,
2473:9171001,,S Biesdorf (Berlin),,52.5132330,13.5567950,,,0,
2474:9171002,,S Friedrichsfelde Ost (Berlin),,52.5137470,13.5200430,,,0,
2475:9171003,,S Springpfuhl (Berlin),,52.5258060,13.5369040,,,0,
2522:9175002,,S Kaulsdorf (Berlin),,52.5121220,13.5890300,,,0,
2591:9176001,,S Mahlsdorf (Berlin),,52.5119610,13.6122110,,,0,
2641:9180002,,S Wuhlheide (Berlin),,52.4690580,13.5535270,,,0,
2642:9180003,,S Spindlersfeld (Berlin),,52.4459380,13.5627010,,,0,
2721:9182001,,S Hirschgarten (Berlin),,52.4579030,13.6014800,,,0,
2722:9182002,,S Friedrichshagen (Berlin),,52.4570000,13.6254580,,,0,
2740:9183001,,S Rahnsdorf (Berlin),,52.4511530,13.6924410,,,0,
2741:9183002,,S Wilhelmshagen (Berlin),,52.4385870,13.7224020,,,0,
2792:9190001,,S Treptower Park (Berlin),,52.4928680,13.4602490,,,0,
2807:9191001,,S Baumschulenweg (Berlin),,52.4675810,13.4895050,,,0,
2827:9192002,,S Oberspree (Berlin),,52.4522690,13.5384610,,,0,
2838:9193002,,S Adlershof (Berlin),,52.4353560,13.5410770,,,0,
2910:9195510,,S Altglienicke (Berlin),,52.4077910,13.5596020,,,0,
117:9001201,,S+U Westhafen (Berlin),,52.5365280,13.3427270,,,0,
149:9003200,,S+U Berlin Hauptbahnhof (tief),,52.5250420,13.3693860,,,0,
150:9003201,,S+U Berlin Hauptbahnhof,,52.5258470,13.3689240,,,0,
190:9007102,,S+U Gesundbrunnen Bhf (Berlin),,52.5490360,13.3880450,,,0,
221:9009104,,S+U Wedding (Berlin),,52.5427320,13.3660600,,,0,
352:9020201,,S+U Jungfernheide Bhf (Berlin),,52.5302750,13.2990640,,,0,
385:9023201,,S+U Zoologischer Garten Bhf (Berlin),,52.5068820,13.3329270,,,0,
533:9029302,,S+U Rathaus Spandau (Berlin),,52.5355390,13.1997660,,,0,
730:9044202,,S+U Bundesplatz (Berlin),,52.4773660,13.3291490,,,0,
736:9045102,,S+U Heidelberger Platz (Berlin),,52.4794460,13.3118430,,,0,
943:9054105,,S+U Innsbrucker Platz (Berlin),,52.4781000,13.3428750,,,0,
965:9057102,,S+U Yorckstr. S1 U7 (Berlin),,52.4929850,13.3693170,,,0,
966:9057103,,S+U Yorckstr. (Berlin),,52.4928090,13.3698120,,,0,
979:9058103,,S+U Yorckstr. S2 S25 U7 (Berlin),,52.4926310,13.3711760,,,0,
1017:9062202,,S+U Rathaus Steglitz (Berlin),,52.4565980,13.3217560,,,0,
1181:9068201,,S+U Tempelhof (Berlin),,52.4706940,13.3857540,,,0,
1402:9078201,,S+U Neukölln (Berlin),,52.4692980,13.4423680,,,0,
1417:9079221,,S+U Hermannstr. (Berlin),,52.4671810,13.4317040,,,0,
1765:9096101,,S+U Wittenau (Berlin),,52.5962900,13.3349620,,,0,
1778:9096197,,S+U Wittenau (Berlin) U8,,52.5962900,13.3349620,,,0,
1779:9096198,,S+U Wittenau (Berlin) Bus,,52.5962900,13.3349620,,,0,
1828:9096458,,S+U Karl-Bonhoeffer-Nervenklinik (Berlin),,52.5781690,13.3329210,,,0,
1837:9100001,,S+U Friedrichstr. Bhf (Berlin),,52.5201340,13.3880180,,,0,
1839:9100003,,S+U Alexanderplatz Bhf (Berlin),,52.5211520,13.4128320,,,0,
1840:9100004,,S+U Jannowitzbrücke (Berlin),,52.5155000,13.4180270,,,0,
1855:9100020,,S+U Potsdamer Platz Bhf (Berlin),,52.5091640,13.3776850,,,0,
1859:9100025,,S+U Brandenburger Tor (Berlin),,52.5165140,13.3809350,,,0,
1916:9110001,,S+U Schönhauser Allee (Berlin),,52.5493360,13.4151380,,,0,
1967:9120001,,S+U Frankfurter Allee (Berlin),,52.5136130,13.4753000,,,0,
1970:9120004,,S+U Warschauer Str. (Berlin),,52.5058890,13.4487210,,,0,
2022:9130002,,S+U Pankow (Berlin),,52.5672810,13.4122790,,,0,
2322:9160004,,S+U Lichtenberg Bhf (Berlin),,52.5105280,13.4990600,,,0,
2521:9175001,,S+U Wuhletal (Berlin),,52.5125370,13.5754780,,,0,
127:9002201,,U Birkenstr. (Berlin),,52.5322290,13.3414170,,,0,
139:9003101,,U Hansaplatz (Berlin),,52.5181110,13.3421650,,,0,
142:9003104,,U Turmstr. (Berlin),,52.5258370,13.3424010,,,0,
158:9003254,,U Bundestag (Berlin),,52.5199080,13.3734540,,,0,
176:9005201,,U Kurfürstenstr. (Berlin),,52.4998100,13.3628140,,,0,
181:9005252,,U Mendelssohn-Bartholdy-Park (Berlin),,52.5038060,13.3747190,,,0,
191:9007103,,U Voltastr. (Berlin),,52.5419300,13.3931570,,,0,
197:9007110,,U Bernauer Str. (Berlin),,52.5379940,13.3962310,,,0,
211:9008102,,U Reinickendorfer Str. (Berlin),,52.5398950,13.3703930,,,0,
218:9009101,,U Amrumer Str. (Berlin),,52.5422020,13.3495340,,,0,
219:9009102,,U Leopoldplatz (Berlin),,52.5464930,13.3593950,,,0,
220:9009103,,U Seestr. (Berlin),,52.5504700,13.3519690,,,0,
229:9009201,,U Nauener Platz (Berlin),,52.5515240,13.3673650,,,0,
230:9009202,,U Osloer Str. (Berlin),,52.5569380,13.3732840,,,0,
231:9009203,,U Pankstr. (Berlin),,52.5522550,13.3818370,,,0,
240:9011101,,U Rehberge (Berlin),,52.5566700,13.3410130,,,0,
241:9011102,,U Afrikanische Str. (Berlin),,52.5608620,13.3335020,,,0,
257:9012103,,U Hallesches Tor (Berlin),,52.4977740,13.3917600,,,0,
270:9013101,,U Moritzplatz (Berlin),,52.5037390,13.4109470,,,0,
271:9013102,,U Kottbusser Tor (Berlin),,52.4992490,13.4181670,,,0,
272:9013103,,U Prinzenstr. (Berlin),,52.4982740,13.4065310,,,0,
276:9014101,,U Görlitzer Bahnhof (Berlin),,52.4990350,13.4284680,,,0,
277:9014102,,U Schlesisches Tor (Berlin),,52.5007590,13.4419260,,,0,
294:9016101,,U Gneisenaustr. (Berlin),,52.4912520,13.3953820,,,0,
301:9016201,,U Schönleinstr. (Berlin),,52.4931790,13.4222410,,,0,
302:9016202,,U Südstern (Berlin),,52.4892190,13.4076850,,,0,
311:9017101,,U Mehringdamm (Berlin),,52.4935750,13.3881530,,,0,
312:9017102,,U Platz der Luftbrücke (Berlin),,52.4849770,13.3863510,,,0,
313:9017103,,U Gleisdreieck (Berlin),,52.4995870,13.3742930,,,0,
314:9017104,,U Möckernbrücke (Berlin),,52.4989440,13.3832560,,,0,
322:9018101,,U Jakob-Kaiser-Platz (Berlin),,52.5369850,13.2936610,,,0,
323:9018102,,U Halemweg (Berlin),,52.5367030,13.2865780,,,0,
341:9019204,,U Mierendorffplatz (Berlin),,52.5259780,13.3057150,,,0,
366:9022101,,U Sophie-Charlotte-Platz (Berlin),,52.5109700,13.2974630,,,0,
375:9022201,,U Deutsche Oper (Berlin),,52.5118270,13.3094200,,,0,
376:9022202,,U Richard-Wagner-Platz (Berlin),,52.5171540,13.3072210,,,0,
380:9023101,,U Ernst-Reuter-Platz (Berlin),,52.5115820,13.3225810,,,0,
386:9023202,,U Augsburger Str. (Berlin),,52.5005570,13.3367710,,,0,
387:9023203,,U Kurfürstendamm (Berlin),,52.5037630,13.3314190,,,0,
391:9023301,,U Uhlandstr. (Berlin),,52.5027420,13.3262330,,,0,
392:9023302,,U Adenauerplatz (Berlin),,52.5000860,13.3073480,,,0,
406:9024201,,U Bismarckstr. (Berlin),,52.5115130,13.3052860,,,0,
407:9024202,,U Wilmersdorfer Str. (Berlin),,52.5058340,13.3068850,,,0,
420:9025202,,U Ruhleben (Berlin),,52.5255870,13.2419020,,,0,
421:9025203,,U Olympia-Stadion (Berlin),,52.5170480,13.2505000,,,0,
436:9026101,,U Neu-Westend (Berlin),,52.5164090,13.2599100,,,0,
444:9026201,,U Theodor-Heuss-Platz (Berlin),,52.5097980,13.2729770,,,0,
445:9026202,,U Kaiserdamm (Berlin),,52.5099710,13.2819670,,,0,
446:9026203,,U Theodor-Heuss-Platz Süd (Berlin),,52.5089080,13.2722150,,,0,
452:9026271,,U Theodor-Heuss-Platz West (Berlin),,52.5100880,13.2710710,,,0,
532:9029301,,U Altstadt Spandau (Berlin),,52.5391610,13.2067630,,,0,
588:9033101,,U Zitadelle (Berlin),,52.5375220,13.2176250,,,0,
591:9034101,,U Paulsternstr. (Berlin),,52.5380980,13.2485930,,,0,
592:9034102,,U Haselhorst (Berlin),,52.5390120,13.2317570,,,0,
604:9035101,,U Siemensdamm (Berlin),,52.5370260,13.2733230,,,0,
615:9036101,,U Rohrdamm (Berlin),,52.5369040,13.2628700,,,0,
708:9041101,,U Fehrbelliner Platz (Berlin),,52.4902010,13.3145190,,,0,
709:9041102,,U Blissestr. (Berlin),,52.4863470,13.3216180,,,0,
713:9041201,,U Konstanzer Str. (Berlin),,52.4935670,13.3100840,,,0,
717:9042101,,U Spichernstr. (Berlin),,52.4965820,13.3306130,,,0,
718:9043101,,U Hohenzollernplatz (Berlin),,52.4938330,13.3240510,,,0,
722:9043201,,U Güntzelstr. (Berlin),,52.4919920,13.3312100,,,0,
729:9044201,,U Berliner Str. (Berlin),,52.4870470,13.3313550,,,0,
735:9045101,,U Rüdesheimer Platz (Berlin),,52.4724620,13.3143870,,,0,
821:9050201,,U Krumme Lanke (Berlin),,52.4426150,13.2403600,,,0,
835:9050282,,U Onkel Toms Hütte (Berlin),,52.4501460,13.2540160,,,0,
848:9051201,,U Thielplatz (Berlin),,52.4510000,13.2816510,,,0,
849:9051202,,U Breitenbachplatz (Berlin),,52.4673420,13.3092760,,,0,
864:9051301,,U Oskar-Helene-Heim (Berlin),,52.4506950,13.2699480,,,0,
865:9051302,,U Podbielskiallee (Berlin),,52.4641720,13.2952030,,,0,
866:9051303,,U Dahlem-Dorf (Berlin),,52.4576950,13.2900110,,,0,
939:9054101,,U Rathaus Schöneberg (Berlin),,52.4833320,13.3419890,,,0,
940:9054102,,U Kleistpark (Berlin),,52.4908450,13.3609170,,,0,
941:9054103,,U Eisenacher Str. (Berlin),,52.4895290,13.3502760,,,0,
951:9055101,,U Viktoria-Luise-Platz (Berlin),,52.4961690,13.3432640,,,0,
952:9055102,,U Bayerischer Platz (Berlin),,52.4886540,13.3402370,,,0,
959:9056101,,U Wittenbergplatz (Berlin),,52.5021090,13.3425610,,,0,
960:9056102,,U Nollendorfplatz (Berlin),,52.4996440,13.3538250,,,0,
961:9056104,,U Bülowstr. (Berlin),,52.4976570,13.3624520,,,0,
1008:9061101,,U Walther-Schreiber-Platz (Berlin),,52.4649980,13.3284090,,,0,
1009:9061102,,U Friedrich-Wilhelm-Platz (Berlin),,52.4714390,13.3286760,,,0,
1018:9062203,,U Schloßstr. (Berlin),,52.4611830,13.3248360,,,0,
1168:9068101,,U Paradestr. (Berlin),,52.4781420,13.3867250,,,0,
1182:9068202,,U Alt-Tempelhof (Berlin),,52.4659300,13.3857960,,,0,
1191:9068302,,U Kaiserin-Augusta-Str. (Berlin),,52.4605120,13.3849050,,,0,
1221:9069271,,U Ullsteinstr. (Berlin),,52.4534500,13.3847710,,,0,
1222:9070101,,U Westphalweg (Berlin),,52.4458010,13.3855610,,,0,
1241:9070301,,U Alt-Mariendorf (Berlin),,52.4391150,13.3878810,,,0,
1390:9078101,,U Hermannplatz (Berlin),,52.4866730,13.4251230,,,0,
1391:9078102,,U Rathaus Neukölln (Berlin),,52.4810680,13.4352460,,,0,
1392:9078103,,U Karl-Marx-Str. (Berlin),,52.4764290,13.4398050,,,0,
1410:9079201,,U Leinestr. (Berlin),,52.4728740,13.4284000,,,0,
1411:9079202,,U Boddinstr. (Berlin),,52.4797450,13.4257820,,,0,
1431:9080201,,U Blaschkoallee (Berlin),,52.4527430,13.4489760,,,0,
1432:9080202,,U Grenzallee (Berlin),,52.4635160,13.4448280,,,0,
1440:9080401,,U Parchimer Allee (Berlin),,52.4453440,13.4499250,,,0,
1441:9080402,,U Britz-Süd (Berlin),,52.4370760,13.4476680,,,0,
1481:9082201,,U Lipschitzallee (Berlin),,52.4246450,13.4631090,,,0,
1482:9082202,,U Johannisthaler Chaussee (Berlin),,52.4292530,13.4538510,,,0,
1504:9083101,,U Zwickauer Damm (Berlin),,52.4230320,13.4843710,,,0,
1505:9083102,,U Wutzkyallee (Berlin),,52.4231520,13.4748200,,,0,
1514:9083201,,U Rudow (Berlin),,52.4156140,13.4967340,,,0,
1570:9085104,,U Paracelsus-Bad (Berlin),,52.5745340,13.3475320,,,0,
1582:9085202,,U Franz-Neumann-Platz (Berlin),,52.5638540,13.3642830,,,0,
1583:9085203,,U Residenzstr. (Berlin),,52.5708430,13.3606350,,,0,
1604:9086101,,U Otisstr. (Berlin),,52.5711220,13.3030740,,,0,
1605:9086102,,U Kurt-Schumacher-Platz (Berlin),,52.5634830,13.3273280,,,0,
1621:9086160,,U Lindauer Allee (Berlin),,52.5753940,13.3390470,,,0,
1625:9087101,,U Scharnweberstr. (Berlin),,52.5671110,13.3115240,,,0,
1632:9088201,,U Holzhauser Str. (Berlin),,52.5762520,13.2950830,,,0,
1633:9088202,,U Borsigwerke (Berlin),,52.5821390,13.2901220,,,0,
1642:9089301,,U Alt-Tegel (Berlin),,52.5899330,13.2832980,,,0,
1647:9089372,,U Alt-Tegel (Berlin) Bus,,52.5903950,13.2829870,,,0,
1818:9096407,,U Wittenau (Berlin),,52.5955090,13.3333000,,,0,
1821:9096410,,U Rathaus Reinickendorf (Berlin),,52.5882180,13.3255680,,,0,
1844:9100008,,U Heinrich-Heine-Str. (Berlin),,52.5108580,13.4161690,,,0,
1845:9100009,,U Naturkundemuseum (Berlin),,52.5306720,13.3829270,,,0,
1846:9100010,,U Mohrenstr. (Berlin),,52.5115190,13.3837980,,,0,
1847:9100012,,U Hausvogteiplatz (Berlin),,52.5133610,13.3953460,,,0,
1848:9100013,,U Spittelmarkt (Berlin),,52.5113010,13.4023520,,,0,
1849:9100014,,U Märkisches Museum (Berlin),,52.5120070,13.4087670,,,0,
1850:9100015,,U Klosterstr. (Berlin),,52.5172290,13.4124550,,,0,
1851:9100016,,U Rosa-Luxemburg-Platz (Berlin),,52.5281910,13.4104050,,,0,
1852:9100017,,U Schillingstr. (Berlin),,52.5203160,13.4218950,,,0,
1854:9100019,,U Oranienburger Tor (Berlin),,52.5256710,13.3879270,,,0,
1857:9100023,,U Rosenthaler Platz (Berlin),,52.5297810,13.4013930,,,0,
1861:9100027,,U Französische Str. (Berlin),,52.5147710,13.3900880,,,0,
1877:9100051,,U Weinmeisterstr. (Berlin),,52.5253760,13.4053050,,,0,
1879:9100501,,U Schwartzkopffstr. (Berlin),,52.5353970,13.3770330,,,0,
1914:9100700,,U Stadtmitte U6 (Berlin),,52.5111790,13.3898270,,,0,
1915:9100701,,U Stadtmitte U2 (Berlin),,52.5121690,13.3897110,,,0,
1920:9110005,,U Senefelderplatz (Berlin),,52.5326220,13.4126250,,,0,
1921:9110006,,U Eberswalder Str. (Berlin),,52.5410850,13.4121600,,,0,
1972:9120006,,U Strausberger Platz (Berlin),,52.5180250,13.4322080,,,0,
1973:9120008,,U Frankfurter Tor (Berlin),,52.5150790,13.4541800,,,0,
1974:9120009,,U Samariterstr. (Berlin),,52.5146620,13.4653470,,,0,
1988:9120025,,U Weberwiese (Berlin),,52.5168480,13.4432780,,,0,
2025:9130011,,U Vinetastr. (Berlin),,52.5595170,13.4137700,,,0,
2323:9160005,,U Magdalenenstr. (Berlin),,52.5122140,13.4894390,,,0,
2376:9161002,,U Tierpark (Berlin),,52.4972360,13.5236260,,,0,
2391:9161512,,U Friedrichsfelde (Berlin),,52.5058950,13.5127910,,,0,
2476:9171005,,U Biesdorf-Süd (Berlin),,52.4995170,13.5473260,,,0,
2477:9171006,,U Elsterwerdaer Platz (Berlin),,52.5059690,13.5617520,,,0,
2519:9171700,,U Elsterwerdaer Platz (Berlin) Busendstelle,,52.5063540,13.5605280,,,0,
2520:9171701,,U Elsterwerdaer Platz (Berlin) Bus Köpenicker S.,,52.5053500,13.5616710,,,0,
2523:9175004,,U Kaulsdorf-Nord (Berlin),,52.5214360,13.5887630,,,0,
2524:9175005,,U Neue Grottkauer Str. (Berlin),,52.5282400,13.5907770,,,0,
2525:9175006,,U Cottbusser Platz (Berlin),,52.5339630,13.5968940,,,0,
2526:9175007,,U Hellersdorf (Berlin),,52.5359460,13.6057940,,,0,
2529:9175010,,U Hönow (Berlin),,52.5381050,13.6345410,,,0,
2534:9175015,,U Louis-Lewin-Str. (Berlin),,52.5391350,13.6197070,,,0,
") do |row|
  Location.create(:name=>row[2],:latlong=>Location.rgeo_factory_for_column(:latlong).point(row[4].to_f, row[5].to_f), :price=>2000+rand(5000))
end

User.create(:color=>"%06x" % (rand * 0xffffff),:password=>'temprary',:email=>"Lyndsay.Haga@stationary.com",:name=>"Lyndsay Haga")
User.create(:color=>"%06x" % (rand * 0xffffff),:password=>'temprary',:email=>"James.Crusoe@stationary.com",:name=>"James Crusoe")
User.create(:color=>"%06x" % (rand * 0xffffff),:password=>'temprary',:email=>"Fritz.Olvera@stationary.com",:name=>"Fritz Olvera")
User.create(:color=>"%06x" % (rand * 0xffffff),:password=>'temprary',:email=>"Tracee.Wiersma@stationary.com",:name=>"Tracee Wiersma")
User.create(:color=>"%06x" % (rand * 0xffffff),:password=>'temprary',:email=>"Vertie.Jarrells@stationary.com",:name=>"Vertie Jarrells")
User.create(:color=>"%06x" % (rand * 0xffffff),:password=>'temprary',:email=>"Anjanette.Whisenant@stationary.com",:name=>"Anjanette Whisenant")
User.create(:color=>"%06x" % (rand * 0xffffff),:password=>'temprary',:email=>"Gerri.Henkle@stationary.com",:name=>"Gerri Henkle")
User.create(:color=>"%06x" % (rand * 0xffffff),:password=>'temprary',:email=>"Shay.Hippert@stationary.com",:name=>"Shay Hippert")
User.create(:color=>"%06x" % (rand * 0xffffff),:password=>'temprary',:email=>"Grazyna.Hendrick@stationary.com",:name=>"Grazyna Hendrick")
User.create(:color=>"%06x" % (rand * 0xffffff),:password=>'temprary',:email=>"Leia.Cardin@stationary.com",:name=>"Leia Cardin")
User.create(:color=>"%06x" % (rand * 0xffffff),:password=>'temprary',:email=>"Almeta.Mckane@stationary.com",:name=>"Almeta Mckane")
User.create(:color=>"%06x" % (rand * 0xffffff),:password=>'temprary',:email=>"Tonette.Sova@stationary.com",:name=>"Tonette Sova")
User.create(:color=>"%06x" % (rand * 0xffffff),:password=>'temprary',:email=>"Manie.Belin@stationary.com",:name=>"Manie Belin")
User.create(:color=>"%06x" % (rand * 0xffffff),:password=>'temprary',:email=>"Charley.Ben@stationary.com",:name=>"Charley Ben")
User.create(:color=>"%06x" % (rand * 0xffffff),:password=>'temprary',:email=>"Avril.Jankowski@stationary.com",:name=>"Avril Jankowski")
User.create(:color=>"%06x" % (rand * 0xffffff),:password=>'temprary',:email=>"Monique.Ketelsen@stationary.com",:name=>"Monique Ketelsen")
User.create(:color=>"%06x" % (rand * 0xffffff),:password=>'temprary',:email=>"Mariano.Kilian@stationary.com",:name=>"Mariano Kilian")
User.create(:color=>"%06x" % (rand * 0xffffff),:password=>'temprary',:email=>"Corrina.Deacon@stationary.com",:name=>"Corrina Deacon")
User.create(:color=>"%06x" % (rand * 0xffffff),:password=>'temprary',:email=>"Elvina.Tipton@stationary.com",:name=>"Elvina Tipton")
User.create(:color=>"%06x" % (rand * 0xffffff),:password=>'temprary',:email=>"Ashlyn.Robbs@stationary.com",:name=>"Ashlyn Robbs")


@users = User.all(limit:15)
@locations = Location.all()

(1..100).each{ |location|
  own = LocationOwnership.create(:location=>@locations.delete_at(rand(@locations.length)),:start=>DateTime.now, :user=>@users[rand(@users.length)], :end=>DateTime.now + rand(50).hours)
  Transaktion.create!(:amount=> + 10, :action=>Transaktion::ACTION_LOCATION_PASSING_RECEIVE,:wallet=>@users[rand(@users.length)].wallet, :transaktionable=>own.location)
}