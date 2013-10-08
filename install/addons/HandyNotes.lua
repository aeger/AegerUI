local addonname, aegerUI = ...

function aegerUI:InstallHandyNotes()
	if not IsAddOnLoaded("HandyNotes") then return end
	
		_G.aegerUI_HandyNotes_Install = {
			["AhnQirajTheFallenKingdom"] = {
			[46570731] = {
				["icon"] = 28,
				["title"] = "Ahn'Quraj 40",
				["desc"] = "Entrance",
			},
			[59091404] = {
				["title"] = "Ahn'Quraj 20",
				["icon"] = 28,
				["desc"] = "Entrance",
			},
		},
		["VashjirRuins"] = {
			[58128221] = {
				["title"] = "Poseidus",
				["icon"] = 8,
				["desc"] = "",
			},
			[39306810] = {
				["title"] = "Poseidus",
				["icon"] = 8,
				["desc"] = "",
			},
			[46255045] = {
				["title"] = "Poseidus",
				["icon"] = 8,
				["desc"] = "",
			},
			[66144307] = {
				["title"] = "Poseidus",
				["icon"] = 8,
				["desc"] = "",
			},
		},
		["Dragonblight"] = {
			[59207727] = {
				["title"] = "Okrut Drachenwüste",
				["icon"] = 16,
				["desc"] = "Pet-Trainer\nUndead, Drachkin, Undead",
			},
			[82186569] = {
				["title"] = "Val'kyr Pet",
				["icon"] = 4,
				["desc"] = "",
			},
			[26795334] = {
				["title"] = "Val'kyr Pet",
				["icon"] = 4,
				["desc"] = "",
			},
			[65283489] = {
				["title"] = "Val'kyr Pet",
				["icon"] = 4,
				["desc"] = "",
			},
		},
		["DragonSoul"] = {
			[35215821] = {
				["title"] = "Warlord Zon'ozz",
				["level"] = 1,
				["icon"] = 8,
				["desc"] = "",
			},
			[70505949] = {
				["title"] = "Yor'sahj the Unsleeping",
				["level"] = 1,
				["icon"] = 8,
				["desc"] = "",
			},
		},
		["TheStormPeaks"] = {
			[41767868] = {
				["title"] = "Val'kyr Pet",
				["icon"] = 4,
				["desc"] = "",
			},
			[65604227] = {
				["title"] = "Val'kyr Pet",
				["icon"] = 4,
				["desc"] = "",
			},
			[28935093] = {
				["title"] = "Val'kyr Pet",
				["icon"] = 4,
				["desc"] = "",
			},
		},
		["CrystalsongForest"] = {
			[17055670] = {
				["title"] = "Val'kyr Pet",
				["icon"] = 4,
				["desc"] = "",
			},
			[66885062] = {
				["title"] = "Val'kyr Pet",
				["icon"] = 4,
				["desc"] = "",
			},
			[50005912] = {
				["icon"] = 16,
				["title"] = "Nearly Headless Jacob",
				["desc"] = "Pet-Trainer\nUndead, Undead, Undead",
			},
			[43574420] = {
				["title"] = "Val'kyr Pet",
				["icon"] = 4,
				["desc"] = "",
			},
		},
		["BoreanTundra"] = {
			[48170795] = {
				["icon"] = 4,
				["title"] = "Val'kyr Pet",
				["desc"] = "",
			},
			[32565960] = {
				["icon"] = 4,
				["title"] = "Val'kyr Pet",
				["desc"] = "",
			},
			[81214821] = {
				["icon"] = 4,
				["title"] = "Val'kyr Pet",
				["desc"] = "",
			},
		},
		["Hyjal"] = {
			[61323281] = {
				["icon"] = 16,
				["title"] = "Brok",
				["desc"] = "Pet-Trainer\nWildlife, Magic, Critter",
			},
		},
		["Naxxramas"] = {
			[38952870] = {
				["icon"] = 8,
				["level"] = 5,
				["title"] = "Gluth",
				["desc"] = "Pet: Stitched Pup",
			},
			[76271202] = {
				["icon"] = 8,
				["level"] = 5,
				["title"] = "Maexxna",
				["desc"] = "Pet: Giant Bone Spider",
			},
			[81195757] = {
				["title"] = "Loatheb",
				["level"] = 5,
				["icon"] = 8,
				["desc"] = "Pet: Fungal Abomination",
			},
		},
		["TheHiddenPass"] = {
			[64107467] = {
				["title"] = "Schwarzmarkt",
				["cont"] = 1,
				["icon"] = 9,
				["desc"] = "Auktionshaus",
			},
			[74587371] = {
				["icon"] = 4,
				["title"] = "Der Hammer the Torheit",
				["desc"] = "100g 354k ep",
			},
		},
		["ValleyoftheFourWinds"] = {
			[70116312] = {
				["icon"] = 7,
				["title"] = "Galleon (Worldboss)",
				["desc"] = "ReSpawns every 1-3 hours\nKill Check Macro:\n/run for k, v in pairs({ Galleon=32098, Sha=32099, Nalak=32518, Oon=32519, Champ=32641, Key=32626, Barrens=32862}) do print(format(\"%s: %s\", k, IsQuestFlaggedCompleted(v) and \"\\124cff00ff00Yes\" or \"\\124cffff0000No\"))",
			},
			[16347863] = {
				["title"] = "Jonn-Dar",
				["icon"] = 8,
				["desc"] = "Rare Mob\n[Terracotta Fragment]\nTrinket 400 lvl 85 Summons Pet for 10 min.",
			},
			[34174639] = {
				["icon"] = 3,
				["title"] = "Chi-Chi",
				["desc"] = "Blue Feather [Four winds stir fry]",
			},
			[56093396] = {
				["icon"] = 8,
				["title"] = "Sele'na",
				["desc"] = "Rare Mob in Moor",
			},
			[54182874] = {
				["icon"] = 1,
				["title"] = "Sele'na",
				["desc"] = "Rare Mob Spawn2",
			},
			[45894365] = {
				["title"] = "Farmer Nishi",
				["icon"] = 16,
				["desc"] = "Pet-Trainer\nWildlife, Elemental, Elemental",
			},
			[92233890] = {
				["title"] = "Boat-Building Instructions",
				["icon"] = 4,
				["desc"] = "10g Grey Item\nIn the hut\nNo treasure!",
			},
			[29032965] = {
				["title"] = "NPC",
				["icon"] = 3,
				["desc"] = "Sho= Lovely Apple [Eternal Blossom Fish]",
			},
			[41013008] = {
				["title"] = "NPC",
				["icon"] = 3,
				["desc"] = "Fishy Rohrrothe=Jadekatze [Twin Fish Platter]",
			},
			[14213521] = {
				["icon"] = 4,
				["title"] = "Staff of the Hidden Master",
				["desc"] = "= Agi Staff 419 lvl 86\n Hidden within the bamboo trees at (17.4, 36.0) North Western part of Valley of the Four Winds",
			},
			[35712586] = {
				["icon"] = 8,
				["title"] = "Sulik'shor",
				["desc"] = "Rare Mob\nDropt +500 value Item",
			},
			[46133832] = {
				["title"] = "Ancient Pandaren Woodcutter",
				["icon"] = 4,
				["desc"] = "= Grey Item 110g no EP\n Ghostly Pandaren Craftsman\nNPC-Scan: 64191",
			},
			[66545904] = {
				["icon"] = 8,
				["title"] = "Kriegsspäher von Salyis",
				["desc"] = "Rare Mob\nFlussufer richtung Jadewald",
			},
			[77181147] = {
				["title"] = "Schwarzmarkt",
				["icon"] = 9,
				["desc"] = "Auktionshaus",
			},
			[31045623] = {
				["icon"] = 3,
				["title"] = "NPCs",
				["desc"] = "Ella = Jadekatze  [Garnelenklößchen]\nDer alte Hügelpranke = Fethe  [Gesch. Schildkröte]",
			},
			[9594676] = {
				["icon"] = 1,
				["title"] = "Nal'lak the Reißer",
				["desc"] = "",
			},
			[16903710] = {
				["icon"] = 8,
				["title"] = "Bonobos",
				["desc"] = "Rare Mob\nn the Umgebung",
			},
			[54135345] = {
				["icon"] = 3,
				["title"] = "NPCS",
				["desc"] = "Sho = Apfel [Blütenfischfilet]\nJogu = Apfel  [Gebratene Karotten]\nBauer Fung = Sumpflilie [Wildgeflügelbraten]\nGina = Sumpflilie [Verwirbelte Nebelsuppe]\nChi-Chi = Fethe [Pfannengericht Vier-Winde-Art]\nDer alte Hügelpranke = Fethe [Gesch. Schildkröte]\nTina Lehmkrall  = Rubin [Feuergeisterlachs]\nHaohan Lehmkrall = Rubin [G. Tigersteak]",
			},
			[75434703] = {
				["icon"] = 1,
				["title"] = "Kriegsspäher von Salyis",
				["desc"] = "Rare Mob Spawn 2",
			},
			[43223853] = {
				["title"] = "Truhe mit geklauten Waren",
				["icon"] = 4,
				["desc"] = "Random lvl 86 BoP Hals\nGoldene Box in the Höhle\n",
			},
			[47282436] = {
				["icon"] = 4,
				["title"] = "Uralter pandarischer Angelglücksbringer",
				["desc"] = "= zusatz Fische bein Angeln\nGeisterhafter Pandarenfischer Ansprechen\nNPC-Scan: 64004",
			},
			[35836823] = {
				["title"] = "Brauerei Sturmbräu",
				["icon"] = 28,
				["desc"] = "InstanzEntrance (85-87 / 90 Heroic)",
			},
			[61545788] = {
				["title"] = "Scheitheei CD",
				["icon"] = 2,
				["desc"] = "",
			},
			[55274826] = {
				["title"] = "Dailys",
				["icon"] = 6,
				["desc"] = "Kochdailys\nZiegen Mounts!",
			},
			[88141803] = {
				["icon"] = 8,
				["title"] = "Nasra Spothide",
				["desc"] = "Rare Mob\nPanda",
			},
			[48103468] = {
				["title"] = "NPC",
				["icon"] = 3,
				["desc"] = "Bauer Fung = Sumpflilie [Wildgeflügelbraten]",
			},
			[23692912] = {
				["icon"] = 4,
				["title"] = "Treasuretruhe the Shed-Ling",
				["desc"] = "486k EP 98g\nIn the cave\nReichtum",
			},
			[10115382] = {
				["icon"] = 8,
				["title"] = "Nal'lak the Reißer",
				["desc"] = "Rare Mob\nFlieg halbkreis am Tor",
			},
			[69790556] = {
				["title"] = "Terrasse des endlosen Frühlings",
				["icon"] = 28,
				["desc"] = "Entrance 10er/25er Raid",
			},
			[19064253] = {
				["title"] = "Staff des verborgenen Meisters",
				["icon"] = 4,
				["desc"] = "...auch hier",
			},
			[8026113] = {
				["icon"] = 1,
				["title"] = "Nal'lak the Reißer",
				["desc"] = "",
			},
			[35715748] = {
				["icon"] = 8,
				["title"] = "Schwarzhuf",
				["desc"] = "Schlachthorn item (pullt alles in 40m range)\nRare Mob",
			},
			[36306366] = {
				["title"] = "Schwarzhuf",
				["icon"] = 1,
				["desc"] = "Rare Mob Spawn2",
			},
			[44823439] = {
				["title"] = "NPCs ",
				["icon"] = 3,
				["desc"] = "Haohan Lehmkrall = Rubinsplitter [G. Tigersteak]\nTina Lehmkrall = Rubinsplitter [Feuergeisterlachs]",
			},
		},
		["IsleoftheThuntheKing"] = {
			[52238939] = {
				["icon"] = 9,
				["title"] = "Treasuretruhe des Donnerkönigs",
				["desc"] = "51.5, 89.6",
			},
			[52927710] = {
				["title"] = "Treasuretruhe des Donnerkönigs",
				["icon"] = 9,
				["desc"] = "52.9, 77.2",
			},
			[48458931] = {
				["icon"] = 8,
				["title"] = "Durchgebranntes Konstrukt the Sonnenhäscher",
				["desc"] = "Rare Mob\nNPC-Scan: 50358",
			},
			[48178253] = {
				["title"] = "Treasuretruhe des Donnerkönigs",
				["icon"] = 9,
				["desc"] = "47.9, 82.1",
			},
			[33636176] = {
				["icon"] = 9,
				["title"] = "Treasuretruhe des Donnerkönigs",
				["desc"] = "33.6, 60.4",
			},
			[35304723] = {
				["title"] = "Treasuretruhe des Donnerkönigs",
				["icon"] = 9,
				["desc"] = "35.3, 47,7",
			},
			[43506744] = {
				["icon"] = 9,
				["title"] = "Treasuretruhe des Donnerkönigs",
				["desc"] = "44.3, 67.5",
			},
			[28918093] = {
				["icon"] = 9,
				["title"] = "Treasuretruhe des Donnerkönigs",
				["desc"] = "28.9, 80.8",
			},
			[41007478] = {
				["icon"] = 9,
				["title"] = "Treasuretruhe des Donnerkönigs",
				["desc"] = "40.8, 74.7",
			},
			[56178452] = {
				["icon"] = 1,
				["title"] = "Durchgebranntes Konstrukt the Sonnenhäscher",
				["desc"] = "Rare Mob spawn 2\nNPC-Scan: 50358",
			},
			[53938286] = {
				["icon"] = 9,
				["title"] = "Treasuretruhe des Donnerkönigs",
				["desc"] = "53.8, 82.8",
			},
			[37166808] = {
				["title"] = "Treasuretruhe des Donnerkönigs",
				["icon"] = 9,
				["desc"] = "37.0, 68.1",
			},
			[50292514] = {
				["title"] = "Rückenbrecher Uru",
				["icon"] = 8,
				["desc"] = "Rare Mob (Phase 4)\nNPCScan: 70001",
			},
			[39818207] = {
				["title"] = "Ra'sha",
				["icon"] = 8,
				["desc"] = "Rare Mob\nNPCScan: 70530\nDropt Selbstmord Dolch",
			},
			[54415354] = {
				["icon"] = 9,
				["title"] = "Treasuretruhe des Donnerkönigs",
				["desc"] = "54.1, 53.6",
			},
			[61835015] = {
				["title"] = "Gottkoloss Ramuk",
				["icon"] = 8,
				["desc"] = "Rare Mob (Phase 3)\nNPCScan: 69999",
			},
			[61083876] = {
				["title"] = "Molthor",
				["icon"] = 8,
				["desc"] = "Rare Mob (Phase 4)\nNPCScan: 70003 ",
			},
			[44248276] = {
				["title"] = "Treasuretruhe des Donnerkönigs",
				["icon"] = 9,
				["desc"] = "43.8, 82.8",
			},
			[50967126] = {
				["icon"] = 8,
				["title"] = "Progenitus",
				["desc"] = "Rare Mob\nNPC-Scan: 69997",
			},
			[45315083] = {
				["title"] = "Treasuretruhe des Donnerkönigs",
				["icon"] = 9,
				["desc"] = "45.2, 50.7",
			},
			[33395770] = {
				["icon"] = 9,
				["title"] = "Treasuretruhe des Donnerkönigs",
				["desc"] = "33.4, 57.5",
			},
			[50314676] = {
				["icon"] = 10,
				["title"] = "Hänthe for Punkte",
				["desc"] = "& Entrance zu 10er/25er Thron des Donners",
			},
			[47447239] = {
				["title"] = "Treasuretruhe des Donnerkönigs",
				["icon"] = 9,
				["desc"] = "47.4, 72.4",
			},
			[33077103] = {
				["icon"] = 9,
				["title"] = "Treasuretruhe des Donnerkönigs",
				["desc"] = "33.6, 71.7",
			},
			[35236168] = {
				["icon"] = 8,
				["title"] = "Mumta",
				["desc"] = "Rare Mob\nNPCScan: 69664",
			},
			[53345394] = {
				["icon"] = 8,
				["title"] = "Goda",
				["desc"] = "Rare Mob\nNPCScan: 69998",
			},
			[54133507] = {
				["title"] = "Lu-Ban",
				["icon"] = 8,
				["desc"] = "Rare Mob (Phase 4)\nNPCScan: 70002",
			},
			[38877702] = {
				["icon"] = 9,
				["title"] = "Treasuretruhe des Donnerkönigs",
				["desc"] = "39.1, 76.8",
			},
			[46545722] = {
				["icon"] = 9,
				["title"] = "Treasuretruhe des Donnerkönigs",
				["desc"] = "46.3, 57.5",
			},
			[43367820] = {
				["title"] = "Treasuretruhe des Donnerkönigs",
				["icon"] = 9,
				["desc"] = "43.5, 78.6",
			},
			[51437494] = {
				["icon"] = 9,
				["title"] = "Treasuretruhe des Donnerkönigs",
				["desc"] = "51.5, 74.0",
			},
			[37228196] = {
				["icon"] = 8,
				["title"] = "Ku'lai Die Hinmelsklaue",
				["desc"] = "Rare Mob\nNPCScan: 69996",
			},
			[44145602] = {
				["title"] = "Treasuretruhe des Donnerkönigs",
				["icon"] = 9,
				["desc"] = "",
			},
			[35466400] = {
				["icon"] = 9,
				["title"] = "Treasuretruhe des Donnerkönigs",
				["desc"] = "35.6. 63.7",
			},
			[46806153] = {
				["icon"] = 9,
				["title"] = "Treasuretruhe des Donnerkönigs",
				["desc"] = "46.6, 61.6",
			},
			[33607630] = {
				["icon"] = 9,
				["title"] = "Treasuretruhe des Donnerkönigs",
				["desc"] = "33.4, 76.3",
			},
			[38765961] = {
				["icon"] = 9,
				["title"] = "Treasuretruhe des Donnerkönigs",
				["desc"] = "37.9, 61.0 / 38.7, 59.6 / 36.9, 60.7 / 36.1, 58.5",
			},
			[44543008] = {
				["icon"] = 8,
				["title"] = "Al'tabin the Allsehende",
				["desc"] = "Rare Mob\nNPCScan: 52689",
			},
		},
		["ZulDrak"] = {
			[23796424] = {
				["title"] = "Val'kyr Pet",
				["icon"] = 4,
				["desc"] = "",
			},
			[13116681] = {
				["title"] = "Darmwürger",
				["icon"] = 16,
				["desc"] = "Pet-Trainer\nWildlife, Critter, Wildlife",
			},
			[58013938] = {
				["title"] = "Val'kyr Pet",
				["icon"] = 4,
				["desc"] = "",
			},
			[74912238] = {
				["title"] = "Val'kyr Pet",
				["icon"] = 4,
				["desc"] = "",
			},
		},
		["BlackwingLair"] = {
			[41626086] = {
				["title"] = "Boss",
				["level"] = 1,
				["icon"] = 8,
				["desc"] = "",
			},
			[39277216] = {
				["title"] = "Chromaggus",
				["level"] = 4,
				["icon"] = 8,
				["desc"] = "Pet: Chrominius",
			},
			[50186188] = {
				["icon"] = 8,
				["level"] = 3,
				["title"] = "Broodlord Lashlayer",
				["desc"] = "",
			},
		},
		["Durotar"] = {
			[48944027] = {
				["icon"] = 10,
				["title"] = "Ravika (Hänthe)",
				["desc"] = "Pet: [Gahz'rooki]",
			},
		},
		["TownlongWastes"] = {
			[32786216] = {
				["title"] = "Fragment des Schreckens",
				["icon"] = 4,
				["desc"] = "90g Grey Item 431k XP\nIn the cave 48.49, 89.46\nCounts as treasure",
			},
			[57475831] = {
				["title"] = "Erstarrtes Harz von Kri'vess",
				["icon"] = 4,
				["desc"] = "110g Grey Item 420k XP\nSpawns: 52,60 53,58 53,61 56,55 57,41\nCounts as treasure",
			},
			[61753463] = {
				["icon"] = 8,
				["title"] = "Kah'tir",
				["desc"] = "Rare Mob",
			},
			[32586087] = {
				["title"] = "Yul Wildpfote",
				["icon"] = 8,
				["desc"] = "Böser Panda Rar",
			},
			[66724781] = {
				["icon"] = 8,
				["title"] = "Lon the Bulle",
				["desc"] = "Rare Mob",
			},
			[66727393] = {
				["icon"] = 8,
				["title"] = "Der Jauler",
				["desc"] = "Rare Mob\nAffe",
			},
			[46697420] = {
				["icon"] = 8,
				["title"] = "Lith'ik the Pirscher",
				["desc"] = "Rare Mob\nHeuschrecke",
			},
			[36215219] = {
				["title"] = "Sucher Zusshi",
				["icon"] = 16,
				["desc"] = "Critter, Aquatik, Elemental",
			},
			[67564790] = {
				["title"] = "Feuerträger the Yaungol",
				["icon"] = 4,
				["desc"] = "= 1h Strength Streitkolben 450 lvl 86\nKleine Fackel die in einer Schale rumliegt",
			},
			[69029007] = {
				["title"] = "Eshelon",
				["icon"] = 1,
				["desc"] = "Rare Mob Spawn 2",
			},
			[62773393] = {
				["title"] = "Zurückgelassene WarenBox",
				["icon"] = 4,
				["desc"] = "Box enhält ca. 103g\nin Zelt bei 62.82 34.05\nCounts as treasure",
			},
			[58708543] = {
				["title"] = "Siltriss the Schärfer",
				["icon"] = 8,
				["desc"] = "Rare Mob",
			},
			[36958540] = {
				["cont"] = 1,
				["icon"] = 8,
				["title"] = "Zandalari Warbringer & Warscout",
				["desc"] = "5.2 Rare Mob - Dropt Mount\nJade, Slate, Amber, or Golden Prinordial Direhorn\nNPC-Scan id: 69769 & 69768",
			},
			[56914229] = {
				["cont"] = 1,
				["icon"] = 16,
				["title"] = "Brennenthe Pandarengeist",
				["desc"] = "Pet-Trainer\nElemental, Drachkin, Flying",
			},
			[28772436] = {
				["icon"] = 28,
				["title"] = "Portal",
				["desc"] = "Prequest um sich zur Insel zu Porten\n(Wichtig for Dailys Shado-Pan)",
			},
			[67134449] = {
				["title"] = "Feuerträger the Yaungol",
				["icon"] = 4,
				["desc"] = "= 1h Strength Streitkolben 450 lvl 86\nKleine Fackel die in einer Schale rumliegt",
			},
			[63238857] = {
				["title"] = "Eshelon",
				["icon"] = 8,
				["desc"] = "Rare Mob",
			},
			[53276409] = {
				["title"] = "Norlaxx",
				["icon"] = 8,
				["desc"] = "Rare Mob",
			},
			[46008889] = {
				["icon"] = 1,
				["title"] = "Lith'ik the Pirscher",
				["desc"] = "Spawn 2",
			},
			[50527291] = {
				["icon"] = 28,
				["title"] = "Portal zur Insel des Donners",
				["desc"] = "",
			},
			[35258276] = {
				["title"] = "Belagerung des Niuzaotempels",
				["icon"] = 28,
				["desc"] = "InstanzEntrance (90 Heroic)",
			},
			[51707157] = {
				["icon"] = 6,
				["title"] = "Dailys Shado-Pan",
				["desc"] = "Ab Lotus Respektvoll\n\nHänthe for Punkte",
			},
			[52675574] = {
				["title"] = "Erstarrtes Harz von Kri'vess",
				["icon"] = 4,
				["desc"] = "110g Grey Item 420k XP\nSpawns: 52,60 53,58 53,61 56,55 57,41\nCounts as treasure",
			},
			[65878654] = {
				["icon"] = 4,
				["title"] = "In Bern eingeschlossene Moth",
				["desc"] = "105g Grey Item 451k XP\nCounts as treasure!",
			},
		},
		["TimelessIsle"] = {
			[60548740] = {
				["icon"] = 8,
				["title"] = "Rattleskew",
				["desc"] = "Rare Mob\nDrops Trinket [Captain Zvezdans lost leg]\nID: 72048",
			},
			[29463232] = {
				["icon"] = 9,
				["title"] = "Moss-Covered Chest",
				["desc"] = "39 Coins + Epic",
			},
			[50634404] = {
				["icon"] = 9,
				["title"] = "Box",
				["desc"] = "",
			},
			[39798243] = {
				["title"] = "Gu'chi the Swarmbringer 3",
				["icon"] = 8,
				["desc"] = "Rare Mob",
			},
			[27273882] = {
				["icon"] = 9,
				["title"] = "Moss-Covered Chest",
				["desc"] = "",
			},
			[43322726] = {
				["icon"] = 8,
				["title"] = "Urdur the Cauterizer",
				["desc"] = "Rare Mob",
			},
			[39047938] = {
				["title"] = "Moss-Covered Chest",
				["icon"] = 9,
				["desc"] = "In the building\n17 Coins",
			},
			[18835805] = {
				["title"] = "Monstrous Spineclaw 4",
				["icon"] = 4,
				["desc"] = "Rare Mob",
			},
			[52827023] = {
				["icon"] = 9,
				["title"] = "Moss-Covered Chest",
				["desc"] = "286 Coins",
			},
			[27753426] = {
				["icon"] = 9,
				["title"] = "Solid Chest",
				["desc"] = "Accessible by Albatros\n89 Coins",
			},
			[71597900] = {
				["icon"] = 9,
				["title"] = "Bag (Weekly)",
				["desc"] = "41 Coins 11 Amulet",
			},
			[33385436] = {
				["title"] = "Cloudstrike Family Helm 18",
				["icon"] = 20,
				["desc"] = "",
			},
			[55197281] = {
				["title"] = "Cloudstrike Family Helm 14",
				["icon"] = 20,
				["desc"] = "",
			},
			[69133200] = {
				["icon"] = 9,
				["title"] = "Smoldering Chest",
				["desc"] = "",
			},
			[60436703] = {
				["icon"] = 9,
				["title"] = "Moss-Covered Chest",
				["desc"] = "",
			},
			[50164602] = {
				["icon"] = 8,
				["title"] = "Imperial Python 6",
				["desc"] = "",
			},
			[52303319] = {
				["icon"] = 8,
				["title"] = "Archiereus Of Flame 2",
				["desc"] = "Rare Mob",
			},
			[45618622] = {
				["title"] = "Zesqua",
				["icon"] = 8,
				["desc"] = "Rare Mob\nDrops 1% Rain Stone (Funitem)\nID: 72245",
			},
			[47388099] = {
				["icon"] = 20,
				["title"] = "Cloudstrike Family Helm 4",
				["desc"] = "",
			},
			[43963960] = {
				["icon"] = 8,
				["title"] = "Jadefire Spirit",
				["desc"] = "Rare Mob\nIn the cave",
			},
			[26112806] = {
				["icon"] = 8,
				["title"] = "Dread Ship Vazuvius",
				["desc"] = "Evermaw drop [Mist-Filled Spirit Lantern] to summon.\nDropt: [Rime of the Time-Lost Mariner] (Funitem)\nID: 73281",
			},
			[65354923] = {
				["title"] = "Daily",
				["icon"] = 6,
				["desc"] = "Answer Question = 100 Coins",
			},
			[65167627] = {
				["icon"] = 9,
				["title"] = "Moss-Covered Chest",
				["desc"] = "364 Coins",
			},
			[22365869] = {
				["icon"] = 9,
				["title"] = "Blackguard's Jetsam",
				["desc"] = "In the Cave\n215 Coins 9 Amulet + Epic",
			},
			[35138381] = {
				["icon"] = 9,
				["title"] = "Moss-Covered Chest",
				["desc"] = "Underwater\n26 Coins",
			},
			[49676505] = {
				["icon"] = 9,
				["title"] = "Moss-Covered Chest",
				["desc"] = "328 Coins + Epic",
			},
			[52848195] = {
				["icon"] = 8,
				["title"] = "Jakur of Ordon",
				["desc"] = "Rare Mob",
			},
			[70374554] = {
				["icon"] = 8,
				["title"] = "Champion of the Black Flame 2",
				["desc"] = "Rare Mob",
			},
			[62356350] = {
				["title"] = "Golganarr",
				["icon"] = 8,
				["desc"] = "Drops: Ore and [Odd Polished Stone] (Funitem)",
			},
			[40012613] = {
				["icon"] = 8,
				["title"] = "Flintlord Gairan 1",
				["desc"] = "Rare Mob",
			},
			[65504772] = {
				["icon"] = 9,
				["title"] = "Box",
				["desc"] = "",
			},
			[54014249] = {
				["icon"] = 8,
				["title"] = "Tsavo'ka <Ghost in the Darkness>",
				["desc"] = "Rare Mob\nIn the cave\nDrops Thick Tiger Haunch",
			},
			[61548798] = {
				["icon"] = 9,
				["title"] = "Moss-Covered Chest",
				["desc"] = "28 Coins",
			},
			[48775115] = {
				["title"] = "Cloudstrike Family Helm 17",
				["icon"] = 20,
				["desc"] = "",
			},
			[63104554] = {
				["icon"] = 20,
				["title"] = "Cloudstrike Family Helm 6",
				["desc"] = "",
			},
			[24543874] = {
				["icon"] = 9,
				["title"] = "Moss-Covered Chest",
				["desc"] = "in tree trunk\n18 Coins + Epic",
			},
			[42895645] = {
				["title"] = "Cloudstrike Family Helm 19",
				["icon"] = 20,
				["desc"] = "",
			},
			[25145228] = {
				["icon"] = 9,
				["title"] = "Moss-Covered Chest",
				["desc"] = "25 Coins + Epic",
			},
			[23655821] = {
				["icon"] = 3,
				["title"] = "Spectral Pirate",
				["desc"] = "Rare Mob\nID: 71987",
			},
			[53844740] = {
				["title"] = "Rope-Bound Treasure Chest (Weekly)",
				["icon"] = 1,
				["desc"] = "On a pillar\nFirst loot Gleaming Treasure Chest to make this chest visible!",
			},
			[46893217] = {
				["icon"] = 9,
				["title"] = "Box",
				["desc"] = "",
			},
			[59513104] = {
				["icon"] = 9,
				["title"] = "Moss-Covered Chest",
				["desc"] = "329 Coins",
			},
			[44433201] = {
				["icon"] = 8,
				["title"] = "Rock Moss",
				["desc"] = "Rare Mob\nin the cave\nDrops [Golden Moss]",
			},
			[64116938] = {
				["icon"] = 9,
				["title"] = "Solid Chest",
				["desc"] = "Coins + Epic",
			},
			[43756591] = {
				["title"] = "Moss-Covered Chest",
				["icon"] = 9,
				["desc"] = "in tree trunk\n330 Coins",
			},
			[66535837] = {
				["icon"] = 8,
				["title"] = "Champion of the Black Flame 1",
				["desc"] = "He runs along here\nDrops:  [Blackflame Daggers] (Funitem)\nand [Big Bag of Herbs]\nID: 73171",
			},
			[64215879] = {
				["icon"] = 9,
				["title"] = "Moss-Covered Chest",
				["desc"] = "304 Coins",
			},
			[28576382] = {
				["icon"] = 8,
				["title"] = "Imperial Python 2",
				["desc"] = "",
			},
			[44933672] = {
				["title"] = "Zarhym",
				["icon"] = 28,
				["desc"] = "In the Cave",
			},
			[34347634] = {
				["title"] = "Moss-Covered Chest",
				["icon"] = 9,
				["desc"] = "In the house\n25 Coins + Epic",
			},
			[53957900] = {
				["icon"] = 9,
				["title"] = "Smoldering Chest",
				["desc"] = "142 coins Epic belt + Epic Trinket",
			},
			[26042623] = {
				["icon"] = 9,
				["title"] = "Moss-Covered Chest",
				["desc"] = "41 Coins + Epic",
			},
			[46212084] = {
				["title"] = "Ordos",
				["icon"] = 7,
				["desc"] = "Wordboss",
			},
			[58614073] = {
				["title"] = "Master Kukuru <Collector>",
				["icon"] = 10,
				["desc"] = "Sells [Kukuru's Cache Key]\nfor 500 Coins",
			},
			[53306248] = {
				["icon"] = 9,
				["title"] = "Moss-Covered Chest",
				["desc"] = "250 Coins + Epic",
			},
			[21292276] = {
				["icon"] = 8,
				["title"] = "Evermaw",
				["desc"] = "Rare Mob\nCircles Island clockwise",
			},
			[47215382] = {
				["icon"] = 9,
				["title"] = "Moss-Covered Chest",
				["desc"] = "302 Coins Epic Cloak",
			},
			[57166120] = {
				["icon"] = 1,
				["title"] = "Mist-Covered Treasure Chest (Weekly)",
				["desc"] = " Gleaming Crane Statue, click then fly",
			},
			[27394570] = {
				["icon"] = 8,
				["title"] = "Imperial Python 1",
				["desc"] = "",
			},
			[26896874] = {
				["icon"] = 9,
				["title"] = "Moss-Covered Chest",
				["desc"] = "18 Coins",
			},
			[55195035] = {
				["icon"] = 20,
				["title"] = "Cloudstrike Family Helm 8",
				["desc"] = "",
			},
			[49746960] = {
				["icon"] = 1,
				["title"] = "Gleaming Treasure Chest (Weekly)",
				["desc"] = "82 Coins 14 Amulet\nOn the pillar",
			},
			[59084933] = {
				["icon"] = 9,
				["title"] = "Box",
				["desc"] = "",
			},
			[39373752] = {
				["title"] = "Ironfur Steelhorn 3",
				["icon"] = 8,
				["desc"] = "Rare Mob",
			},
			[65602351] = {
				["icon"] = 6,
				["title"] = "4 Notice",
				["desc"] = "Here deliver top",
			},
			[45577265] = {
				["title"] = "Scary Sprite",
				["icon"] = 3,
				["desc"] = "Rare Mob:\nClick on Neverending Spritewood (Pink crystal) and kill 50 Nice/Angry Sprites to summon Scary Sprites\nDrops Pet: Dandelion Frolicker",
			},
			[43328452] = {
				["icon"] = 9,
				["title"] = "Moss-Covered Chest",
				["desc"] = "39 Coins + Epic",
			},
			[58834811] = {
				["icon"] = 8,
				["title"] = "Spelurk",
				["desc"] = "Rare Mob\nIn the cave",
			},
			[34238468] = {
				["icon"] = 8,
				["title"] = "Karkanos <The Gushing Maw>",
				["desc"] = "Rare Mob\nID: 72193",
			},
			[38086960] = {
				["title"] = "Gu'chi the Swarmbringer 1",
				["icon"] = 8,
				["desc"] = "Rare Mob\nDrops 2% Pet: [Swarmling of Gu'chi]",
			},
			[21836799] = {
				["title"] = "Moss-Covered Chest",
				["icon"] = 9,
				["desc"] = "25 Coins",
			},
			[58445013] = {
				["icon"] = 9,
				["title"] = "Box",
				["desc"] = "",
			},
			[28994442] = {
				["title"] = "Ironfur Steelhorn 2",
				["icon"] = 8,
				["desc"] = "Rare Mob",
			},
			[42796014] = {
				["title"] = "Whizzig <Merchant of Time>",
				["icon"] = 10,
				["desc"] = "can spawn anywhere in the yard",
			},
			[51386232] = {
				["icon"] = 2,
				["title"] = "Cloudstrike Family Helm 9",
				["desc"] = "",
			},
			[23755404] = {
				["icon"] = 8,
				["title"] = "Great Turtle Furyshell 2",
				["desc"] = "Rare Mob",
			},
			[75404458] = {
				["icon"] = 11,
				["title"] = "Speaker Gulan <Emissary of Ordos>",
				["desc"] = "Vendor for [Bloody Coin]\nfor 1k Coins: [Censer of Eternal Agony]",
			},
			[39049205] = {
				["title"] = "Cursed Hozen Swabby",
				["icon"] = 3,
				["desc"] = "Rare Mob\nDrops 9%: [Barnacle Encrusted Key]\need one for [Cursed Swabby Helmet] \nID: 71920",
			},
			[54555404] = {
				["icon"] = 8,
				["title"] = "Cinderfall",
				["desc"] = "Rare Mob",
			},
			[64497249] = {
				["icon"] = 20,
				["title"] = "Cloudstrike Family Helm 5",
				["desc"] = "",
			},
			[44287024] = {
				["title"] = "Cranegnasher",
				["icon"] = 8,
				["desc"] = "Dropt: [Pristine Stalker Hide]\nID: 104268",
			},
			[24827265] = {
				["title"] = "Monstrous Spineclaw 3",
				["icon"] = 4,
				["desc"] = "Rare Mob",
			},
			[33063271] = {
				["icon"] = 20,
				["title"] = "Cloudstrike Family Helm 1",
				["desc"] = "10 Min Buff\nfor achievement [Legend of the Past]\nbreak into the Mysterious Den, where Spelurk resides along with one of the Sturdy Chests.",
			},
			[32066192] = {
				["icon"] = 20,
				["title"] = "Cloudstrike Family Helm 2",
				["desc"] = "",
			},
			[53805789] = {
				["icon"] = 8,
				["title"] = "Imperial Python 5",
				["desc"] = "",
			},
			[57975853] = {
				["icon"] = 8,
				["title"] = "Champion of the Black Flame 3",
				["desc"] = "Rare Mob",
			},
			[69995847] = {
				["icon"] = 8,
				["title"] = "Huolon",
				["desc"] = "Rare Mob\nDropt 1% [Reins of the Thundering Onyx Cloud Serpent]",
			},
			[34777313] = {
				["icon"] = 8,
				["title"] = "Imperial Python 3",
				["desc"] = "",
			},
			[36914714] = {
				["icon"] = 14,
				["title"] = "mailbox",
				["desc"] = "",
			},
			[65465276] = {
				["title"] = "Cloudstrike Family Helm 16",
				["icon"] = 20,
				["desc"] = "",
			},
			[29636880] = {
				["title"] = "Ironfur Steelhorn 1",
				["icon"] = 8,
				["desc"] = "Rare Mob\nSpawns everywhere left on the map\nID: 73160",
			},
			[21874885] = {
				["icon"] = 9,
				["title"] = "Moss-Covered Chest",
				["desc"] = "24 Coins",
			},
			[40978949] = {
				["title"] = "Monstrous Spineclaw 2",
				["icon"] = 4,
				["desc"] = "Rare Mob",
			},
			[44826559] = {
				["icon"] = 8,
				["title"] = "Imperial Python 4",
				["desc"] = "",
			},
			[64212671] = {
				["icon"] = 8,
				["title"] = "Garnia",
				["desc"] = "Rare Mob\nDrops Pet 4%: [Ruby Droplet]\nID: 73282",
			},
			[22263014] = {
				["title"] = "Monstrous Spineclaw 5",
				["icon"] = 4,
				["desc"] = "Rare Mob",
			},
			[18095661] = {
				["icon"] = 9,
				["title"] = "Cave Entrance",
				["desc"] = "Underwater",
			},
			[66957810] = {
				["title"] = "Monstrous Spineclaw 1",
				["icon"] = 4,
				["desc"] = "Rare Mob\nDrops Pet 2%: [Spineclaw Crab]\nID: 73166",
			},
			[30927392] = {
				["icon"] = 8,
				["title"] = "Gu'chi the Swarmbringer 4",
				["desc"] = "",
			},
			[34665981] = {
				["title"] = "The Celestial Tournament",
				["icon"] = 16,
				["desc"] = "",
			},
			[71238083] = {
				["icon"] = 3,
				["title"] = "Stinkbraid <Southsea Captain>",
				["desc"] = "Rare Mob\nID: 73704",
			},
			[34553303] = {
				["icon"] = 8,
				["title"] = "Archiereus Of Flame 1",
				["desc"] = "Rare Mob\nDrops 5% Elixir of Ancient Knowledge =\n300% XP Buff 1h - Acc Bound",
			},
			[23116767] = {
				["icon"] = 8,
				["title"] = "Great Turtle Furyshell 3",
				["desc"] = "Rare Mob",
			},
			[44612918] = {
				["title"] = "High Priest of Ordos",
				["icon"] = 7,
				["desc"] = "Dropt: [Ash-Covered Horn] (Trinket Mount)",
			},
			[33805484] = {
				["icon"] = 6,
				["title"] = "3 Notice (Treasure)",
				["desc"] = "[Rolo's Riddle]\nAs you reach the Ruby Lake at 64.5 - 27.5 (the reddish tarn on the map) begin to attack your Albatross again. The bird will dive and releases you as you kill it. Swim out of the red pool and go up to the tree. You'll find the final treasure right there. Handing in the quest will earn you this achievement.",
			},
			[41516366] = {
				["icon"] = 21,
				["title"] = "Master chef",
				["desc"] = "for [Meaty Crane Leg]\n",
			},
			[41617473] = {
				["title"] = "Gu'chi the Swarmbringer 2",
				["icon"] = 8,
				["desc"] = "Rare Mob",
			},
			[63327313] = {
				["icon"] = 8,
				["title"] = "Bufo",
				["desc"] = "Rare Mob\nDrops Pet 4%: [Gulp Froglet]\nID: 72775",
			},
			[37557810] = {
				["title"] = "Zhu-Gon the Sour",
				["icon"] = 8,
				["desc"] = "Rare Mob\nDrops Pet: [Skunky Alemental]\nID: 71919",
			},
			[46642854] = {
				["title"] = "Smoldering Chest",
				["icon"] = 9,
				["desc"] = "",
			},
			[42365516] = {
				["title"] = "Daily",
				["icon"] = 6,
				["desc"] = "Kill 20 Elites",
			},
			[49316848] = {
				["icon"] = 6,
				["title"] = "1 Notice (Treasure)",
				["desc"] = "[Rolo's Riddle]\nQuest for the Stone",
			},
			[55554435] = {
				["icon"] = 9,
				["title"] = "Box",
				["desc"] = "",
			},
			[25724612] = {
				["icon"] = 9,
				["title"] = "Moss-Covered Chest",
				["desc"] = "20 Coins",
			},
			[21614538] = {
				["icon"] = 8,
				["title"] = "Great Turtle Furyshell 1",
				["desc"] = "Rare Mob\nNPCScan ID: 73161\n",
			},
			[34666141] = {
				["title"] = "Little Tommy Newcomer",
				["icon"] = 16,
				["desc"] = "Lil' Oondasta (Wildlife)",
			},
			[49423816] = {
				["icon"] = 8,
				["title"] = "Flintlord Gairan 2",
				["desc"] = "Rare Mob",
			},
			[25577185] = {
				["title"] = "Cloudstrike Family Helm 12",
				["icon"] = 20,
				["desc"] = "",
			},
			[34592639] = {
				["icon"] = 6,
				["title"] = "2 Notice (Treasure)",
				["desc"] = "[Rolo's Riddle]\nQuest In the mounds",
			},
			[26003656] = {
				["title"] = "Chelon",
				["icon"] = 8,
				["desc"] = "Rare Mob\nDrops [Hardened Shell]\nID: 72045",
			},
			[30493560] = {
				["icon"] = 9,
				["title"] = "Moss-Covered Chest",
				["desc"] = "26 Coins + Epic",
			},
			[57227778] = {
				["icon"] = 8,
				["title"] = "Watcher Osu",
				["desc"] = "Rare Mob",
			},
			[68246046] = {
				["icon"] = 20,
				["title"] = "Cloudstrike Family Helm 15",
				["desc"] = "",
			},
			[50167313] = {
				["title"] = "Cloudstrike Family Helm 13",
				["icon"] = 20,
				["desc"] = "",
			},
			[22893865] = {
				["title"] = "Cloudstrike Family Helm 11",
				["icon"] = 20,
				["desc"] = "",
			},
			[55735933] = {
				["icon"] = 2,
				["title"] = "Cloudstrike Family Helm 7",
				["desc"] = "",
			},
			[39267778] = {
				["icon"] = 20,
				["title"] = "Cloudstrike Family Helm 3",
				["desc"] = "",
			},
			[37234185] = {
				["icon"] = 20,
				["title"] = "Cloudstrike Family Helm 10",
				["desc"] = "",
			},
			[46884692] = {
				["icon"] = 9,
				["title"] = "Moss-Covered Chest",
				["desc"] = "326 Coins",
			},
			[66204378] = {
				["icon"] = 8,
				["title"] = "Leafmender",
				["desc"] = "Rare Mob\nDropt Pet 3%: Ashleaf Spriteling\nID: 73277",
			},
			[25936505] = {
				["icon"] = 9,
				["title"] = "Solid Chest",
				["desc"] = "Solid Chest Accessible by Albatros\n95 Coins + Epic",
			},
		},
		["TheJadeForest"] = {
			[56797184] = {
				["title"] = "Urobi the Wantheer",
				["icon"] = 8,
				["desc"] = "Rare Mob\n14% Epic Agi Staff 420 lvl 85 BoP",
			},
			[38954684] = {
				["icon"] = 4,
				["title"] = "Jadedurchdrungene Klinge",
				["desc"] = "1h Strength Schwert 404 lvl 85\nJadestatur mit Schwert in the Hand ansprechen 39.26 46.65",
			},
			[54004546] = {
				["icon"] = 8,
				["title"] = "Ferdinand",
				["desc"] = "Rare Mob\nmöglicher Epic Drop",
			},
			[23363522] = {
				["title"] = "Pandarischer Ritualstein",
				["icon"] = 4,
				["desc"] = "105g Grey Item + 153k XP",
			},
			[38506348] = {
				["title"] = "Krax'ik",
				["icon"] = 8,
				["desc"] = "Rare Mob\n15% Epic 1h Agi Axt 420 lvl 85 BoP",
			},
			[31792824] = {
				["title"] = "Pandarische Glücksmünze",
				["icon"] = 4,
				["desc"] = "95g Grey Item 190k XP\nin Brunnen bei 31.9, 27.8\n",
			},
			[46108061] = {
				["title"] = "Opfergabe des Erinnerns",
				["icon"] = 4,
				["desc"] = "Contains 30g + 95k XP\nLiegt auf dem Schrein 46.3, 80.7\nNo treasure!",
			},
			[33975068] = {
				["title"] = "Aethis",
				["icon"] = 8,
				["desc"] = "Rare Mob\n15% Epic 1h Will Kolben 420 lvl 85 BoP",
			},
			[41461620] = {
				["title"] = "Morgrinn Bersthauer",
				["icon"] = 8,
				["desc"] = "Rare Mob\n3 Spawnpunkte in the umgebung\n15% Epic 2h Strength Streitkolben 420 lvl 85",
			},
			[51279905] = {
				["title"] = "Schiffstruhe",
				["icon"] = 4,
				["desc"] = "Contains 96g \nUnderwater in Schiff 51.2, 100.0\nCounts as treasure!",
			},
			[55223240] = {
				["title"] = "Martar the Nicht-sehr-Kluge",
				["icon"] = 8,
				["desc"] = "Rare Mob\n32% Trinket: Beschwört 10min Hogger Pet",
			},
			[43807542] = {
				["title"] = "Kor'nas Nachtgrauen",
				["icon"] = 8,
				["desc"] = "Rare Mob\n14% Epic Int/Hit Staff 420 lvl 85 BoP",
			},
			[47865410] = {
				["title"] = "Hyuna von den Schreinen",
				["icon"] = 16,
				["desc"] = "Pet-Trainer\nWildlife, Flying, Aquatic",
			},
			[64287446] = {
				["title"] = "Sarnak",
				["icon"] = 8,
				["desc"] = "Rare Mob\nIn einer Höhle\nEpic Agi Armbrust 420 lvl 85 BoE",
			},
			[28823618] = {
				["cont"] = 1,
				["icon"] = 16,
				["title"] = "Flüsternthe Pandarengeist",
				["desc"] = "Pet-Trainer\nElemental, Drachkin, Critter",
			},
			[42291139] = {
				["icon"] = 4,
				["title"] = "Hammer the zehn Donner",
				["desc"] = "= 2h Streitkolben Strength 404 lvl 85\n2 Spawnpunke: 41.8 17.6 und 43.0 11.6",
			},
			[45641829] = {
				["title"] = "Morgrinn Bersthauer",
				["icon"] = 1,
				["desc"] = "Rare Mob Spawn 2\n3 Spawnpunkte in the umgebung\n15% Epic 2h Strength Streitkolben 420 lvl 85",
			},
			[45802831] = {
				["icon"] = 4,
				["title"] = "Uralte pandarische Spitzhacke",
				["desc"] = "= 1h Axt Strength 404 lvl 85\nEdelstein Spitzhacke for Bergbau\nIn the cave steckt in einem Stein\n",
			},
			[42333893] = {
				["title"] = "Das Tier",
				["icon"] = 8,
				["desc"] = "Rare Mob Affe\n16% Epic 1h Strength Streitkolben BoP",
			},
			[45547111] = {
				["icon"] = 4,
				["title"] = "Uralter Staff the Jinyu",
				["desc"] = "= Staff Intelligenz 404 lvl 85\nUnderwater in Fluss Steckt in Boden\n3 Spawns: 47.1 67.4 / 46.2 71.2 / 44.9 64.6\n",
			},
			[62402728] = {
				["title"] = "Edelsteinkästchen",
				["icon"] = 4,
				["desc"] = "6g + Edelsteine\nCaveEntrance:  62.6 26.7\nEdelsteinkästchen: 62.45 27.52",
			},
			[56094703] = {
				["icon"] = 6,
				["title"] = "Dailys",
				["desc"] = "Orden Der Wolkenschlangen\nMounts!",
			},
			[26143201] = {
				["title"] = "Uralter pandarischer Teekessel",
				["icon"] = 4,
				["desc"] = "100g Grey Item + 303 XP\nSteht auf dem Tisch 26.2, 32,3",
			},
			[41091777] = {
				["icon"] = 4,
				["title"] = "Hammer the zehn Donner",
				["desc"] = "= 2h Streitkolben Strength 404 lvl 85\n2 Spawnpunke: 41.8 17.6 und 43.0 11.6",
			},
			[55566579] = {
				["title"] = "Dailys",
				["icon"] = 6,
				["desc"] = "Ab Lotus respektvoll:\nThe Celestial Exalted",
			},
			[39340732] = {
				["title"] = "Wodins Mantisfetzer",
				["icon"] = 4,
				["desc"] = "1h Agi Dolch 404 lvl 85\nin Brunnen 39.4 7.3",
			},
			[56115777] = {
				["title"] = "Tempel the Jadeschlange",
				["icon"] = 28,
				["desc"] = "InstanzEntrance (85-87 / 90 Heroic)",
			},
			[53461963] = {
				["cont"] = 1,
				["icon"] = 8,
				["title"] = "Zandalari Warbringer & Warscout",
				["desc"] = "5.2 Rare Mob - Dropt Mount\nJade, Slate, Amber, or Golden Prinordial Direhorn\nNPC-Scan id: 69842, 69769, 69841 & 69768",
			},
		},
		["Deepholm"] = {
			[49675735] = {
				["icon"] = 16,
				["title"] = "Bordin Steadyfist",
				["desc"] = "Pet-Trainer\nElemental, Critter, Elemental",
			},
		},
		["DreadWastes"] = {
			[27461704] = {
				["title"] = "Elite Muschel Quest [16mile hp]",
				["icon"] = 3,
				["desc"] = "= Quest for [Gokk'lokmuschel]\nUnderwater 27.4, 16.2",
			},
			[73342168] = {
				["title"] = "Krol die Klinge",
				["icon"] = 8,
				["desc"] = "Rare Mob\nDropt 300% EP Flask",
			},
			[36933187] = {
				["title"] = "Gar'lok",
				["icon"] = 8,
				["desc"] = "Rare Mob Spawn 1\nVersteckt in the hut",
			},
			[36766270] = {
				["title"] = "Omnis Feixmaul",
				["icon"] = 8,
				["desc"] = "Rare Mob - Läuft hier in Kreis\nDrop Goldenes Vlies (extra Gold Trinket)",
			},
			[71593710] = {
				["title"] = "Karr the Verdunkler",
				["icon"] = 8,
				["desc"] = "Rare Mob\nDropt Pet",
			},
			[47903034] = {
				["icon"] = 4,
				["title"] = "Maliks tapferer Speer",
				["desc"] = "= Agi Polearm 450 lvl 86\nSteckt zwischen Stein und Schwarzem Baum",
			},
			[55056401] = {
				["title"] = "Ik-Ik the Flinke",
				["icon"] = 8,
				["desc"] = "Rare Mob\nIn einer Höhle",
			},
			[41446344] = {
				["title"] = "Talisman des Manipulators",
				["icon"] = 4,
				["desc"] = "= Schmuck: zusatz Begleiter DMG 450 lvl 86\nSchinmernde Rapanaschnecke ansprechen\nNPC-Scan: 65552\n",
			},
			[24392743] = {
				["title"] = "Dak the Brecher",
				["icon"] = 8,
				["desc"] = "Rare Mob",
			},
			[35372194] = {
				["title"] = "Ai-Li Hinmelsspiegel",
				["icon"] = 8,
				["desc"] = "Rare Mob",
			},
			[71563682] = {
				["icon"] = 4,
				["title"] = "Schnellstoßdolch des Windschnitters",
				["desc"] = "= Agi Dolch 450 lvl 86\nin Lila Busch versteckt 71.8, 36.1",
			},
			[76022049] = {
				["title"] = "Das Tor the Untergehenden Sonne",
				["icon"] = 28,
				["desc"] = "InstanzEntrance",
			},
			[28184313] = {
				["title"] = "Klinge des vergifteten Geistes",
				["icon"] = 4,
				["desc"] = "= 1h Schwert Intelligenz 450 lvl 86\nIn den Büschen next to dem CaveEntrance",
			},
			[39024128] = {
				["title"] = "Gar'lok",
				["icon"] = 1,
				["desc"] = "Rare Mob Spawn 2",
			},
			[53653240] = {
				["title"] = "Dailys",
				["icon"] = 6,
				["desc"] = "Klaxxi Dailys\nund Punkte Hänthe",
			},
			[55847799] = {
				["title"] = "Schwärmendes Spaltbeil von Ka'roz",
				["icon"] = 4,
				["desc"] = "= 2h Schwert 450 lvl 86\n56.8, 77.6 Zwischen 2 Steinen in den Korallen\n",
			},
			[64105904] = {
				["title"] = "Nalash Verdantis",
				["icon"] = 8,
				["desc"] = "Rare Mob\nDropt Pet",
			},
			[29899189] = {
				["title"] = "MutationsStaff des Sezierers",
				["icon"] = 4,
				["desc"] = "= Intelligenz Staff 450 lvl 86\nAuf the unten Platform the Steinsäule 30.2 90.8",
			},
			[65826387] = {
				["title"] = "Klinge des Ersten",
				["icon"] = 4,
				["desc"] = "In the cave - Steckt in einer Wurzel hinter dem Elite Mob",
			},
			[61228740] = {
				["cont"] = 1,
				["icon"] = 16,
				["title"] = "Fließenthe Pandarengeist",
				["desc"] = "Pet-Trainer\nAquatic, Critter, Elemental",
			},
			[25755489] = {
				["title"] = "Blutgetränktes Chitinfragment",
				["icon"] = 4,
				["desc"] = "=Schmuck Mastery+Agi 450 lvl 86\nUnderwater in the Höhle",
			},
			[31882944] = {
				["title"] = "Luzides Amulett des gewandten Geistes",
				["icon"] = 4,
				["desc"] = "= Hals Intelligenz 450 lvl 86\nLiegt auf Stein next to Schwazem Baum 32,30",
			},
			[38923462] = {
				["title"] = "Herz the Angst",
				["icon"] = 28,
				["desc"] = "Entrance 10er/25er Raid",
			},
			[47125985] = {
				["cont"] = 1,
				["icon"] = 8,
				["title"] = "Zandalari Warbringer & Warscout",
				["desc"] = "5.2 Rare Mob - Dropt Mount\nJade, Slate, Amber, or Golden Prinordial Direhorn\nNPC-Scan id: 69769 & 69768",
			},
			[53525639] = {
				["title"] = "Medaillon des Schwarmwächters",
				["icon"] = 4,
				["desc"] = "= Schmuck: +Crit +Tempo ilvl: 450 lvl: 86\nAuf dem Boden in the nähe des Steins\nBei 54.3, 56.5",
			},
			[54943741] = {
				["title"] = "Ödniswandler Shu",
				["icon"] = 16,
				["desc"] = "Pet-Trainer\nAquatic, Elemental, Wildlife",
			},
		},
		["Krasarang_terrain1"] = {
			[41859219] = {
				["title"] = "Equipment Locker",
				["icon"] = 4,
				["desc"] = "Random BoP Boots 419 lvl 86\nvery bottom of the ship\nCounts as treasure for Lost and Found!",
			},
			[30463829] = {
				["title"] = "Cournith Waterstrithe",
				["icon"] = 8,
				["desc"] = "Rare Mob\nEpic Pants 440",
			},
			[15403638] = {
				["title"] = "Torik-Ethis",
				["icon"] = 8,
				["desc"] = "Rare Mob\nEpic Plate Tank Pants 440",
			},
			[66972312] = {
				["title"] = "Qu'nas",
				["icon"] = 8,
				["desc"] = "Epic Strength Plate Pants",
			},
			[52348787] = {
				["title"] = "Spriggin",
				["icon"] = 8,
				["desc"] = "Rare Mob\nEpic Will Leather Pants 440",
			},
			[56334652] = {
				["title"] = "Arness the Scale",
				["icon"] = 8,
				["desc"] = "Rare Mob\nEpic Mail Heal Pants 440",
			},
			[84962696] = {
				["title"] = "Dalan Nightbreaker",
				["icon"] = 24,
				["desc"] = "250 Honor\nEpic PvP Resilience Trinket\nNPC-Scan: 68318",
			},
			[32966448] = {
				["title"] = "Dailys",
				["icon"] = 6,
				["desc"] = "Respectful of Lotus: \nThe Celestial Exalted",
			},
			[50634883] = {
				["title"] = "Pandaren Fishing Spear",
				["icon"] = 4,
				["desc"] = "Agility Polearm 419 lvl 86\nStuck in the ground behind Uncle Deming",
			},
			[83853087] = {
				["title"] = "Mavis Harms",
				["icon"] = 24,
				["desc"] = "250 Honor\nEpic Pvp-power Trinket\nNPC-Scan: 68317",
			},
			[10505714] = {
				["icon"] = 25,
				["title"] = "Muerta",
				["desc"] = "250 Honor\nEpic insignia 1 min CD\nNPC-Scan: 68322",
			},
			[85922431] = {
				["title"] = "Dalies (Alliance)",
				["icon"] = 6,
				["desc"] = "Operation Shieldwall",
			},
			[71020859] = {
				["title"] = "Saurok Stone Tablet",
				["icon"] = 4,
				["desc"] = "100g Grey Item\nIn the cave",
			},
			[15135666] = {
				["icon"] = 25,
				["title"] = "Kar Warmaker",
				["desc"] = "250 Honor\nEpic Resiliences Trinket \nNPC-Scan: 68322\n",
			},
			[53088851] = {
				["title"] = "Recipe: Banana Infused Rum",
				["icon"] = 4,
				["desc"] = "Up on the ship in a barrel\nCounts as treasure!",
			},
			[87412895] = {
				["title"] = "Disha Fearwarden",
				["icon"] = 24,
				["desc"] = "250 Honor\nNPC-Scan: 68319",
			},
			[38986616] = {
				["cont"] = 1,
				["icon"] = 8,
				["title"] = "Zandalari Warbringer & Warscout",
				["desc"] = "5.2 Rare Mob - Dropt Mount\nJade, Slate, Amber, or Golden Prinordial Direhorn\nNPC-Scan id: 69769 & 69768",
			},
			[53773550] = {
				["title"] = "Gaarn the Toxic",
				["icon"] = 8,
				["desc"] = "Rare Mob\nEpic Cloth Will Pants 440",
			},
			[67454428] = {
				["title"] = "Dailys",
				["icon"] = 6,
				["desc"] = "Angelquests",
			},
			[52077247] = {
				["title"] = "Stack of Papers",
				["icon"] = 4,
				["desc"] = "Grey Item 15g\nLocated next to the hatch\nNo treasure!",
			},
			[39032911] = {
				["title"] = "Go-Kan",
				["icon"] = 8,
				["desc"] = "Rare Mob\nEpic Mail Aggi Pants 440",
			},
			[40475514] = {
				["title"] = "Ruun Ghostpaw",
				["icon"] = 8,
				["desc"] = "Rare Mob\nPanda in the 2. floor\nEpic Aggi Leather Pants 440",
			},
			[12075660] = {
				["icon"] = 6,
				["title"] = "Dailys (Horde)",
				["desc"] = "Dominance Offensive",
			},
			[11306632] = {
				["icon"] = 25,
				["title"] = "Ubunti the Shade",
				["desc"] = "250 Honor\nEpic PvP power Trinket\nNPC-Scan: 68320",
			},
			[62014675] = {
				["icon"] = 16,
				["title"] = "Mo'ruk",
				["desc"] = "Pet-Trainer\nWildlife, Flying (Moth), Aquatic",
			},
		},
		["MoltenCore"] = {
			[82588315] = {
				["title"] = "Sulfuron Harbinger",
				["icon"] = 8,
				["desc"] = "Pet: Mark of Flame",
			},
			[68255861] = {
				["title"] = "Golemagg the Incinerator",
				["icon"] = 8,
				["desc"] = "Pet: Core of Hardened Ash",
			},
			[69212405] = {
				["icon"] = 1,
				["level"] = 5,
				["title"] = "Corefire inp",
				["desc"] = "",
			},
			[68462469] = {
				["icon"] = 8,
				["level"] = 5,
				["title"] = "Magmadar",
				["desc"] = "Pet: Corefire inp",
			},
			[68782349] = {
				["title"] = "Magmadar",
				["icon"] = 8,
				["desc"] = "Pet: Corefire inp",
			},
		},
		["VashjirDepths"] = {
			[40917082] = {
				["icon"] = 8,
				["title"] = "Poseidus",
				["desc"] = "",
			},
		},
		["IcecrownGlacier"] = {
			[73736489] = {
				["icon"] = 4,
				["title"] = "Val'kyr Pet",
				["desc"] = "",
			},
			[48398669] = {
				["icon"] = 4,
				["title"] = "Val'kyr Pet",
				["desc"] = "",
			},
			[44543377] = {
				["icon"] = 4,
				["title"] = "Val'kyr Pet",
				["desc"] = "",
			},
			[77361997] = {
				["title"] = "Major Payne",
				["icon"] = 16,
				["desc"] = "Pet-Trainer\nWildlife, Elemental, Mechanisch",
			},
		},
		["KunLaiSummit"] = {
			[35847350] = {
				["title"] = "Mutiger Yon",
				["icon"] = 16,
				["desc"] = "Pet-Trainer (in the Cave 35.8, 73.6)\nWildlife, Flying, Critter",
			},
			[64281332] = {
				["icon"] = 8,
				["title"] = "Nessos the Oracle",
				["desc"] = "Rare Mob",
			},
			[45296270] = {
				["icon"] = 8,
				["title"] = "Scritch",
				["desc"] = "Rare Mob\nDropt +1000 reputation item",
			},
			[41736999] = {
				["icon"] = 6,
				["title"] = "Daily",
				["desc"] = "Is only Gold",
			},
			[50848638] = {
				["title"] = "Sha of Wrath (Worldboss)",
				["icon"] = 7,
				["desc"] = "",
			},
			[64649375] = {
				["cont"] = 1,
				["icon"] = 16,
				["title"] = "Bebenthe Pandarengeist",
				["desc"] = "Pet-Trainer\nCritter, Elemental, Wildlife",
			},
			[56847603] = {
				["icon"] = 4,
				["title"] = "Terracotta Head",
				["desc"] = "100g 28300xp\nCounts as treasure",
			},
			[38167863] = {
				["icon"] = 4,
				["title"] = "Kafa Press",
				["desc"] = "= 4000 Haste potion 10 min cd\nIn the cave 35.2, 76.3\nFrozen Trail Packer\nNPC-Scan: 64227",
			},
			[66727733] = {
				["title"] = "Sha of Wrath (Worldboss)",
				["icon"] = 7,
				["desc"] = "Spawns every 15-30 min igentwo in Kun-Lai\nKill Check Macro:\n/run for k, v in pairs({ Galleon=32098, Sha=32099, Nalak=32518, Oon=32519, Champ=32641, Key=32626, Barrens=32862}) do print(format(\"%s: %s\", k, IsQuestFlaggedCompleted(v) and \"\\124cff00ff00Yes\" or \"\\124cffff0000No\"))",
			},
			[71973417] = {
				["title"] = "Statue von Xuen",
				["icon"] = 4,
				["desc"] = "100g Grey Item 500k XP\nUnder water at 72.0, 34.0\nCounts as treasure",
			},
			[57667838] = {
				["title"] = "Havak",
				["icon"] = 8,
				["desc"] = "Rare Mob",
			},
			[75176722] = {
				["cont"] = 1,
				["icon"] = 8,
				["title"] = "Zandalari Warbringer & Warscout",
				["desc"] = "5.2 Rare Mob - Dropt Mount\nJade, Slate, Amber, or Golden Prinordial Direhorn\nNPC-Scan id: 69769 & 69768",
			},
			[37638073] = {
				["icon"] = 8,
				["title"] = "Ski'thik",
				["desc"] = "Rare Mob",
			},
			[50156176] = {
				["title"] = "Hozen Treasure Cache",
				["icon"] = 4,
				["desc"] = "Contains 100g + 177k XP\nCave Entrance: 50.4, 61.7\nAt the end of the cave: 49.4, 59.4",
			},
			[40424180] = {
				["icon"] = 8,
				["title"] = "Ahone the Wanderer",
				["desc"] = "Rare Mob",
			},
			[53207111] = {
				["title"] = "Hozen Warrior Spear",
				["icon"] = 4,
				["desc"] = "= Agi Polearm 434 lvl 86\nStuck in the stone in the cave at 24,6 65,3",
			},
			[64104554] = {
				["title"] = "Ancient Mogu Tablet",
				["icon"] = 4,
				["desc"] = "95g Grey Item 280k XP\nCaveEntrance: 63.9, 49.8\nIn the cave 64.2,45.2",
			},
			[69815083] = {
				["icon"] = 6,
				["title"] = "Dailys",
				["desc"] = "Ab Lotus respektvoll:\nThe Celestial Exalted",
			},
			[53658073] = {
				["title"] = "Korda Torros",
				["icon"] = 8,
				["desc"] = "Rare Mob\n11% Foragers Gloves\n(Mining, Skinning, herbs)",
			},
			[44675235] = {
				["title"] = "Tablet of Ren Yun",
				["icon"] = 4,
				["desc"] = "Teaches Four Senses Brew\nUp on the hill next to the statue 44.7 52.4\nCounts as treasure!",
			},
			[52335081] = {
				["title"] = "Rikktik's Tiny Chest",
				["icon"] = 4,
				["desc"] = "105g Grey Item +51g + 200k XP\n(Rikktik's Tick Remover)\nIn the cave next to the monkey statue 52.6, 51.5\nCounts as treasure",
			},
			[59613906] = {
				["icon"] = 28,
				["title"] = "Mogu'shan Vaults",
				["desc"] = "Entrance 10/25 Raid",
			},
			[59685259] = {
				["title"] = "Stolen Sprite Treasure",
				["icon"] = 4,
				["desc"] = "Contains 104g + 283k XP\nCaveEntrance: 59.5, 52.9 \nItem: 41.0, 42.7\nCounts as treasure!\n2 Various treasures are here in the cave",
			},
			[73517707] = {
				["icon"] = 8,
				["title"] = "Zai the Outcast",
				["desc"] = "Rare Mob",
			},
			[48858055] = {
				["title"] = "Korda Torros",
				["icon"] = 1,
				["desc"] = "Rare Mob Spawn 2",
			},
			[37064779] = {
				["title"] = "Shado-Pan Monastery",
				["icon"] = 28,
				["desc"] = "Instance Entrance (87-89 / 90 Heroic)",
			},
			[54696714] = {
				["icon"] = 7,
				["title"] = "Sha of Wrath (Worldboss)",
				["desc"] = "Spawns every 15-30 min igentwo in Kun-Lai\n\nKill Check Macro:\n/run for k, v in pairs({ Galleon = 32098, Sha = 32099, Nalak = 32518}) do print(format(\"%s: %s\", k, IsQuestFlaggedCompleted(v) and \"Yes killed\" or \"No\")) end",
			},
			[55344530] = {
				["icon"] = 8,
				["title"] = "Borginn Darkfist",
				["desc"] = "Rare Mob",
			},
			[74517328] = {
				["title"] = "Sprite's Cloth Chest",
				["icon"] = 4,
				["desc"] = "= Random 86 BoP Cloak\nSmall box in the cave at the back",
			},
			[70996256] = {
				["title"] = "Sturdy Yaungol Spear",
				["icon"] = 4,
				["desc"] = "= Strength Spear 419 lvl 86\nOn a spawned weapon rack",
			},
		},
		["CoilfangReservoir"] = {
			[59682613] = {
				["title"] = "Morgrin",
				["icon"] = 8,
				["desc"] = "",
			},
		},
		["Uldum_terrain1"] = {
			[56724163] = {
				["icon"] = 16,
				["title"] = "Obalis",
				["desc"] = "Pet-Trainer\nWildlife, Critter, Flying",
			},
			[46363441] = {
				["title"] = "Scourer of the Eternal Sands",
				["icon"] = 8,
				["desc"] = "64.6 30.4\nNPC-Scan: 50409",
			},
		},
		["Pandaria"] = {
			[52343981] = {
				["icon"] = 7,
				["title"] = "Sha des Zorns (Worldboss)",
				["desc"] = "ReSpawns every 15-30 min",
			},
			[56916985] = {
				["icon"] = 7,
				["title"] = "Galleon (Worldboss)",
				["desc"] = "ReSpawns every 1-3 hours",
			},
		},
		["SholazarBasin"] = {
			[44216890] = {
				["icon"] = 4,
				["title"] = "Val'kyr Pet",
				["desc"] = "",
			},
			[36951933] = {
				["icon"] = 4,
				["title"] = "Val'kyr Pet",
				["desc"] = "",
			},
			[58332222] = {
				["icon"] = 4,
				["title"] = "Val'kyr Pet",
				["desc"] = "",
			},
		},
		["CavernofLostSpirits"] = {
			[62833569] = {
				["icon"] = 9,
				["title"] = "Totenkopftruhe",
				["desc"] = "73 Coins + Epic",
			},
			[53205671] = {
				["icon"] = 3,
				["title"] = "Zarhym",
				["desc"] = "Rare Mob\nSchickt in Geisterweilt:\nGeistertruhen Sammeln\nGeister nicht berühren\nZarhyms Körper finden",
			},
			[53943121] = {
				["icon"] = 3,
				["title"] = "Zarhyms Körper",
				["desc"] = "",
			},
			[45893191] = {
				["title"] = "Steinmoos",
				["icon"] = 8,
				["desc"] = "Rare Mob",
			},
		},
		["HowlingFjord"] = {
			[28393345] = {
				["icon"] = 16,
				["title"] = "Beegli Lunte",
				["desc"] = "Pet-Trainer\nFlying, Wasser, Flying",
			},
			[68386761] = {
				["icon"] = 4,
				["title"] = "Val'kyr Pet",
				["desc"] = "",
			},
			[72444307] = {
				["title"] = "Val'kyr Pet",
				["icon"] = 4,
				["desc"] = "",
			},
			[45604308] = {
				["title"] = "Val'kyr Pet",
				["icon"] = 4,
				["desc"] = "",
			},
		},
		["GrizzlyHills"] = {
			[61121821] = {
				["title"] = "Val'kyr Pet",
				["icon"] = 4,
				["desc"] = "",
			},
			[25935591] = {
				["title"] = "Val'kyr Pet",
				["icon"] = 4,
				["desc"] = "",
			},
			[79185238] = {
				["title"] = "Val'kyr Pet",
				["icon"] = 4,
				["desc"] = "",
			},
		},
		["ThuntheKingLootRoom"] = {
			[35141777] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[44461913] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[40891362] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[29234796] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[25032408] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[40682304] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[26205282] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[47181530] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[29714915] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[25032249] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[27705011] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[29192600] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[53931378] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[29455019] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[27485961] = {
				["title"] = "Start",
				["icon"] = 19,
				["desc"] = "",
			},
			[36052025] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[42382504] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[28124117] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[52121107] = {
				["icon"] = 7,
				["title"] = "Tenwu (Ausgang)",
				["desc"] = "",
			},
			[54151825] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[29711554] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[31471538] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[26793199] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[27211993] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[29334626] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[25671817] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[51382783] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[29084005] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[28283191] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[26045554] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[26253622] = {
				["title"] = "Schalter",
				["icon"] = 20,
				["desc"] = "",
			},
			[54201969] = {
				["icon"] = 9,
				["title"] = "Goldene Box",
				["desc"] = "",
			},
			[32801610] = {
				["title"] = "Schalter",
				["icon"] = 20,
				["desc"] = "",
			},
			[44191290] = {
				["title"] = "Schalter",
				["icon"] = 20,
				["desc"] = "",
			},
			[53241905] = {
				["icon"] = 8,
				["title"] = "God-Hulk Gulkan (Boss)",
				["desc"] = "",
			},
		},
		["Karazhan"] = {
			[43168389] = {
				["icon"] = 1,
				["level"] = 6,
				["title"] = "Urne",
				["desc"] = "Hier Boss beschwören",
			},
			[83694973] = {
				["icon"] = 8,
				["level"] = 4,
				["title"] = "Tugendhafte Maid",
				["desc"] = "Boss",
			},
			[80056898] = {
				["icon"] = 3,
				["level"] = 15,
				["title"] = "Zurück zum Schachevent",
				["desc"] = "",
			},
			[84657219] = {
				["title"] = "Weiter zu Prinz Malchezaar",
				["level"] = 15,
				["icon"] = 3,
				["desc"] = "",
			},
			[69134323] = {
				["icon"] = 3,
				["level"] = 4,
				["title"] = "Zurück zu Mores",
				["desc"] = "",
			},
			[24236096] = {
				["title"] = "Nethergroll",
				["level"] = 12,
				["icon"] = 3,
				["desc"] = "hierlang",
			},
			[58885438] = {
				["title"] = "Zurück zu Schrecken the Nacht",
				["level"] = 8,
				["icon"] = 3,
				["desc"] = "",
			},
			[27026352] = {
				["title"] = "Moroes",
				["level"] = 3,
				["icon"] = 8,
				["desc"] = "Boss",
			},
			[60151757] = {
				["icon"] = 3,
				["level"] = 9,
				["title"] = "Zurück zu Schrecken the Nacht",
				["desc"] = "",
			},
			[62307411] = {
				["icon"] = 3,
				["level"] = 16,
				["title"] = "Weiter zu Prinz Malchezaar",
				["desc"] = "",
			},
			[53966128] = {
				["icon"] = 3,
				["level"] = 7,
				["title"] = "Weiter zu Der Kurator",
				["desc"] = "",
			},
			[57815326] = {
				["title"] = "Weiter zu Nethergroll",
				["level"] = 10,
				["icon"] = 3,
				["desc"] = "",
			},
			[32156256] = {
				["icon"] = 3,
				["level"] = 10,
				["title"] = "Zurück zu Der Kurator",
				["desc"] = "hierlang",
			},
			[45195230] = {
				["title"] = "Zurück zu Arans Schemen",
				["level"] = 12,
				["icon"] = 3,
				["desc"] = "",
			},
			[41131412] = {
				["title"] = "Zurück zu Der große böse Wolf",
				["level"] = 6,
				["icon"] = 3,
				["desc"] = "",
			},
			[66894243] = {
				["title"] = "Weiter zu Tugendhafte Maid",
				["level"] = 3,
				["icon"] = 3,
				["desc"] = "",
			},
			[39738333] = {
				["title"] = "Zurück zu Attumen",
				["level"] = 3,
				["icon"] = 3,
				["desc"] = "",
			},
			[52039063] = {
				["icon"] = 3,
				["level"] = 17,
				["title"] = "Zurück zu ",
				["desc"] = "",
			},
			[62942198] = {
				["title"] = "Richtung Schrecken the Nacht",
				["level"] = 5,
				["icon"] = 3,
				["desc"] = "",
			},
			[27015823] = {
				["title"] = "Weiter zum Schachevent",
				["level"] = 12,
				["icon"] = 3,
				["desc"] = "",
			},
			[43598341] = {
				["icon"] = 3,
				["level"] = 5,
				["title"] = "Zurück zu Der große böse Wolf",
				["desc"] = "",
			},
			[79096032] = {
				["title"] = "Weiter zu Prinz Malchezaar",
				["level"] = 14,
				["icon"] = 3,
				["desc"] = "hierlang",
			},
			[49363674] = {
				["icon"] = 8,
				["level"] = 9,
				["title"] = "Der Kurator",
				["desc"] = "Boss\nPet: Menageriewächter",
			},
			[41341428] = {
				["icon"] = 3,
				["level"] = 14,
				["title"] = "Prinz Malchezaar",
				["desc"] = "hierlang",
			},
			[36104171] = {
				["title"] = "Nethergroll",
				["level"] = 13,
				["icon"] = 8,
				["desc"] = "Boss",
			},
			[45308245] = {
				["icon"] = 8,
				["level"] = 1,
				["title"] = "Attumen",
				["desc"] = "Boss\nMount: Feuriges Schlachtross",
			},
			[69576593] = {
				["icon"] = 3,
				["level"] = 7,
				["title"] = "Zurück zu Schrecken the Nacht",
				["desc"] = "",
			},
			[36116192] = {
				["title"] = "Schachevent",
				["level"] = 14,
				["icon"] = 8,
				["desc"] = "Boss",
			},
			[64876930] = {
				["icon"] = 3,
				["level"] = 6,
				["title"] = "Weiter zu Der Kurator",
				["desc"] = "",
			},
			[52886360] = {
				["icon"] = 3,
				["level"] = 1,
				["title"] = "Weiter zu Moroes",
				["desc"] = "",
			},
			[53967924] = {
				["icon"] = 3,
				["level"] = 13,
				["title"] = "Zurück zu Arans Schemen",
				["desc"] = "",
			},
			[66472423] = {
				["title"] = "Arans Schemen",
				["level"] = 11,
				["icon"] = 3,
				["desc"] = "hierlang",
			},
			[43052535] = {
				["icon"] = 15,
				["level"] = 12,
				["title"] = "Hänthe",
				["desc"] = "",
			},
			[36422198] = {
				["icon"] = 3,
				["level"] = 10,
				["title"] = "Weiter zu Terestian Siechhuf",
				["desc"] = "hierlang",
			},
			[51513128] = {
				["title"] = "Prinz Malchezaar",
				["level"] = 17,
				["icon"] = 8,
				["desc"] = "Boss\nPet: Netherraumabyssal",
			},
			[52256994] = {
				["icon"] = 8,
				["level"] = 11,
				["title"] = "Terestian Siechhuf",
				["desc"] = "Boss\nPet: Dämonischer Wichtel",
			},
			[46909175] = {
				["title"] = "Schrecken the Nacht",
				["level"] = 6,
				["icon"] = 8,
				["desc"] = "Boss",
			},
			[71712599] = {
				["icon"] = 8,
				["level"] = 10,
				["title"] = "Arans Schemen",
				["desc"] = "Boss",
			},
			[17823449] = {
				["icon"] = 8,
				["level"] = 4,
				["title"] = "Der große böse Wolf",
				["desc"] = "Boss\nPet: Kleiner böser Wolf",
			},
			[70967202] = {
				["icon"] = 3,
				["level"] = 16,
				["title"] = "Zurück zum Schachevent",
				["desc"] = "",
			},
			[39631749] = {
				["title"] = "Weiter zum Schachevent",
				["level"] = 12,
				["icon"] = 3,
				["desc"] = "",
			},
			[54175021] = {
				["icon"] = 3,
				["level"] = 8,
				["title"] = "Weiter zu Der Kurator",
				["desc"] = "",
			},
			[27322286] = {
				["title"] = "Weiter zu Der große böse Wolf",
				["level"] = 4,
				["icon"] = 3,
				["desc"] = "",
			},
			[30126417] = {
				["icon"] = 3,
				["level"] = 9,
				["title"] = "Arans Schemen & Terestian Siechhuf",
				["desc"] = "hierlang",
			},
			[19944179] = {
				["icon"] = 3,
				["level"] = 4,
				["title"] = "Weiter zu Schrecken the Nacht",
				["desc"] = "",
			},
		},
		["TwilightHighlands"] = {
			[56525639] = {
				["icon"] = 16,
				["title"] = "Goz Unheilsfuror",
				["desc"] = "Pet-Trainer\nWildlife, Magie, Elemental",
			},
		},
		["AhnQiraj"] = {
			[34354458] = {
				["title"] = "Gang zu c'Thun",
				["level"] = 1,
				["icon"] = 8,
				["desc"] = "",
			},
		},
		["Krasarang"] = {
			[53463861] = {
				["icon"] = 1,
				["title"] = "Gaarn",
				["desc"] = "",
			},
			[50698883] = {
				["icon"] = 8,
				["title"] = "Spriggin",
				["desc"] = "Rare Mob",
			},
			[54523240] = {
				["icon"] = 8,
				["title"] = "Gaarn the Giftige",
				["desc"] = "Rare Mob",
			},
			[28753762] = {
				["icon"] = 8,
				["title"] = "Cournith Wasserläufer",
				["desc"] = "Rare Mob\nin dem Tempel",
			},
			[39555434] = {
				["icon"] = 8,
				["title"] = "Ruun Geisterpranke",
				["desc"] = "Rare Mob Panda\nIn dem Gebäude obere floor",
			},
			[51568996] = {
				["title"] = "Koch Rezept: Bananenrum",
				["icon"] = 4,
				["desc"] = "Oben auf dem Schiff in einem Fass",
			},
			[39022848] = {
				["icon"] = 8,
				["title"] = "Go-Kan",
				["desc"] = "Rare Mob",
			},
			[56574800] = {
				["icon"] = 8,
				["title"] = "Arness die Schuppe",
				["desc"] = "Rare Mob",
			},
			[13943527] = {
				["icon"] = 8,
				["title"] = "Torik-Ethis",
				["desc"] = "Rare Mob",
			},
			[30746580] = {
				["title"] = "Dailys",
				["icon"] = 6,
				["desc"] = "Ab Lotus respektvoll:\nThe Celestial Exalted",
			},
			[68464389] = {
				["icon"] = 6,
				["title"] = "Dailys",
				["desc"] = "Angelquests",
			},
			[66892142] = {
				["icon"] = 8,
				["title"] = "Qu'nas",
				["desc"] = "Rare Mob",
			},
			[49964881] = {
				["title"] = "Pandarischer Fischspeer",
				["icon"] = 4,
				["desc"] = "= Agility Polearm 419 lvl 86\nSteckt in Boden hinter Onkel Deming",
			},
			[41589133] = {
				["title"] = "Equipment Locker",
				["icon"] = 4,
				["desc"] = "= Random BoP Boots 419 lvl 86\nganz Unten in Schiff",
			},
		},
		["ValeofEternalBlossoms"] = {
			[79783344] = {
				["title"] = "Daily",
				["icon"] = 6,
				["desc"] = "Archeologie",
			},
			[43904389] = {
				["icon"] = 6,
				["title"] = "Dailys",
				["desc"] = "Lotus",
			},
			[46646014] = {
				["icon"] = 2,
				["title"] = "Knackzahn",
				["desc"] = "Koch Rare Mob",
			},
			[29109039] = {
				["icon"] = 8,
				["title"] = "Major Affentanz",
				["desc"] = "Rare Mob\nPfeife des hilfreichen Nupsi",
			},
			[46966415] = {
				["icon"] = 2,
				["title"] = "Geist von Lao-Fe <Der Sklavenbinthe>",
				["desc"] = "Koch Rare Mob",
			},
			[67201404] = {
				["icon"] = 16,
				["title"] = "Bebenthe Pandarengeist",
				["desc"] = "",
			},
			[25902452] = {
				["title"] = "Schlüssel in den Hallen eintauschen",
				["icon"] = 4,
				["desc"] = "gegen Lotus Ruf",
			},
			[41646949] = {
				["icon"] = 8,
				["title"] = "Ai-Ran die flüchtige Wolke",
				["desc"] = "Rare Mob\nin the Höhle",
			},
			[57494232] = {
				["icon"] = 6,
				["title"] = "Dailys",
				["desc"] = "Lotus",
			},
			[78793486] = {
				["title"] = "Mogu’shanpalast",
				["icon"] = 28,
				["desc"] = "InstanzEntrance (87-89 / 90 Heroic)",
			},
			[36265067] = {
				["icon"] = 2,
				["title"] = "Zangenkiefer",
				["desc"] = "Koch Rare Mob",
			},
			[68683096] = {
				["icon"] = 8,
				["title"] = "Sahn Gezeitenjäger",
				["desc"] = "Rare Mob\nDropt +50% swin speed",
			},
			[67564093] = {
				["title"] = "Aki die Auserwählte",
				["icon"] = 16,
				["desc"] = "Pet-Trainer\nCritter, Drachkin, Aquatik",
			},
			[21831651] = {
				["icon"] = 2,
				["title"] = "Gaohun the Seelenschnitter <inperion the Shao-Tien>",
				["desc"] = "Koch Rare Mob\nIn den Guo-Lai-Hallen",
			},
			[33976192] = {
				["icon"] = 8,
				["title"] = "Moldo Einauge",
				["desc"] = "Rare Mob\nam Ufer den Fluss rauf richtung See",
			},
			[65893976] = {
				["icon"] = 2,
				["title"] = "Quid <Spirit of the Misty Falls>",
				["desc"] = "Koch Rare Mob",
			},
			[8033367] = {
				["icon"] = 2,
				["title"] = "Vyraxxis <Schwarmforst the Krik'thik>",
				["desc"] = "Koch Rare Mob",
			},
			[73374227] = {
				["icon"] = 3,
				["title"] = "Lotus Hänthe",
				["desc"] = "",
			},
			[24391394] = {
				["icon"] = 2,
				["title"] = "Huo-Shuang <inperion the Shao-Tien>",
				["desc"] = "Koch Rare Mob\nIn den Guo-Lai-Hallen",
			},
			[15887302] = {
				["title"] = "Das Tor the Untergehenden Sonne",
				["icon"] = 28,
				["desc"] = "InstanzEntrance",
			},
			[34988997] = {
				["icon"] = 2,
				["title"] = "Aetha",
				["desc"] = "Koch Rare Mob",
			},
			[83925959] = {
				["icon"] = 6,
				["title"] = "Allianz Daily+Weekly",
				["desc"] = "Ab Lotus respektvoll:\nDaily for Hinmlisch Erhabene\n\nKrystel: Hänthe for Geister the Harmonie",
			},
			[61142430] = {
				["icon"] = 6,
				["title"] = "Horde Daily+Weekly",
				["desc"] = "Ab Lotus respektvoll:\nDaily for Hinmlisch Erhabene\n\nDanky: Hänthe for Geister the Harmonie",
			},
			[39072529] = {
				["title"] = "Urgolax",
				["icon"] = 8,
				["desc"] = "Rare Mob\nSpecial Drop: Kelch the Geheinnisse (Funitem)",
			},
			[27714169] = {
				["icon"] = 2,
				["title"] = "Baolai the Verbrenner <inperion the Shao-Tien>",
				["desc"] = "Koch Rare Mob",
			},
			[87624337] = {
				["icon"] = 8,
				["title"] = "Yorik Scharfauge",
				["desc"] = "Rare Mob",
			},
			[14125852] = {
				["title"] = "Kal'tik the Veröthe",
				["icon"] = 8,
				["desc"] = "Rare Mob",
			},
			[27395661] = {
				["icon"] = 2,
				["title"] = "General Temuja <Der Seelenversklaver>",
				["desc"] = "Koch Rare Mob",
			},
			[17024795] = {
				["icon"] = 2,
				["title"] = "Bai-Jin the Schlächter <inperion the Shao-Tien>",
				["desc"] = "Koch Rare Mob",
			},
			[14813344] = {
				["icon"] = 8,
				["title"] = "Kang the Seelendieb",
				["desc"] = "Rare Mob\nSpecial Drop: Kangs Bindungsstein (Funitem)",
			},
			[6645885] = {
				["icon"] = 2,
				["title"] = "Kri'chon <Der Leichenhäscher>",
				["desc"] = "Koch Rare Mob",
			},
			[26751330] = {
				["icon"] = 2,
				["title"] = "Gochao die Eisenfaust <inperion the Shao-Tien>",
				["desc"] = "Koch Rare Mob",
			},
			[43205147] = {
				["icon"] = 1,
				["title"] = "Moldo Einauge",
				["desc"] = "",
			},
			[45257666] = {
				["icon"] = 2,
				["title"] = "Wulon",
				["desc"] = "Koch Rare Mob",
			},
			[25681603] = {
				["icon"] = 2,
				["title"] = "Blutspitz <Glutnetzmatriarchin>",
				["desc"] = "Koch Rare Mob\nIn den Guo-Lai-Hallen\n(Ritualkammer Spinne in Wasser)",
			},
			[30497874] = {
				["icon"] = 2,
				["title"] = "Schattenmeister Sydow <Der Seelensammler>",
				["desc"] = "Koch Rare Mob",
			},
		},
		}
		
for k,v in pairs(aegerUI_HandyNotes_Install) do
		HandyNotes_HandyNotesDB.global[k] = v
	end
end