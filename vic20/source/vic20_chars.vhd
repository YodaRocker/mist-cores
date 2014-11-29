-- generated with romgen by MikeJ
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity VIC20_CHAR_ROM is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(11 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of VIC20_CHAR_ROM is


  type ROM_ARRAY is array(0 to 4095) of std_logic_vector(7 downto 0);
  constant ROM : ROM_ARRAY := (
    x"1C",x"22",x"4A",x"56",x"4C",x"20",x"1E",x"00", -- 0x0000
    x"18",x"24",x"42",x"7E",x"42",x"42",x"42",x"00", -- 0x0008
    x"7C",x"22",x"22",x"3C",x"22",x"22",x"7C",x"00", -- 0x0010
    x"1C",x"22",x"40",x"40",x"40",x"22",x"1C",x"00", -- 0x0018
    x"78",x"24",x"22",x"22",x"22",x"24",x"78",x"00", -- 0x0020
    x"7E",x"40",x"40",x"78",x"40",x"40",x"7E",x"00", -- 0x0028
    x"7E",x"40",x"40",x"78",x"40",x"40",x"40",x"00", -- 0x0030
    x"1C",x"22",x"40",x"4E",x"42",x"22",x"1C",x"00", -- 0x0038
    x"42",x"42",x"42",x"7E",x"42",x"42",x"42",x"00", -- 0x0040
    x"1C",x"08",x"08",x"08",x"08",x"08",x"1C",x"00", -- 0x0048
    x"0E",x"04",x"04",x"04",x"04",x"44",x"38",x"00", -- 0x0050
    x"42",x"44",x"48",x"70",x"48",x"44",x"42",x"00", -- 0x0058
    x"40",x"40",x"40",x"40",x"40",x"40",x"7E",x"00", -- 0x0060
    x"42",x"66",x"5A",x"5A",x"42",x"42",x"42",x"00", -- 0x0068
    x"42",x"62",x"52",x"4A",x"46",x"42",x"42",x"00", -- 0x0070
    x"18",x"24",x"42",x"42",x"42",x"24",x"18",x"00", -- 0x0078
    x"7C",x"42",x"42",x"7C",x"40",x"40",x"40",x"00", -- 0x0080
    x"18",x"24",x"42",x"42",x"4A",x"24",x"1A",x"00", -- 0x0088
    x"7C",x"42",x"42",x"7C",x"48",x"44",x"42",x"00", -- 0x0090
    x"3C",x"42",x"40",x"3C",x"02",x"42",x"3C",x"00", -- 0x0098
    x"3E",x"08",x"08",x"08",x"08",x"08",x"08",x"00", -- 0x00A0
    x"42",x"42",x"42",x"42",x"42",x"42",x"3C",x"00", -- 0x00A8
    x"42",x"42",x"42",x"24",x"24",x"18",x"18",x"00", -- 0x00B0
    x"42",x"42",x"42",x"5A",x"5A",x"66",x"42",x"00", -- 0x00B8
    x"42",x"42",x"24",x"18",x"24",x"42",x"42",x"00", -- 0x00C0
    x"22",x"22",x"22",x"1C",x"08",x"08",x"08",x"00", -- 0x00C8
    x"7E",x"02",x"04",x"18",x"20",x"40",x"7E",x"00", -- 0x00D0
    x"42",x"18",x"24",x"42",x"7E",x"42",x"42",x"00", -- 0x00D8
    x"42",x"18",x"24",x"42",x"42",x"24",x"18",x"00", -- 0x00E0
    x"18",x"24",x"3C",x"42",x"7E",x"42",x"42",x"00", -- 0x00E8
    x"00",x"08",x"1C",x"2A",x"08",x"08",x"08",x"08", -- 0x00F0
    x"00",x"00",x"10",x"20",x"7F",x"20",x"10",x"00", -- 0x00F8
    x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00", -- 0x0100
    x"08",x"08",x"08",x"08",x"00",x"00",x"08",x"00", -- 0x0108
    x"24",x"24",x"24",x"00",x"00",x"00",x"00",x"00", -- 0x0110
    x"24",x"24",x"7E",x"24",x"7E",x"24",x"24",x"00", -- 0x0118
    x"08",x"1E",x"28",x"1C",x"0A",x"3C",x"08",x"00", -- 0x0120
    x"00",x"62",x"64",x"08",x"10",x"26",x"46",x"00", -- 0x0128
    x"30",x"48",x"48",x"30",x"4A",x"44",x"3A",x"00", -- 0x0130
    x"04",x"08",x"10",x"00",x"00",x"00",x"00",x"00", -- 0x0138
    x"04",x"08",x"10",x"10",x"10",x"08",x"04",x"00", -- 0x0140
    x"20",x"10",x"08",x"08",x"08",x"10",x"20",x"00", -- 0x0148
    x"08",x"2A",x"1C",x"3E",x"1C",x"2A",x"08",x"00", -- 0x0150
    x"00",x"08",x"08",x"3E",x"08",x"08",x"00",x"00", -- 0x0158
    x"00",x"00",x"00",x"00",x"00",x"08",x"08",x"10", -- 0x0160
    x"00",x"00",x"00",x"7E",x"00",x"00",x"00",x"00", -- 0x0168
    x"00",x"00",x"00",x"00",x"00",x"18",x"18",x"00", -- 0x0170
    x"00",x"02",x"04",x"08",x"10",x"20",x"40",x"00", -- 0x0178
    x"3C",x"42",x"46",x"5A",x"62",x"42",x"3C",x"00", -- 0x0180
    x"08",x"18",x"28",x"08",x"08",x"08",x"3E",x"00", -- 0x0188
    x"3C",x"42",x"02",x"0C",x"30",x"40",x"7E",x"00", -- 0x0190
    x"3C",x"42",x"02",x"1C",x"02",x"42",x"3C",x"00", -- 0x0198
    x"04",x"0C",x"14",x"24",x"7E",x"04",x"04",x"00", -- 0x01A0
    x"7E",x"40",x"78",x"04",x"02",x"44",x"38",x"00", -- 0x01A8
    x"1C",x"20",x"40",x"7C",x"42",x"42",x"3C",x"00", -- 0x01B0
    x"7E",x"42",x"04",x"08",x"10",x"10",x"10",x"00", -- 0x01B8
    x"3C",x"42",x"42",x"3C",x"42",x"42",x"3C",x"00", -- 0x01C0
    x"3C",x"42",x"42",x"3E",x"02",x"04",x"38",x"00", -- 0x01C8
    x"00",x"00",x"08",x"00",x"00",x"08",x"00",x"00", -- 0x01D0
    x"00",x"00",x"08",x"00",x"00",x"08",x"08",x"10", -- 0x01D8
    x"0E",x"18",x"30",x"60",x"30",x"18",x"0E",x"00", -- 0x01E0
    x"00",x"00",x"7E",x"00",x"7E",x"00",x"00",x"00", -- 0x01E8
    x"70",x"18",x"0C",x"06",x"0C",x"18",x"70",x"00", -- 0x01F0
    x"3C",x"42",x"02",x"0C",x"10",x"00",x"10",x"00", -- 0x01F8
    x"00",x"00",x"00",x"00",x"FF",x"00",x"00",x"00", -- 0x0200
    x"08",x"1C",x"3E",x"7F",x"7F",x"1C",x"3E",x"00", -- 0x0208
    x"10",x"10",x"10",x"10",x"10",x"10",x"10",x"10", -- 0x0210
    x"00",x"00",x"00",x"FF",x"00",x"00",x"00",x"00", -- 0x0218
    x"00",x"00",x"FF",x"00",x"00",x"00",x"00",x"00", -- 0x0220
    x"00",x"FF",x"00",x"00",x"00",x"00",x"00",x"00", -- 0x0228
    x"00",x"00",x"00",x"00",x"00",x"FF",x"00",x"00", -- 0x0230
    x"20",x"20",x"20",x"20",x"20",x"20",x"20",x"20", -- 0x0238
    x"04",x"04",x"04",x"04",x"04",x"04",x"04",x"04", -- 0x0240
    x"00",x"00",x"00",x"00",x"E0",x"10",x"08",x"08", -- 0x0248
    x"08",x"08",x"08",x"04",x"03",x"00",x"00",x"00", -- 0x0250
    x"08",x"08",x"08",x"10",x"E0",x"00",x"00",x"00", -- 0x0258
    x"80",x"80",x"80",x"80",x"80",x"80",x"80",x"FF", -- 0x0260
    x"80",x"40",x"20",x"10",x"08",x"04",x"02",x"01", -- 0x0268
    x"01",x"02",x"04",x"08",x"10",x"20",x"40",x"80", -- 0x0270
    x"FF",x"80",x"80",x"80",x"80",x"80",x"80",x"80", -- 0x0278
    x"FF",x"01",x"01",x"01",x"01",x"01",x"01",x"01", -- 0x0280
    x"00",x"3C",x"7E",x"7E",x"7E",x"7E",x"3C",x"00", -- 0x0288
    x"00",x"00",x"00",x"00",x"00",x"00",x"FF",x"00", -- 0x0290
    x"36",x"7F",x"7F",x"7F",x"3E",x"1C",x"08",x"00", -- 0x0298
    x"40",x"40",x"40",x"40",x"40",x"40",x"40",x"40", -- 0x02A0
    x"00",x"00",x"00",x"00",x"03",x"04",x"08",x"08", -- 0x02A8
    x"81",x"42",x"24",x"18",x"18",x"24",x"42",x"81", -- 0x02B0
    x"00",x"3C",x"42",x"42",x"42",x"42",x"3C",x"00", -- 0x02B8
    x"08",x"1C",x"2A",x"77",x"2A",x"08",x"08",x"00", -- 0x02C0
    x"02",x"02",x"02",x"02",x"02",x"02",x"02",x"02", -- 0x02C8
    x"08",x"1C",x"3E",x"7F",x"3E",x"1C",x"08",x"00", -- 0x02D0
    x"08",x"08",x"08",x"08",x"FF",x"08",x"08",x"08", -- 0x02D8
    x"A0",x"50",x"A0",x"50",x"A0",x"50",x"A0",x"50", -- 0x02E0
    x"08",x"08",x"08",x"08",x"08",x"08",x"08",x"08", -- 0x02E8
    x"00",x"00",x"01",x"3E",x"54",x"14",x"14",x"00", -- 0x02F0
    x"FF",x"7F",x"3F",x"1F",x"0F",x"07",x"03",x"01", -- 0x02F8
    x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00", -- 0x0300
    x"F0",x"F0",x"F0",x"F0",x"F0",x"F0",x"F0",x"F0", -- 0x0308
    x"00",x"00",x"00",x"00",x"FF",x"FF",x"FF",x"FF", -- 0x0310
    x"FF",x"00",x"00",x"00",x"00",x"00",x"00",x"00", -- 0x0318
    x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"FF", -- 0x0320
    x"80",x"80",x"80",x"80",x"80",x"80",x"80",x"80", -- 0x0328
    x"AA",x"55",x"AA",x"55",x"AA",x"55",x"AA",x"55", -- 0x0330
    x"01",x"01",x"01",x"01",x"01",x"01",x"01",x"01", -- 0x0338
    x"00",x"00",x"00",x"00",x"AA",x"55",x"AA",x"55", -- 0x0340
    x"FF",x"FE",x"FC",x"F8",x"F0",x"E0",x"C0",x"80", -- 0x0348
    x"03",x"03",x"03",x"03",x"03",x"03",x"03",x"03", -- 0x0350
    x"08",x"08",x"08",x"08",x"0F",x"08",x"08",x"08", -- 0x0358
    x"00",x"00",x"00",x"00",x"0F",x"0F",x"0F",x"0F", -- 0x0360
    x"08",x"08",x"08",x"08",x"0F",x"00",x"00",x"00", -- 0x0368
    x"00",x"00",x"00",x"00",x"F8",x"08",x"08",x"08", -- 0x0370
    x"00",x"00",x"00",x"00",x"00",x"00",x"FF",x"FF", -- 0x0378
    x"00",x"00",x"00",x"00",x"0F",x"08",x"08",x"08", -- 0x0380
    x"08",x"08",x"08",x"08",x"FF",x"00",x"00",x"00", -- 0x0388
    x"00",x"00",x"00",x"00",x"FF",x"08",x"08",x"08", -- 0x0390
    x"08",x"08",x"08",x"08",x"F8",x"08",x"08",x"08", -- 0x0398
    x"C0",x"C0",x"C0",x"C0",x"C0",x"C0",x"C0",x"C0", -- 0x03A0
    x"E0",x"E0",x"E0",x"E0",x"E0",x"E0",x"E0",x"E0", -- 0x03A8
    x"07",x"07",x"07",x"07",x"07",x"07",x"07",x"07", -- 0x03B0
    x"FF",x"FF",x"00",x"00",x"00",x"00",x"00",x"00", -- 0x03B8
    x"FF",x"FF",x"FF",x"00",x"00",x"00",x"00",x"00", -- 0x03C0
    x"00",x"00",x"00",x"00",x"00",x"FF",x"FF",x"FF", -- 0x03C8
    x"01",x"01",x"01",x"01",x"01",x"01",x"01",x"FF", -- 0x03D0
    x"00",x"00",x"00",x"00",x"F0",x"F0",x"F0",x"F0", -- 0x03D8
    x"0F",x"0F",x"0F",x"0F",x"00",x"00",x"00",x"00", -- 0x03E0
    x"08",x"08",x"08",x"08",x"F8",x"00",x"00",x"00", -- 0x03E8
    x"F0",x"F0",x"F0",x"F0",x"00",x"00",x"00",x"00", -- 0x03F0
    x"F0",x"F0",x"F0",x"F0",x"0F",x"0F",x"0F",x"0F", -- 0x03F8
    x"E3",x"DD",x"B5",x"A9",x"B3",x"DF",x"E1",x"FF", -- 0x0400
    x"E7",x"DB",x"BD",x"81",x"BD",x"BD",x"BD",x"FF", -- 0x0408
    x"83",x"DD",x"DD",x"C3",x"DD",x"DD",x"83",x"FF", -- 0x0410
    x"E3",x"DD",x"BF",x"BF",x"BF",x"DD",x"E3",x"FF", -- 0x0418
    x"87",x"DB",x"DD",x"DD",x"DD",x"DB",x"87",x"FF", -- 0x0420
    x"81",x"BF",x"BF",x"87",x"BF",x"BF",x"81",x"FF", -- 0x0428
    x"81",x"BF",x"BF",x"87",x"BF",x"BF",x"BF",x"FF", -- 0x0430
    x"E3",x"DD",x"BF",x"B1",x"BD",x"DD",x"E3",x"FF", -- 0x0438
    x"BD",x"BD",x"BD",x"81",x"BD",x"BD",x"BD",x"FF", -- 0x0440
    x"E3",x"F7",x"F7",x"F7",x"F7",x"F7",x"E3",x"FF", -- 0x0448
    x"F1",x"FB",x"FB",x"FB",x"FB",x"BB",x"C7",x"FF", -- 0x0450
    x"BD",x"BB",x"B7",x"8F",x"B7",x"BB",x"BD",x"FF", -- 0x0458
    x"BF",x"BF",x"BF",x"BF",x"BF",x"BF",x"81",x"FF", -- 0x0460
    x"BD",x"99",x"A5",x"A5",x"BD",x"BD",x"BD",x"FF", -- 0x0468
    x"BD",x"9D",x"AD",x"B5",x"B9",x"BD",x"BD",x"FF", -- 0x0470
    x"E7",x"DB",x"BD",x"BD",x"BD",x"DB",x"E7",x"FF", -- 0x0478
    x"83",x"BD",x"BD",x"83",x"BF",x"BF",x"BF",x"FF", -- 0x0480
    x"E7",x"DB",x"BD",x"BD",x"B5",x"DB",x"E5",x"FF", -- 0x0488
    x"83",x"BD",x"BD",x"83",x"B7",x"BB",x"BD",x"FF", -- 0x0490
    x"C3",x"BD",x"BF",x"C3",x"FD",x"BD",x"C3",x"FF", -- 0x0498
    x"C1",x"F7",x"F7",x"F7",x"F7",x"F7",x"F7",x"FF", -- 0x04A0
    x"BD",x"BD",x"BD",x"BD",x"BD",x"BD",x"C3",x"FF", -- 0x04A8
    x"BD",x"BD",x"BD",x"DB",x"DB",x"E7",x"E7",x"FF", -- 0x04B0
    x"BD",x"BD",x"BD",x"A5",x"A5",x"99",x"BD",x"FF", -- 0x04B8
    x"BD",x"BD",x"DB",x"E7",x"DB",x"BD",x"BD",x"FF", -- 0x04C0
    x"DD",x"DD",x"DD",x"E3",x"F7",x"F7",x"F7",x"FF", -- 0x04C8
    x"81",x"FD",x"FB",x"E7",x"DF",x"BF",x"81",x"FF", -- 0x04D0
    x"BD",x"E7",x"DB",x"BD",x"81",x"BD",x"BD",x"FF", -- 0x04D8
    x"BD",x"E7",x"DB",x"BD",x"BD",x"DB",x"E7",x"FF", -- 0x04E0
    x"E7",x"DB",x"C3",x"BD",x"81",x"BD",x"BD",x"FF", -- 0x04E8
    x"FF",x"F7",x"E3",x"D5",x"F7",x"F7",x"F7",x"F7", -- 0x04F0
    x"FF",x"FF",x"EF",x"DF",x"80",x"DF",x"EF",x"FF", -- 0x04F8
    x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0500
    x"F7",x"F7",x"F7",x"F7",x"FF",x"FF",x"F7",x"FF", -- 0x0508
    x"DB",x"DB",x"DB",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0510
    x"DB",x"DB",x"81",x"DB",x"81",x"DB",x"DB",x"FF", -- 0x0518
    x"F7",x"E1",x"D7",x"E3",x"F5",x"C3",x"F7",x"FF", -- 0x0520
    x"FF",x"9D",x"9B",x"F7",x"EF",x"D9",x"B9",x"FF", -- 0x0528
    x"CF",x"B7",x"B7",x"CF",x"B5",x"BB",x"C5",x"FF", -- 0x0530
    x"FB",x"F7",x"EF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0538
    x"FB",x"F7",x"EF",x"EF",x"EF",x"F7",x"FB",x"FF", -- 0x0540
    x"DF",x"EF",x"F7",x"F7",x"F7",x"EF",x"DF",x"FF", -- 0x0548
    x"F7",x"D5",x"E3",x"C1",x"E3",x"D5",x"F7",x"FF", -- 0x0550
    x"FF",x"F7",x"F7",x"C1",x"F7",x"F7",x"FF",x"FF", -- 0x0558
    x"FF",x"FF",x"FF",x"FF",x"FF",x"F7",x"F7",x"EF", -- 0x0560
    x"FF",x"FF",x"FF",x"81",x"FF",x"FF",x"FF",x"FF", -- 0x0568
    x"FF",x"FF",x"FF",x"FF",x"FF",x"E7",x"E7",x"FF", -- 0x0570
    x"FF",x"FD",x"FB",x"F7",x"EF",x"DF",x"BF",x"FF", -- 0x0578
    x"C3",x"BD",x"B9",x"A5",x"9D",x"BD",x"C3",x"FF", -- 0x0580
    x"F7",x"E7",x"D7",x"F7",x"F7",x"F7",x"C1",x"FF", -- 0x0588
    x"C3",x"BD",x"FD",x"F3",x"CF",x"BF",x"81",x"FF", -- 0x0590
    x"C3",x"BD",x"FD",x"E3",x"FD",x"BD",x"C3",x"FF", -- 0x0598
    x"FB",x"F3",x"EB",x"DB",x"81",x"FB",x"FB",x"FF", -- 0x05A0
    x"81",x"BF",x"87",x"FB",x"FD",x"BB",x"C7",x"FF", -- 0x05A8
    x"E3",x"DF",x"BF",x"83",x"BD",x"BD",x"C3",x"FF", -- 0x05B0
    x"81",x"BD",x"FB",x"F7",x"EF",x"EF",x"EF",x"FF", -- 0x05B8
    x"C3",x"BD",x"BD",x"C3",x"BD",x"BD",x"C3",x"FF", -- 0x05C0
    x"C3",x"BD",x"BD",x"C1",x"FD",x"FB",x"C7",x"FF", -- 0x05C8
    x"FF",x"FF",x"F7",x"FF",x"FF",x"F7",x"FF",x"FF", -- 0x05D0
    x"FF",x"FF",x"F7",x"FF",x"FF",x"F7",x"F7",x"EF", -- 0x05D8
    x"F1",x"E7",x"CF",x"9F",x"CF",x"E7",x"F1",x"FF", -- 0x05E0
    x"FF",x"FF",x"81",x"FF",x"81",x"FF",x"FF",x"FF", -- 0x05E8
    x"8F",x"E7",x"F3",x"F9",x"F3",x"E7",x"8F",x"FF", -- 0x05F0
    x"C3",x"BD",x"FD",x"F3",x"EF",x"FF",x"EF",x"FF", -- 0x05F8
    x"FF",x"FF",x"FF",x"FF",x"00",x"FF",x"FF",x"FF", -- 0x0600
    x"F7",x"E3",x"C1",x"80",x"80",x"E3",x"C1",x"FF", -- 0x0608
    x"EF",x"EF",x"EF",x"EF",x"EF",x"EF",x"EF",x"EF", -- 0x0610
    x"FF",x"FF",x"FF",x"00",x"FF",x"FF",x"FF",x"FF", -- 0x0618
    x"FF",x"FF",x"00",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0620
    x"FF",x"00",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0628
    x"FF",x"FF",x"FF",x"FF",x"FF",x"00",x"FF",x"FF", -- 0x0630
    x"DF",x"DF",x"DF",x"DF",x"DF",x"DF",x"DF",x"DF", -- 0x0638
    x"FB",x"FB",x"FB",x"FB",x"FB",x"FB",x"FB",x"FB", -- 0x0640
    x"FF",x"FF",x"FF",x"FF",x"1F",x"EF",x"F7",x"F7", -- 0x0648
    x"F7",x"F7",x"F7",x"FB",x"FC",x"FF",x"FF",x"FF", -- 0x0650
    x"F7",x"F7",x"F7",x"EF",x"1F",x"FF",x"FF",x"FF", -- 0x0658
    x"7F",x"7F",x"7F",x"7F",x"7F",x"7F",x"7F",x"00", -- 0x0660
    x"7F",x"BF",x"DF",x"EF",x"F7",x"FB",x"FD",x"FE", -- 0x0668
    x"FE",x"FD",x"FB",x"F7",x"EF",x"DF",x"BF",x"7F", -- 0x0670
    x"00",x"7F",x"7F",x"7F",x"7F",x"7F",x"7F",x"7F", -- 0x0678
    x"00",x"FE",x"FE",x"FE",x"FE",x"FE",x"FE",x"FE", -- 0x0680
    x"FF",x"C3",x"81",x"81",x"81",x"81",x"C3",x"FF", -- 0x0688
    x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"00",x"FF", -- 0x0690
    x"C9",x"80",x"80",x"80",x"C1",x"E3",x"F7",x"FF", -- 0x0698
    x"BF",x"BF",x"BF",x"BF",x"BF",x"BF",x"BF",x"BF", -- 0x06A0
    x"FF",x"FF",x"FF",x"FF",x"FC",x"FB",x"F7",x"F7", -- 0x06A8
    x"7E",x"BD",x"DB",x"E7",x"E7",x"DB",x"BD",x"7E", -- 0x06B0
    x"FF",x"C3",x"BD",x"BD",x"BD",x"BD",x"C3",x"FF", -- 0x06B8
    x"F7",x"E3",x"D5",x"88",x"D5",x"F7",x"F7",x"FF", -- 0x06C0
    x"FD",x"FD",x"FD",x"FD",x"FD",x"FD",x"FD",x"FD", -- 0x06C8
    x"F7",x"E3",x"C1",x"80",x"C1",x"E3",x"F7",x"FF", -- 0x06D0
    x"F7",x"F7",x"F7",x"F7",x"00",x"F7",x"F7",x"F7", -- 0x06D8
    x"5F",x"AF",x"5F",x"AF",x"5F",x"AF",x"5F",x"AF", -- 0x06E0
    x"F7",x"F7",x"F7",x"F7",x"F7",x"F7",x"F7",x"F7", -- 0x06E8
    x"FF",x"FF",x"FE",x"C1",x"AB",x"EB",x"EB",x"FF", -- 0x06F0
    x"00",x"80",x"C0",x"E0",x"F0",x"F8",x"FC",x"FE", -- 0x06F8
    x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0700
    x"0F",x"0F",x"0F",x"0F",x"0F",x"0F",x"0F",x"0F", -- 0x0708
    x"FF",x"FF",x"FF",x"FF",x"00",x"00",x"00",x"00", -- 0x0710
    x"00",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0718
    x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"00", -- 0x0720
    x"7F",x"7F",x"7F",x"7F",x"7F",x"7F",x"7F",x"7F", -- 0x0728
    x"55",x"AA",x"55",x"AA",x"55",x"AA",x"55",x"AA", -- 0x0730
    x"FE",x"FE",x"FE",x"FE",x"FE",x"FE",x"FE",x"FE", -- 0x0738
    x"FF",x"FF",x"FF",x"FF",x"55",x"AA",x"55",x"AA", -- 0x0740
    x"00",x"01",x"03",x"07",x"0F",x"1F",x"3F",x"7F", -- 0x0748
    x"FC",x"FC",x"FC",x"FC",x"FC",x"FC",x"FC",x"FC", -- 0x0750
    x"F7",x"F7",x"F7",x"F7",x"F0",x"F7",x"F7",x"F7", -- 0x0758
    x"FF",x"FF",x"FF",x"FF",x"F0",x"F0",x"F0",x"F0", -- 0x0760
    x"F7",x"F7",x"F7",x"F7",x"F0",x"FF",x"FF",x"FF", -- 0x0768
    x"FF",x"FF",x"FF",x"FF",x"07",x"F7",x"F7",x"F7", -- 0x0770
    x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"00",x"00", -- 0x0778
    x"FF",x"FF",x"FF",x"FF",x"F0",x"F7",x"F7",x"F7", -- 0x0780
    x"F7",x"F7",x"F7",x"F7",x"00",x"FF",x"FF",x"FF", -- 0x0788
    x"FF",x"FF",x"FF",x"FF",x"00",x"F7",x"F7",x"F7", -- 0x0790
    x"F7",x"F7",x"F7",x"F7",x"07",x"F7",x"F7",x"F7", -- 0x0798
    x"3F",x"3F",x"3F",x"3F",x"3F",x"3F",x"3F",x"3F", -- 0x07A0
    x"1F",x"1F",x"1F",x"1F",x"1F",x"1F",x"1F",x"1F", -- 0x07A8
    x"F8",x"F8",x"F8",x"F8",x"F8",x"F8",x"F8",x"F8", -- 0x07B0
    x"00",x"00",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x07B8
    x"00",x"00",x"00",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x07C0
    x"FF",x"FF",x"FF",x"FF",x"FF",x"00",x"00",x"00", -- 0x07C8
    x"FE",x"FE",x"FE",x"FE",x"FE",x"FE",x"FE",x"00", -- 0x07D0
    x"FF",x"FF",x"FF",x"FF",x"0F",x"0F",x"0F",x"0F", -- 0x07D8
    x"F0",x"F0",x"F0",x"F0",x"FF",x"FF",x"FF",x"FF", -- 0x07E0
    x"F7",x"F7",x"F7",x"F7",x"07",x"FF",x"FF",x"FF", -- 0x07E8
    x"0F",x"0F",x"0F",x"0F",x"FF",x"FF",x"FF",x"FF", -- 0x07F0
    x"0F",x"0F",x"0F",x"0F",x"F0",x"F0",x"F0",x"F0", -- 0x07F8
    x"1C",x"22",x"4A",x"56",x"4C",x"20",x"1E",x"00", -- 0x0800
    x"00",x"00",x"38",x"04",x"3C",x"44",x"3A",x"00", -- 0x0808
    x"40",x"40",x"5C",x"62",x"42",x"62",x"5C",x"00", -- 0x0810
    x"00",x"00",x"3C",x"42",x"40",x"42",x"3C",x"00", -- 0x0818
    x"02",x"02",x"3A",x"46",x"42",x"46",x"3A",x"00", -- 0x0820
    x"00",x"00",x"3C",x"42",x"7E",x"40",x"3C",x"00", -- 0x0828
    x"0C",x"12",x"10",x"7C",x"10",x"10",x"10",x"00", -- 0x0830
    x"00",x"00",x"3A",x"46",x"46",x"3A",x"02",x"3C", -- 0x0838
    x"40",x"40",x"5C",x"62",x"42",x"42",x"42",x"00", -- 0x0840
    x"08",x"00",x"18",x"08",x"08",x"08",x"1C",x"00", -- 0x0848
    x"04",x"00",x"0C",x"04",x"04",x"04",x"44",x"38", -- 0x0850
    x"40",x"40",x"44",x"48",x"50",x"68",x"44",x"00", -- 0x0858
    x"18",x"08",x"08",x"08",x"08",x"08",x"1C",x"00", -- 0x0860
    x"00",x"00",x"76",x"49",x"49",x"49",x"49",x"00", -- 0x0868
    x"00",x"00",x"5C",x"62",x"42",x"42",x"42",x"00", -- 0x0870
    x"00",x"00",x"3C",x"42",x"42",x"42",x"3C",x"00", -- 0x0878
    x"00",x"00",x"5C",x"62",x"62",x"5C",x"40",x"40", -- 0x0880
    x"00",x"00",x"3A",x"46",x"46",x"3A",x"02",x"02", -- 0x0888
    x"00",x"00",x"5C",x"62",x"40",x"40",x"40",x"00", -- 0x0890
    x"00",x"00",x"3E",x"40",x"3C",x"02",x"7C",x"00", -- 0x0898
    x"10",x"10",x"7C",x"10",x"10",x"12",x"0C",x"00", -- 0x08A0
    x"00",x"00",x"42",x"42",x"42",x"46",x"3A",x"00", -- 0x08A8
    x"00",x"00",x"42",x"42",x"42",x"24",x"18",x"00", -- 0x08B0
    x"00",x"00",x"41",x"49",x"49",x"49",x"36",x"00", -- 0x08B8
    x"00",x"00",x"42",x"24",x"18",x"24",x"42",x"00", -- 0x08C0
    x"00",x"00",x"42",x"42",x"46",x"3A",x"02",x"3C", -- 0x08C8
    x"00",x"00",x"7E",x"04",x"18",x"20",x"7E",x"00", -- 0x08D0
    x"24",x"00",x"38",x"04",x"3C",x"44",x"3A",x"00", -- 0x08D8
    x"24",x"00",x"3C",x"42",x"42",x"42",x"3C",x"00", -- 0x08E0
    x"38",x"28",x"38",x"04",x"3C",x"44",x"3A",x"00", -- 0x08E8
    x"00",x"08",x"1C",x"2A",x"08",x"08",x"08",x"08", -- 0x08F0
    x"00",x"00",x"10",x"20",x"7F",x"20",x"10",x"00", -- 0x08F8
    x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00", -- 0x0900
    x"08",x"08",x"08",x"08",x"00",x"00",x"08",x"00", -- 0x0908
    x"24",x"24",x"24",x"00",x"00",x"00",x"00",x"00", -- 0x0910
    x"24",x"24",x"7E",x"24",x"7E",x"24",x"24",x"00", -- 0x0918
    x"08",x"1E",x"28",x"1C",x"0A",x"3C",x"08",x"00", -- 0x0920
    x"00",x"62",x"64",x"08",x"10",x"26",x"46",x"00", -- 0x0928
    x"30",x"48",x"48",x"30",x"4A",x"44",x"3A",x"00", -- 0x0930
    x"04",x"08",x"10",x"00",x"00",x"00",x"00",x"00", -- 0x0938
    x"04",x"08",x"10",x"10",x"10",x"08",x"04",x"00", -- 0x0940
    x"20",x"10",x"08",x"08",x"08",x"10",x"20",x"00", -- 0x0948
    x"08",x"2A",x"1C",x"3E",x"1C",x"2A",x"08",x"00", -- 0x0950
    x"00",x"08",x"08",x"3E",x"08",x"08",x"00",x"00", -- 0x0958
    x"00",x"00",x"00",x"00",x"00",x"08",x"08",x"10", -- 0x0960
    x"00",x"00",x"00",x"7E",x"00",x"00",x"00",x"00", -- 0x0968
    x"00",x"00",x"00",x"00",x"00",x"18",x"18",x"00", -- 0x0970
    x"00",x"02",x"04",x"08",x"10",x"20",x"40",x"00", -- 0x0978
    x"3C",x"42",x"46",x"5A",x"62",x"42",x"3C",x"00", -- 0x0980
    x"08",x"18",x"28",x"08",x"08",x"08",x"3E",x"00", -- 0x0988
    x"3C",x"42",x"02",x"0C",x"30",x"40",x"7E",x"00", -- 0x0990
    x"3C",x"42",x"02",x"1C",x"02",x"42",x"3C",x"00", -- 0x0998
    x"04",x"0C",x"14",x"24",x"7E",x"04",x"04",x"00", -- 0x09A0
    x"7E",x"40",x"78",x"04",x"02",x"44",x"38",x"00", -- 0x09A8
    x"1C",x"20",x"40",x"7C",x"42",x"42",x"3C",x"00", -- 0x09B0
    x"7E",x"42",x"04",x"08",x"10",x"10",x"10",x"00", -- 0x09B8
    x"3C",x"42",x"42",x"3C",x"42",x"42",x"3C",x"00", -- 0x09C0
    x"3C",x"42",x"42",x"3E",x"02",x"04",x"38",x"00", -- 0x09C8
    x"00",x"00",x"08",x"00",x"00",x"08",x"00",x"00", -- 0x09D0
    x"00",x"00",x"08",x"00",x"00",x"08",x"08",x"10", -- 0x09D8
    x"0E",x"18",x"30",x"60",x"30",x"18",x"0E",x"00", -- 0x09E0
    x"00",x"00",x"7E",x"00",x"7E",x"00",x"00",x"00", -- 0x09E8
    x"70",x"18",x"0C",x"06",x"0C",x"18",x"70",x"00", -- 0x09F0
    x"3C",x"42",x"02",x"0C",x"10",x"00",x"10",x"00", -- 0x09F8
    x"00",x"00",x"00",x"00",x"FF",x"00",x"00",x"00", -- 0x0A00
    x"18",x"24",x"42",x"7E",x"42",x"42",x"42",x"00", -- 0x0A08
    x"7C",x"22",x"22",x"3C",x"22",x"22",x"7C",x"00", -- 0x0A10
    x"1C",x"22",x"40",x"40",x"40",x"22",x"1C",x"00", -- 0x0A18
    x"78",x"24",x"22",x"22",x"22",x"24",x"78",x"00", -- 0x0A20
    x"7E",x"40",x"40",x"78",x"40",x"40",x"7E",x"00", -- 0x0A28
    x"7E",x"40",x"40",x"78",x"40",x"40",x"40",x"00", -- 0x0A30
    x"1C",x"22",x"40",x"4E",x"42",x"22",x"1C",x"00", -- 0x0A38
    x"42",x"42",x"42",x"7E",x"42",x"42",x"42",x"00", -- 0x0A40
    x"1C",x"08",x"08",x"08",x"08",x"08",x"1C",x"00", -- 0x0A48
    x"0E",x"04",x"04",x"04",x"04",x"44",x"38",x"00", -- 0x0A50
    x"42",x"44",x"48",x"70",x"48",x"44",x"42",x"00", -- 0x0A58
    x"40",x"40",x"40",x"40",x"40",x"40",x"7E",x"00", -- 0x0A60
    x"42",x"66",x"5A",x"5A",x"42",x"42",x"42",x"00", -- 0x0A68
    x"42",x"62",x"52",x"4A",x"46",x"42",x"42",x"00", -- 0x0A70
    x"18",x"24",x"42",x"42",x"42",x"24",x"18",x"00", -- 0x0A78
    x"7C",x"42",x"42",x"7C",x"40",x"40",x"40",x"00", -- 0x0A80
    x"18",x"24",x"42",x"42",x"4A",x"24",x"1A",x"00", -- 0x0A88
    x"7C",x"42",x"42",x"7C",x"48",x"44",x"42",x"00", -- 0x0A90
    x"3C",x"42",x"40",x"3C",x"02",x"42",x"3C",x"00", -- 0x0A98
    x"3E",x"08",x"08",x"08",x"08",x"08",x"08",x"00", -- 0x0AA0
    x"42",x"42",x"42",x"42",x"42",x"42",x"3C",x"00", -- 0x0AA8
    x"42",x"42",x"42",x"24",x"24",x"18",x"18",x"00", -- 0x0AB0
    x"42",x"42",x"42",x"5A",x"5A",x"66",x"42",x"00", -- 0x0AB8
    x"42",x"42",x"24",x"18",x"24",x"42",x"42",x"00", -- 0x0AC0
    x"22",x"22",x"22",x"1C",x"08",x"08",x"08",x"00", -- 0x0AC8
    x"7E",x"02",x"04",x"18",x"20",x"40",x"7E",x"00", -- 0x0AD0
    x"42",x"18",x"24",x"42",x"7E",x"42",x"42",x"00", -- 0x0AD8
    x"42",x"18",x"24",x"42",x"42",x"24",x"18",x"00", -- 0x0AE0
    x"18",x"24",x"3C",x"42",x"7E",x"42",x"42",x"00", -- 0x0AE8
    x"CC",x"CC",x"33",x"33",x"CC",x"CC",x"33",x"33", -- 0x0AF0
    x"CC",x"66",x"33",x"99",x"CC",x"66",x"33",x"99", -- 0x0AF8
    x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00", -- 0x0B00
    x"F0",x"F0",x"F0",x"F0",x"F0",x"F0",x"F0",x"F0", -- 0x0B08
    x"00",x"00",x"00",x"00",x"FF",x"FF",x"FF",x"FF", -- 0x0B10
    x"FF",x"00",x"00",x"00",x"00",x"00",x"00",x"00", -- 0x0B18
    x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"FF", -- 0x0B20
    x"80",x"80",x"80",x"80",x"80",x"80",x"80",x"80", -- 0x0B28
    x"AA",x"55",x"AA",x"55",x"AA",x"55",x"AA",x"55", -- 0x0B30
    x"01",x"01",x"01",x"01",x"01",x"01",x"01",x"01", -- 0x0B38
    x"00",x"00",x"00",x"00",x"AA",x"55",x"AA",x"55", -- 0x0B40
    x"99",x"33",x"66",x"CC",x"99",x"33",x"66",x"CC", -- 0x0B48
    x"03",x"03",x"03",x"03",x"03",x"03",x"03",x"03", -- 0x0B50
    x"08",x"08",x"08",x"08",x"0F",x"08",x"08",x"08", -- 0x0B58
    x"00",x"00",x"00",x"00",x"0F",x"0F",x"0F",x"0F", -- 0x0B60
    x"08",x"08",x"08",x"08",x"0F",x"00",x"00",x"00", -- 0x0B68
    x"00",x"00",x"00",x"00",x"F8",x"08",x"08",x"08", -- 0x0B70
    x"00",x"00",x"00",x"00",x"00",x"00",x"FF",x"FF", -- 0x0B78
    x"00",x"00",x"00",x"00",x"0F",x"08",x"08",x"08", -- 0x0B80
    x"08",x"08",x"08",x"08",x"FF",x"00",x"00",x"00", -- 0x0B88
    x"00",x"00",x"00",x"00",x"FF",x"08",x"08",x"08", -- 0x0B90
    x"08",x"08",x"08",x"08",x"F8",x"08",x"08",x"08", -- 0x0B98
    x"C0",x"C0",x"C0",x"C0",x"C0",x"C0",x"C0",x"C0", -- 0x0BA0
    x"E0",x"E0",x"E0",x"E0",x"E0",x"E0",x"E0",x"E0", -- 0x0BA8
    x"07",x"07",x"07",x"07",x"07",x"07",x"07",x"07", -- 0x0BB0
    x"FF",x"FF",x"00",x"00",x"00",x"00",x"00",x"00", -- 0x0BB8
    x"FF",x"FF",x"FF",x"00",x"00",x"00",x"00",x"00", -- 0x0BC0
    x"00",x"00",x"00",x"00",x"00",x"FF",x"FF",x"FF", -- 0x0BC8
    x"01",x"02",x"44",x"48",x"50",x"60",x"40",x"00", -- 0x0BD0
    x"00",x"00",x"00",x"00",x"F0",x"F0",x"F0",x"F0", -- 0x0BD8
    x"0F",x"0F",x"0F",x"0F",x"00",x"00",x"00",x"00", -- 0x0BE0
    x"08",x"08",x"08",x"08",x"F8",x"00",x"00",x"00", -- 0x0BE8
    x"F0",x"F0",x"F0",x"F0",x"00",x"00",x"00",x"00", -- 0x0BF0
    x"F0",x"F0",x"F0",x"F0",x"0F",x"0F",x"0F",x"0F", -- 0x0BF8
    x"E3",x"DD",x"B5",x"A9",x"B3",x"DF",x"E1",x"FF", -- 0x0C00
    x"FF",x"FF",x"C7",x"FB",x"C3",x"BB",x"C5",x"FF", -- 0x0C08
    x"BF",x"BF",x"A3",x"9D",x"BD",x"9D",x"A3",x"FF", -- 0x0C10
    x"FF",x"FF",x"C3",x"BD",x"BF",x"BD",x"C3",x"FF", -- 0x0C18
    x"FD",x"FD",x"C5",x"B9",x"BD",x"B9",x"C5",x"FF", -- 0x0C20
    x"FF",x"FF",x"C3",x"BD",x"81",x"BF",x"C3",x"FF", -- 0x0C28
    x"F3",x"ED",x"EF",x"83",x"EF",x"EF",x"EF",x"FF", -- 0x0C30
    x"FF",x"FF",x"C5",x"B9",x"B9",x"C5",x"FD",x"C3", -- 0x0C38
    x"BF",x"BF",x"A3",x"9D",x"BD",x"BD",x"BD",x"FF", -- 0x0C40
    x"F7",x"FF",x"E7",x"F7",x"F7",x"F7",x"E3",x"FF", -- 0x0C48
    x"FB",x"FF",x"F3",x"FB",x"FB",x"FB",x"BB",x"C7", -- 0x0C50
    x"BF",x"BF",x"BB",x"B7",x"AF",x"97",x"BB",x"FF", -- 0x0C58
    x"E7",x"F7",x"F7",x"F7",x"F7",x"F7",x"E3",x"FF", -- 0x0C60
    x"FF",x"FF",x"89",x"B6",x"B6",x"B6",x"B6",x"FF", -- 0x0C68
    x"FF",x"FF",x"A3",x"9D",x"BD",x"BD",x"BD",x"FF", -- 0x0C70
    x"FF",x"FF",x"C3",x"BD",x"BD",x"BD",x"C3",x"FF", -- 0x0C78
    x"FF",x"FF",x"A3",x"9D",x"9D",x"A3",x"BF",x"BF", -- 0x0C80
    x"FF",x"FF",x"C5",x"B9",x"B9",x"C5",x"FD",x"FD", -- 0x0C88
    x"FF",x"FF",x"A3",x"9D",x"BF",x"BF",x"BF",x"FF", -- 0x0C90
    x"FF",x"FF",x"C1",x"BF",x"C3",x"FD",x"83",x"FF", -- 0x0C98
    x"EF",x"EF",x"83",x"EF",x"EF",x"ED",x"F3",x"FF", -- 0x0CA0
    x"FF",x"FF",x"BD",x"BD",x"BD",x"B9",x"C5",x"FF", -- 0x0CA8
    x"FF",x"FF",x"BD",x"BD",x"BD",x"DB",x"E7",x"FF", -- 0x0CB0
    x"FF",x"FF",x"BE",x"B6",x"B6",x"B6",x"C9",x"FF", -- 0x0CB8
    x"FF",x"FF",x"BD",x"DB",x"E7",x"DB",x"BD",x"FF", -- 0x0CC0
    x"FF",x"FF",x"BD",x"BD",x"B9",x"C5",x"FD",x"C3", -- 0x0CC8
    x"FF",x"FF",x"81",x"FB",x"E7",x"DF",x"81",x"FF", -- 0x0CD0
    x"DB",x"FF",x"C7",x"FB",x"C3",x"BB",x"C5",x"FF", -- 0x0CD8
    x"DB",x"FF",x"C3",x"BD",x"BD",x"DB",x"C3",x"FF", -- 0x0CE0
    x"C7",x"D7",x"C7",x"FB",x"C3",x"BB",x"C5",x"FF", -- 0x0CE8
    x"FF",x"F7",x"E3",x"D5",x"F7",x"F7",x"F7",x"F7", -- 0x0CF0
    x"FF",x"FF",x"EF",x"DF",x"80",x"DF",x"EF",x"FF", -- 0x0CF8
    x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0D00
    x"F7",x"F7",x"F7",x"F7",x"FF",x"FF",x"F7",x"FF", -- 0x0D08
    x"DB",x"DB",x"DB",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0D10
    x"DB",x"DB",x"81",x"DB",x"81",x"DB",x"DB",x"FF", -- 0x0D18
    x"F7",x"E1",x"D7",x"E3",x"F5",x"C3",x"F7",x"FF", -- 0x0D20
    x"FF",x"9D",x"9B",x"F7",x"EF",x"D9",x"B9",x"FF", -- 0x0D28
    x"CF",x"B7",x"B7",x"CF",x"B5",x"BB",x"C5",x"FF", -- 0x0D30
    x"FB",x"F7",x"EF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0D38
    x"FB",x"F7",x"EF",x"EF",x"EF",x"F7",x"FB",x"FF", -- 0x0D40
    x"DF",x"EF",x"F7",x"F7",x"F7",x"EF",x"DF",x"FF", -- 0x0D48
    x"F7",x"D5",x"E3",x"C1",x"E3",x"D5",x"F7",x"FF", -- 0x0D50
    x"FF",x"F7",x"F7",x"C1",x"F7",x"F7",x"FF",x"FF", -- 0x0D58
    x"FF",x"FF",x"FF",x"FF",x"FF",x"F7",x"F7",x"EF", -- 0x0D60
    x"FF",x"FF",x"FF",x"81",x"FF",x"FF",x"FF",x"FF", -- 0x0D68
    x"FF",x"FF",x"FF",x"FF",x"FF",x"E7",x"E7",x"FF", -- 0x0D70
    x"FF",x"FD",x"FB",x"F7",x"EF",x"DF",x"BF",x"FF", -- 0x0D78
    x"C3",x"BD",x"B9",x"A5",x"9D",x"BD",x"C3",x"FF", -- 0x0D80
    x"F7",x"E7",x"D7",x"F7",x"F7",x"F7",x"C1",x"FF", -- 0x0D88
    x"C3",x"BD",x"FD",x"F3",x"CF",x"BF",x"81",x"FF", -- 0x0D90
    x"C3",x"BD",x"FD",x"E3",x"FD",x"BD",x"C3",x"FF", -- 0x0D98
    x"FB",x"F3",x"EB",x"DB",x"81",x"FB",x"FB",x"FF", -- 0x0DA0
    x"81",x"BF",x"87",x"FB",x"FD",x"BB",x"C7",x"FF", -- 0x0DA8
    x"E3",x"DF",x"BF",x"83",x"BD",x"BD",x"C3",x"FF", -- 0x0DB0
    x"81",x"BD",x"FB",x"F7",x"EF",x"EF",x"EF",x"FF", -- 0x0DB8
    x"C3",x"BD",x"BD",x"C3",x"BD",x"BD",x"C3",x"FF", -- 0x0DC0
    x"C3",x"BD",x"BD",x"C1",x"FD",x"FB",x"C7",x"FF", -- 0x0DC8
    x"FF",x"FF",x"F7",x"FF",x"FF",x"F7",x"FF",x"FF", -- 0x0DD0
    x"FF",x"FF",x"F7",x"FF",x"FF",x"F7",x"F7",x"EF", -- 0x0DD8
    x"F1",x"E7",x"CF",x"9F",x"CF",x"E7",x"F1",x"FF", -- 0x0DE0
    x"FF",x"FF",x"81",x"FF",x"81",x"FF",x"FF",x"FF", -- 0x0DE8
    x"8F",x"E7",x"F3",x"F9",x"F3",x"E7",x"8F",x"FF", -- 0x0DF0
    x"C3",x"BD",x"FD",x"F3",x"EF",x"FF",x"EF",x"FF", -- 0x0DF8
    x"FF",x"FF",x"FF",x"FF",x"00",x"FF",x"FF",x"FF", -- 0x0E00
    x"E7",x"DB",x"BD",x"81",x"BD",x"BD",x"BD",x"FF", -- 0x0E08
    x"83",x"DD",x"DD",x"C3",x"DD",x"DD",x"83",x"FF", -- 0x0E10
    x"E3",x"DD",x"BF",x"BF",x"BF",x"DD",x"E3",x"FF", -- 0x0E18
    x"87",x"DB",x"DD",x"DD",x"DD",x"DB",x"87",x"FF", -- 0x0E20
    x"81",x"BF",x"BF",x"87",x"BF",x"BF",x"81",x"FF", -- 0x0E28
    x"81",x"BF",x"BF",x"87",x"BF",x"BF",x"BF",x"FF", -- 0x0E30
    x"E3",x"DD",x"BF",x"B1",x"BD",x"DD",x"E3",x"FF", -- 0x0E38
    x"BD",x"BD",x"BD",x"81",x"BD",x"BD",x"BD",x"FF", -- 0x0E40
    x"E3",x"F7",x"F7",x"F7",x"F7",x"F7",x"E3",x"FF", -- 0x0E48
    x"F1",x"FB",x"FB",x"FB",x"FB",x"BB",x"C7",x"FF", -- 0x0E50
    x"BD",x"BB",x"B7",x"8F",x"B7",x"BB",x"BD",x"FF", -- 0x0E58
    x"BF",x"BF",x"BF",x"BF",x"BF",x"BF",x"81",x"FF", -- 0x0E60
    x"BD",x"99",x"A5",x"A5",x"BD",x"BD",x"BD",x"FF", -- 0x0E68
    x"BD",x"9D",x"AD",x"B5",x"B9",x"BD",x"BD",x"FF", -- 0x0E70
    x"E7",x"DB",x"BD",x"BD",x"BD",x"DB",x"E7",x"FF", -- 0x0E78
    x"83",x"BD",x"BD",x"83",x"BF",x"BF",x"BF",x"FF", -- 0x0E80
    x"E7",x"DB",x"BD",x"BD",x"B5",x"DB",x"E5",x"FF", -- 0x0E88
    x"83",x"BD",x"BD",x"83",x"B7",x"BB",x"BD",x"FF", -- 0x0E90
    x"C3",x"BD",x"BF",x"C3",x"FD",x"BD",x"C3",x"FF", -- 0x0E98
    x"C1",x"F7",x"F7",x"F7",x"F7",x"F7",x"F7",x"FF", -- 0x0EA0
    x"BD",x"BD",x"BD",x"BD",x"BD",x"BD",x"C3",x"FF", -- 0x0EA8
    x"BD",x"BD",x"BD",x"DB",x"DB",x"E7",x"E7",x"FF", -- 0x0EB0
    x"BD",x"BD",x"BD",x"A5",x"A5",x"99",x"BD",x"FF", -- 0x0EB8
    x"BD",x"BD",x"DB",x"E7",x"DB",x"BD",x"BD",x"FF", -- 0x0EC0
    x"DD",x"DD",x"DD",x"E3",x"F7",x"F7",x"F7",x"FF", -- 0x0EC8
    x"81",x"FD",x"FB",x"E7",x"DF",x"BF",x"81",x"FF", -- 0x0ED0
    x"BD",x"E7",x"DB",x"BD",x"81",x"BD",x"BD",x"FF", -- 0x0ED8
    x"BD",x"E7",x"DB",x"BD",x"BD",x"DB",x"E7",x"FF", -- 0x0EE0
    x"E7",x"DB",x"C3",x"BD",x"81",x"BD",x"BD",x"FF", -- 0x0EE8
    x"33",x"33",x"CC",x"CC",x"33",x"33",x"CC",x"CC", -- 0x0EF0
    x"33",x"99",x"CC",x"66",x"33",x"99",x"CC",x"66", -- 0x0EF8
    x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0F00
    x"0F",x"0F",x"0F",x"0F",x"0F",x"0F",x"0F",x"0F", -- 0x0F08
    x"FF",x"FF",x"FF",x"FF",x"00",x"00",x"00",x"00", -- 0x0F10
    x"00",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0F18
    x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"00", -- 0x0F20
    x"7F",x"7F",x"7F",x"7F",x"7F",x"7F",x"7F",x"7F", -- 0x0F28
    x"55",x"AA",x"55",x"AA",x"55",x"AA",x"55",x"AA", -- 0x0F30
    x"FE",x"FE",x"FE",x"FE",x"FE",x"FE",x"FE",x"FE", -- 0x0F38
    x"FF",x"FF",x"FF",x"FF",x"55",x"AA",x"55",x"AA", -- 0x0F40
    x"66",x"CC",x"99",x"33",x"66",x"CC",x"99",x"33", -- 0x0F48
    x"FC",x"FC",x"FC",x"FC",x"FC",x"FC",x"FC",x"FC", -- 0x0F50
    x"F7",x"F7",x"F7",x"F7",x"F0",x"F7",x"F7",x"F7", -- 0x0F58
    x"FF",x"FF",x"FF",x"FF",x"F0",x"F0",x"F0",x"F0", -- 0x0F60
    x"F7",x"F7",x"F7",x"F7",x"F0",x"FF",x"FF",x"FF", -- 0x0F68
    x"FF",x"FF",x"FF",x"FF",x"07",x"F7",x"F7",x"F7", -- 0x0F70
    x"FF",x"FF",x"FF",x"FF",x"FF",x"FF",x"00",x"00", -- 0x0F78
    x"FF",x"FF",x"FF",x"FF",x"F0",x"F7",x"F7",x"F7", -- 0x0F80
    x"F7",x"F7",x"F7",x"F7",x"00",x"FF",x"FF",x"FF", -- 0x0F88
    x"FF",x"FF",x"FF",x"FF",x"00",x"F7",x"F7",x"F7", -- 0x0F90
    x"F7",x"F7",x"F7",x"F7",x"07",x"F7",x"F7",x"F7", -- 0x0F98
    x"3F",x"3F",x"3F",x"3F",x"3F",x"3F",x"3F",x"3F", -- 0x0FA0
    x"1F",x"1F",x"1F",x"1F",x"1F",x"1F",x"1F",x"1F", -- 0x0FA8
    x"F8",x"F8",x"F8",x"F8",x"F8",x"F8",x"F8",x"F8", -- 0x0FB0
    x"00",x"00",x"FF",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0FB8
    x"00",x"00",x"00",x"FF",x"FF",x"FF",x"FF",x"FF", -- 0x0FC0
    x"FF",x"FF",x"FF",x"FF",x"FF",x"00",x"00",x"00", -- 0x0FC8
    x"FE",x"FD",x"BB",x"B7",x"AF",x"9F",x"BF",x"FF", -- 0x0FD0
    x"FF",x"FF",x"FF",x"FF",x"0F",x"0F",x"0F",x"0F", -- 0x0FD8
    x"F0",x"F0",x"F0",x"F0",x"FF",x"FF",x"FF",x"FF", -- 0x0FE0
    x"F7",x"F7",x"F7",x"F7",x"07",x"FF",x"FF",x"FF", -- 0x0FE8
    x"0F",x"0F",x"0F",x"0F",x"FF",x"FF",x"FF",x"FF", -- 0x0FF0
    x"0F",x"0F",x"0F",x"0F",x"F0",x"F0",x"F0",x"F0"  -- 0x0FF8
  );

begin

  p_rom : process
  begin
    wait until rising_edge(CLK);
     DATA <= ROM(to_integer(unsigned(ADDR)));
  end process;
end RTL;
