--这是一个工具类,里面封装了各种小方法,感谢媳妇@Ally帮助测试并修改bug

require("ZZBase64")
require("ocr")
local image = require("tsimg")
init(1)

local citys = {
	["建邺城"] = "jyc",
	["五庄观"] = "wzg",
	["狮驼岭"] = "stl",
	["朱紫国"] = "zzg",
	["东海湾"] = "dhw",
	["大唐境外"] = "dtjw",
	["大唐国境"] = "dtgj",
	["傲来国"] = "alg",
	["女儿村"] = "nec",
	["花果山"] = "hgs",
	["墨家村"] = "mjc",
	["普陀山"] = "pts",
	["长寿郊外"] = "csjw",
	["江南野外"] = "jnyw",
	["北俱芦洲"] = "bjlz",
	["麒麟山"] = "qls"
	}
--自己做的触动字库
local tab = {
"000c00000038000000e00000038000000e00000078000fffffffbffffffefffffffc007c01f000e0018007800e00fe003803f800c019e00600678000038fc0000c3f800060ff8001838e000e0e1e007038380380e0781e0380e0700e01e38038038e00e0072003801c000e0038003800e000e001@10$长$289$30$31",
"3f88000c7e100019f820003380400066008380cc010f0198037e02300fec0c601f8c18c03e1c3183f018e30fe031c63f80279c47007e380600f8700401f0e00801e1c01003c180200f0300403e060081fe0c0107bc1803fe183007e038600f0038c01c0071802000e3004001c7e0800187e100018fc20003@1$安$306$31$31",
"00000080020006001800383fffffe0ffffff03fffff8007e03e00060070700800e3800007fc00001fc03ffffc01fff8e00e1c018038700200e0800c238300718e0e03ce383cfe38e0fff0e383c0073f000038ff0001e3ffff0f0fc1fff80e003fe03800ff83e00fffcf80ff0fbe3fe00ff8e0003ce0000fe100003f@00$城$421$30$33",
"02000018100001c180001e0c0000e060000e030000e018000f00c000f006000f003000f001801f000c00e000603e000383c003fffc001fffc000fffe00007cf8000181f8000c03c00060078003001e0018007800c000e00600078030001e018000780c0001c06000078300001c180000@111$大$210$29$31",
"00007ff9ffffff1fffffe1e0f0000e0200007010000388c63ffcc631ffe6318f3f318c70f98c6303cc63181e6318c0f318c60799ee303fcff381fffffc0fffffe07f9fe703ccff181e6318c0f318c60798c6303cc63181e6318c0f33fc70f9ffe3cfcfff1ffe3ff0fff03e000380c000@000$唐$464$29$31",
"fffffff7ffffffffffffff80000438000000c000000638000c31c000618e0e030c707018638380c31c1c0618e0e030c70703863ffffc31ffffe18fffff0c78f878638380c31c1c0618e0f030c707f386383d9c31c1c6e18e06270c000038600000830000043ff000ffffffffffffffff@111$国$422$29$31",
"030000c00e00070ffffff83fffffe0ffffff801f007c003800e0c04003030000000c0000003438ff81b8e7fe06e3dff83b9ffe71cfff98fe3ffe63f0fff98f83dfe63c0e3f98c038fe6300e3f98f038fe63f8fff98ffbffe63defff98c1ffff6603e3fff80f8f7fe03e39ff81d0e00006030000f@10$境$488$30$31",
"8000e01f00c3c0ec0f8fffb87e07fcfff80fe3f9e07f8f83fffe3807f89c001f0038002000e020802388c220866318c2198c630826318c2098c630836318c20f9e679c3ffffff9fffffff7ffffffffdff7de76318e20d8c630836318c20d9c6308367f8c20dffe30837ff8c20c1e000830300020@11$建$448$30$31",
"00ff000e00ff801c003f803000ff80efffffff9fffffff3ffffffe7ffffffc00000078000000f3ffffffe0003f87c0000e0700003c06001ff808007f001003f8002007f00040ffffffc3ffffffeffffffffc00003e200000184000003080000061007000c20ff801863c70070fe03c0e1e003c3830003fe0@0$邺$425$31$31",
"0080018006000e0ffffff83fffffc0fffffe001f80f8001800c1c020038e00001ff000007f00fffff007ffe38038700600e1c008038200308e0c01c638380f38e0f3f8e383ffc38e0f001cfc0000e3fc00078ffffc3c3f07fde03800ff80e003fe0f803fff3e03fc3ef8ff803fe38000f380003f840000fc$城$418$30$32",
"0006000000fc000003f80000fffffff7ffffffdf8000003e0000001003000e2086003c630c0ff0c61cff01cc3ff807fcf7c01fffc7013fff8e033fe71c0e7986181c630c3ff0c0183fe100f0000001c000803f000780fe001e7fff807cfc1f81e1f00fff806007fe00c007fc01801ffc03fffc3e07ff001e0f80001c0800001@100$傲$427$31$33",
"0002003800100188008018600400c300200e180100e0fe080e07f8c06031fe07018030700c00870060067003003f003803fc03fffffffffffffffffffffbc03fc00c00fe006007f0030021c018030700c1d818061cc0e03fe20381f8100c0f008038600401c300200600010018000800@111$来$300$29$31",
"fffffff7ffffffffffffff80000438000000c000000630000c31c000618e0e030c707018638380c31c1c0618e0e030c70703863ffffc31ffffe18fffff0c79f878638380c31c1c0618e0f030c707f186383d9c31c1cee18e06270c000038600000830000043fe000ffffffffffffffff@111$国$421$29$31",
"60003800c000e00180038003000f0006007f000c01ffff183ffffff8780000ffc00001f000000380000003000000060003800c00070018000c003000380060fffff0c1fffff181ffffe3001e00cfc03800df007001be00c00370030006600e000cc03800198060002300c000c60000078c00007f180001fc@0$花$282$31$31",
"000060180001c073ff8380e7ff87018fff8e061bef1c1c21863838430c70e08618e1810c31c70218638c0430c73008618fe011c31fc03ffffffffffffffffffffff93c73fc021863f80430c7f008618e7010c31c70218638e0430c70c08618e0e11c31c1c3ffe38387ff87030ffe0e0380001c070000380e@0$果$429$31$31",
"03ffffe03fffff83fffffe000000f00000018000000c0000006000000300000018000000c0000006000000300000018000001ffffffffffffffffffffff8000003c0000006000000300000018000000c0000006000000300000018000000c000000600000030ffffff87fffffc1fffff@100$山$277$29$31",
"0600000c18000030600000c18000030600000c1800006060f8018187f00607fde0383f8180eff806033fc00c18fe0038601800e3806001fe018003e006000f8018007e006001f001800fc00603ff80181f0e007ff81801fc0070078000e01c0003806000060180001c06000038180000e0600001@10$女$247$30$31",
"0000000800000070000003c000001e000000f80000078000007e000003e0fffffe03ffffe00ffffe00@00$@$95$30$11",
"ffffffe7ffffffbffffffe000000f00000018000000c0000006000000300000018000000c000000e000000f00000ff@1$儿$116$29$13",
"000004003800f800e007c003807e000e03e00038fe0001f7f8003ffffffffffffffc7dfc0001e1f0000383e000040380000007800$@$154$30$14",
"0e00000038e00000e3c0018383e00e0e03c0183807e060e00301838000030e00000c38000031e00001fffffffefffffffbffffff81e00000038000000c00000@00$村$172$30$17",
"080000003000000060000180c000070180300e0300f038060fe0e00c3fc3801fff8e003f8f1801fe0e2027e01c004f803800c70070018600e0038c03c00f1807801e307ffff861ffffe0c03e0001803800030070000600e0000c01c00018038e0030070c00600e1e00c01c1c0180381e0300001c06000018@0$东$273$31$31",
"00e0003c070007b01c01f9c0701f0e0383e03000000@00$@$49$29$6",
"060380001c071f00780e7e03c03ffc0f01fc181c7ff01038f1e02071c1c040e3838081c60781038e0f82271f1fccce3e7999dc7ff133f8ffe067f187c04fe30780dfc60701ff8e0e07f71c3fffce387ffe1c7fff30387ff0607001c0400003000@000$海$355$31$25",
"00c0003e038003ec0f00ff381c07e06038fe0@00$@$53$30$5",
"00823e0803047e139e08fc271011f84e0023709c0046e1bc018dc37ff31b86fffe370de00c6e1b8008dc370011b86e002370dc00c6e1fff98dc3fffb1b87f006370fc00c6e1f8008dc3f0013bcefe03e7fdcf07c7f0070207c@0$湾$325$31$23",
"0060001e0180006c070007b00e003ce03803e180601f038081f80e000f0000007800000000200000018000000660000019800000660000019800000660000019800000e60000039c00001e7ffffff9ffffffe60000079800000e6000003980000066000001980000066000001980000066000001@10$江$207$30$31",
"6000000383ffffee3ffffff8f00780e38000038e00000e3820e038e0c380e3c38e038f9e380e3ff8e038f7e380e38f8e039e1e780ff83fffbfe0fffeff83fffbde1f7c0e3878e038e3e380e3ff8e038ffe380e3e78e0b8e0e382e3830e0f8e00303e380000f8e00007e3ffffff87ffffee0fffff@00$南$482$30$31",
"fffc000bfff8203fffe0c0e1e1830383060c0a1e18786fffffffbffffffefffffffb1f3c7de83060c3a1e1830ec7de0c3bfff830cfffe082300f00000018000000200028408000a18600038798000e0f6000781fffffe07fffff83fffffa1ff03808e1800027060000f8183e03c033f00c00ff0000018000$野$438$30$32",
"0008000800c000c03e000e03e00077fe00077f800033e030039f01c03870070381001c380800ff804007f802007f001807e000fffc0007fe00001e00000@0$外$145$29$17",
"7fffffe7fffffffffffffe1fe000003e00000070000001e00000078000000f8000001e000000380@000$@$120$29$11",
"018c00600e70038078c00e03c300787e0c01c3f0300e0fc0c038060301c0180c0e002030780080c3c002038e00080ff000707fc007f3ffc03ffffffefffffffcf87fc001c0fe000203d800080e78002030e00080c1e002030380080c070020301e0080c038020300e0080c01e02030038000c00e@00$朱$302$30$31",
"0038000800f00033ffc00861ff8031c00609e3800c3fc600187f980071ff30ffe3ffe1ffcfffc1e7fffe638ffff0c31fdfe0c63f3fc3c87e7fc79000fffe0001fff800033e03ff0e3803ff1c60030e30c0041c41000818827030300cf0606098e0c0c1f0c38181e0c60701c1881e01e3807801c300e00182@0$紫$411$31$31",
"fffffff7ffffffffffffff80000438000000c000000630000c31c000618e0e030c707018638380c31c1c0618e0e030c70703863ffffc31ffffe18fffff0c79f878638380c31c1c0618e0f030c707f186383d9c31c1cee18e06270c000038600000830000043fe000ffffffffffffffff@111$国$421$29$31",
"e180600b8e038077f81c01dff07806fffffffbc07fff0c001fe00001fe001ffff8003fffc000fffe03c3fff81e0ffffff3fffffe0fffffe0303ffe0080000002000000081ffffe20f00000838000031e00000fffffffbffffffefffffffb9f0007c838000620e0003883ffffe207ffff881ffffc@00$狮$488$30$31",
"800c060201f83808ffe0e02383838080060e0200183028006080a0018203807e180f07f8007fffe003ff03c03e6007fff88007f003f000000fe000003cffff80e1ffff8307ffff8800fc0e2000c0198006002e001800b800e002e00300098018002200e0008c038006381c0078f0000fe3f8007f03000000$驼$317$30$32",
"0fffffc01fffffc00000078000000f0ffffffe1ffffffc3ffffff80ffffff0000001e0000003c03fffff807e1ff00078000000e00000038060000700c0001c01818070030301c0060607000c060c08180e1018301c2038603c6070c0fce06183f8e0030f30e0063838e00ee040e01f8001c03e0001c02000@0$岭$355$31$31",
"18080000e0200003c080000fc60ffc3ff8fff8e1e3de73819e30fe067883f809e20fe067883fff9e20dffe78833ff9e20ce0678833809e20ce0278833809e20ce0678833ff9e20cffe78837ff9e20fe067883f809e20fe0678837839e20ce1e79c73ff8fffcffe1ffe3f183ff8f0200001808000@00$普$442$30$31",
"ffffffffffffffffffffffb00000e0800001820000060dff80383fff00e0fe0fff00f00ff800000f80@00$@$169$30$11",
"3f800001e000000c0ffff860ffffe207ffffb001f81d8003007c003001e001800f001c005800e002c0060012006000900700048038002603800338180079e0001fcfe001fc1800000$陀$176$29$20",
"03ffffe03fffff83fffffe000000f00000018000000c0000006000000300000018000000c0000006000000300000018000001ffffffffffffffffffffff8000003c0000006000000300000018000000c0000006000000300000018000000c000000600000030ffffff87fffffc1fffff@100$山$277$29$31",
"000000181c0001c1e0001fffffffeffffffe7ffffff01f001f807000780380038003801c001c00c001e000001f80007ffffff83fc007e038000f038000381c0000c0e000060f80003fffff80fffffc047c07c021c00c010c006008c00300460018027001c033800e019ffff00cffff00e000003f000001e@0$地$355$29$33",
"00003ffc7ffffff1ffffff07800f800e0006001c000c003800f8007003f000e03ffff9c0fffffb9fffffe73f00000e0000001c0000003838800070718000e0e3e001c1c1f0038381f8270700604e0e0000dc1c0001f8380003f0700007e1e0001fc7e0007b8fffffe71f80000e0e00001c1c000038380000@0$府$359$31$31",
"1f800001f800000f800002700000130e020090701004838180241c0c0120e060090703004838180241c0c0120e0600b070300f83fffffc1fffffe0fffffb078780c838180241c0c0120e0600907030048381d8241c0cc120e0679907010cc8380826610000330000009fc0000@01$宝$269$29$30",
"08002218300188e1fe0e238ffc398e3ff8e631f9e3f88fe38fe63f8e3798fe3999e378f667cde3f98fb78ffe67de3e7b8f78f99c3dfffe60f7fff987dfffff7bf9e3ffcfe387fe3f8e0fc0fe383e03f8e0f801e383e0038e1fc00e38e38038e38600f79c0e03ff603807ff8060000001c00000038000000c$象$496$30$32",
"fffffff7ffffffffffffff80000438000000c000000630000c31c000618e0e030c707018638380c31c1c0618e0e030c70703863ffffc31ffffe18fffff0c79f878638380c31c1c0618e0f030c707f186383d9c31c1cee18e06270c000038600000830000043fe000ffffffffffffffff@111$国$421$29$31",
"8000000603ffff303ffffd81fffffc0e01f3e060070f03003078100183c080181e0401c0f8701c07ffffc03fffe001f0f0000f87000078100003c080001e040000f0700007e3e0003ffffc01fffffc0f8781e078180303c080181e0400c0f02002078180103c0c01c1e07fffff03fffff80ffffe8000000@0$西$385$29$33",
"080e30083038e060e0c383a3860e0e8638383201c0e18e06038600000e38000238e00018e70038e3d801c70fc08e383e0231e1fc080f0fffa0783fff8f81ffff7c01fe0fe0e3f030038fc0800e3f820018e60800638c20038e38807e38e307e0e18fff03830ff00e0c0f0038381c00e0e0380381@10$梁$361$30$31",
"0200000c18000030600000c1800003060000081800006060f8018187f00607fde0383f8380eff806033fc00c18fe0038601800e3806001fe018003f006000f8018003e006001f001800fc00603ff80181f9e007ff81801fe0070078000e01c0003806000060180001c06000038180000e0600001@10$女$249$30$31",
"fffffff7ffffffffffffff80000678000000c000000630000c31c000618e0e030c707018638380c31c1c0618e0e030c70703863ffffc31ffffe18fffff0c79f878638380c31c1c0618e0f030c707f186383d9c31c1cee18e06270c000038600000830000043f00007fffffffffffffffe00001f8$国$425$29$32",
"000c00000038000000e00000038000000e00000078000fffffffbffffffefffffffc007c01f000e0018007800e00fe003803f800c019e00600678000038fc0000c3f800060ff8001838e000e0e1e007038380380e0781e0380e0700e01e38038038e00e0072003801c000e0038003800e000e001@10$长$289$30$31",
"0018038000700e0088e0380311c0f0063383c00c67070018ce3c00319cf000633fe000c7ffc0018fff80033fe3b00fff87601fff0ce03fde18e0739c30c067386098c670c0318ce1803319c30066338600ec670c01d8ce1803b19c300e633ffffcc67ffff18ce7fc0311c7000623860000070c00000e1800@0$寿$381$31$31",
"000004003800f800e007c003807e000e03e00038fe0001f7f8003ffffffffffffffc7dfc0001e1f0000383e000040380000007800$@$154$30$14",
"0e00000038e00000e3c0018383e00e0e03e0183807e060e00301838000030e00000c38000031e00001fffffffefffffffbffffff81e00000038000000c00000@00$村$173$30$17",
"000c00000038000000e00000038000000e00000078000fffffffbffffffefffffffc007c01f000e0018007800e00fe003803f800c019e00600678000038fc0000c3f800060ff8003838e000e0e1e007038180380e0781e0380e0700e01e38038038e00e0072003801c000e0038003800e000e001@10$长$289$30$31",
"0018038000700e0188e0380311c0f0063383c00c670f0018ce3c00319cf000633fe000c7ffc0018ffd80033fe3b00fff87601fff0ce03fde18e0739c30c0673860d8c670c0318ce1803319c30066338600ec670c01d8ce1803b19c300e633ffffcc67ffff18ce7f00311c7000623860000070c00000e1800@0$寿$381$31$31",
"20038009003800c80f800e41fc00e23f000e33c000e180070e1c001ce0e000fe070007f018003f80c003fc0278f8f811ff81c087f007840f801c201e000@0$郊$161$29$17",
"fffffffffffffffffffffd8000038800000c40000062038003903f001cfffe01e7e07c0e3c00ffe@000$@$162$29$11",
"0008000800c000c03e000e03e00077fe00077f800033e030039f01c03870070381001c380800ff804007f802007f001807e000fffc0007fe00001e00000@0$外$145$29$17",
"7fffffe7fffffffffffffe1fe000003e00000070000001e00000078000000f8000001e000000380@000$@$120$29$11",
"000200000038000001e000003f800001ff00007ffffff7f000003f000000$@$64$30$8",
"0003000000180000018000000c000000e000000f0003ffffffdfffffff0078007803c001c01c000600c000300e000180e0000c0600006070000307800018780001c380001e380000f18000ff@0$化$152$29$21",
"0038000803c000c03c000603c10037f80801ff80c00ff8060063c030030e018018700c00c38060061c030030e018018700c00c780700e7e0fe0ffffffff9f83f83c78060061c030030e018018700c00c38060061c030030e018018700c00c38060061c030030e008018600000c000000@011$生$263$29$31",
"0020000001800003060c000e1830003860c000e1838003860f800e183f803860ff00e1838e03860c180e1830003860c039e18300effe0c03bff83006ffe0c019f7830063860c008e1830033860c00ce187806387ffff8e1ffffe387ffff8e1efc003860e000e1830003060c00001800000060000@00$寺$317$30$31",
"0080003c060003f03800f9c1c00f8e0787f030083c00000180@000$@$55$29$7",
"8000000203ffffc83fffffa1c0ffe78600c60e18070838f0f820ffffc083fffe020f7c000838600020e18000838600020e1800083ffff020ffffe0838f03820e18060838601860e18061c787fffffa0fffffe8000000@00$酒$294$30$23",
"00003ff9ffffff9fffffe0e0000006000000300000018000ffcc000fff6000fffb000701d8003806c0018016000c00f000e0078007003cfff801ffffc00f1f9e0058383002c1c180160e0c00b07060058383002c1c180160e0c00b070700d8383806c1c1c0760e0fffb0701ff9838000@000$店$323$29$31",
"e0000079c1fffff38fffffff1e00600e3800001c70000038e0c38071c18700e3c78e01c7cf1c038ffe38071efc700e38f8e01cf0f3c03fe0fffe7fc1fffcff83fff9ef0fbe038e1e38071c7c700e3ff8e01c7ff1c038f9e38271c1c704e3830e0dc700181b8e0000371c0000ee3fffffdc3fffff383ffffc@0$南$488$31$31",
"02000060060000c00c0001801800070030000e0060001c00c00030018000c0030001800f000703ffffffffffffffc$@$105$31$12",
"000e2008001c4030e07080e1c0c1038383820e070f043c0e3c08f01c7013c03fe02708ff804011fe008037f001006f800200ef000c03ce003e071c01fffe3803fff87001f000e0018001c0010003fc020003fc040007fe0880003c11c0003823800070430000e0838001c10700078207801e040700780806@0$杂$294$31$31",
"0000000808000030600000c38000031ff8000cffe0006ffffff9b801ffe680038038000e00e02030038080c01c02030060180c03806037fe0380dfe0ffc33e03ff9c0003f7f000071fc018183f006060fc018383f0060e0fe01c303ffff980ffffee038fe7b80e000e0078001803c000700e0000@11$货$332$30$31",
"00001ff9ffffff9fffffe0e0000006000000300000018000ffcc000fff6000fffb000701d8003806c0018016000c00b000e0078007003cfff801ffffc00f1f9e0058387002c1c180160e0c00b07060058383002c1c180160e0c00b070700d8383806c1c1c0760e0fffb0701ff9838000@000$店$322$29$31","6000080b00c0c05e0e060278703011e3818083fc0c040fe060200703010038180801c0c0400e06020070301fff8180fffc0c07ffe060200f03010038180801c0c0400e0602007030100f818081fc0c043fe06023c703013c38180b81c0c0f807fffe001ffff$当$269$29$28",
"007080000787001ff83801ffc3c00fc7ffff7c3ffffc61ffffe30f7e1f1860e038c30701c618380e3041807$@$166$29$12",
"0000800083ffffe30fffff8c61c70031860c00c60830071860c01ff1c780fffffffbffffffefffffff9c61830071820803c608203f1861c1fc7fffffe0fffff983ffffe$铺$297$30$18",
"4003020b800e186e00f8e1b807e786e07ffe3b83fff8ee3e7fe3b8c1ff8ef80f9c33e07c608f03e186380f0618e03000e38000000e00e00038078000e3fc00038fc0000e3e0800b8783806f860f01be181e03f8603c0fc180203e060000f8180003e060001f818000ee07dfffb81ffffce03fff0@00$药$380$30$31",
"3e000001f8018007c20e001c18380060e0f7f98383ffe63c0fff99f03f867fe0f809ff8660267f198098df6602621f880b883e202e20f080b8838202e206080b883c202e20f8809883e202621f88098c7e60263f1980d8f8760363e0fc1d8f03f866380fff98c03ffc6000e001c0038007e00e000f000000$客$380$30$32",
"00003e001801f000603f000381fc001fffe003ffffffefffffffcfdff0000e1f0000183c0000603800000060000001800c02060030081800c060600603c3801bff9e00effffe0383f7fc1c0387ffe00e0fff8030207e20c181f883060ff308183dee60e3c181838e07060e603c003801f000801f8000003c$栈$362$30$32",
"00003e001801f000603f000383fc001fffc003ffffffefffffffc7dff0000e1f0000183c0000603800000060000001800c02060030081800c060600607c3801bff9e00effffe0383f7fc1c0387ffe00e0f7f8030207e20c181f883060ff308187dee60e3c181838e07060e603c003001f000801f8000003c$栈$361$30$32",
"007e600003e18001ff86000ffe3800fe7ffff878ffffe0c3ffffc30f7c1e0c38603820c180808006000200180000003fc02001ff87ff8fff1dfe38006238c00388e3000e238c00388e7000e23ffffb88fffff623ffffd88f781c6238c02188e30086238c03199e301e7ff8e078ff83ffc0000ffe@00$锦$420$30$31",
"0078080803e060607f878383fe3e0efe7ff83b81ffe0cc07e783001e0e1803f030601e00838070020c018000000008001800600068638807b19c303cc760ffe21f83fc087c0fe037f87800fff9c003fff6000fffd800bffc70028fe0e00a1f83e038660fe0e19c078786380f3818603fe001807f@10$绣$380$30$31",
"003c000001e000007f000003e00000fe0fffe3f83fffe9c0ffff8702001e0c300038398000c0fe000603f00000070000001c000000fffffe07fffffcfc7fffe3e1c0000f0600001c18000030600000e3c00003ffffffcffffffe38f00020c18000820600030818000c2070007881e001c203fffe@00$饰$344$30$31",
"0000fff00007ffe0003fff8000f006ffc3800bff8c002e1e3000a038c0028063000a018e0028063801a018e0068063fffa0183ffc8060000201800008060000201800008063fffa018fffe8063801a018e0028063000e038c003c1e3000fcf8c003ffe3000c000e0070003fffc000fffe0001fff@10$品$321$30$31",
"001c000000f000007f800003fe0000ff1ffff3f87fffe1e1ffff8383003e0e2000383d8000e0fe000307f000001f800000fe000003fc00000e7ffffe31fffff883fffff20838e1d8206303e0818c0f8206303e0818c0f820630360818c0c820e30320ff8e1cc3fc38738fe0ff8f2001fe3f0000007800000$馆$383$30$32",
"00038000000e00000038000000e00080038002000e0008003803a000e00e8003801a000e0068003801e000e0038003800e001e00380e7800e07fe00683ff803a0e3e01e8387fffa181fff88e03ffc2700f000dc038003e00e000f8038003c00e000e0038003000e00000038000000e0000003800@00$子$235$30$31",
"00000008000000fffc1fffffe1fff0000fff8000781c000300600018010001c00fffce00fffffffe0043fff0000fff8000700c018300601c180107e0c0087c0600ff803ffffc01fff1c00fff8c00700c270300613c180108f0c00843c600c20e7ffe1031fff08007ff8400001c200000@011$监$343$29$31",
"00030000000c0000e030000380c0000e030000380c0000e030000380e0001e078000781e000ffffffffffffffc1e078000380e0000e030000380c0000e030080380c0600e0300c0381c0300f7f00e03ffc0388fff00e21e3c038e00381e3800e0787803ffc0e00ffc01800f80@00$书$274$30$29",
"000001fc00003ff3ffffff1ffff8f070000181800002060c00181838006060e0e181838786060e7e18183ff86060ffe18187e3860e3e0e183df83860ffe0e183cf8386061e3fff9839ffff60e7fff98387df860e0e181838386060e0e181838386060e0e181838386060e0618183000606000018@00$库$380$30$31",
"180c000ce038006380e0038e03801c380e03e0e0380f0381e7f81f07ff007ffff801e0fc000e01e00038038000e00e00030038000800e00020038000000e00000038000000e00000038000000e00000078000fffffffbffffffffffffffc007c000000e00000038000000e00000038000000e000@00$升$274$30$31",
"00200001c0c01803838038070700700e0e00e01c1c01c03870038271cc070ce3980e19c7301c3b98603837b0c0707fc180e0ff8301c1ff060383ffcc0f07ffd83e1fffb1fc3bf067f8e7c0cfffcf81f9fe1fc3e1f03d878380730f0700e31c0e01c7101c038e0038070c00700e0c00e01c1c01c038380300707006000060000@000$李$397$31$33",
"00c000000700002038000101c0000e0e00007070000183ffffc40fffff000001f800000780000038000001c000000e000000f2001fff1001fffcc01ffffe00e003f006000f8030007c018003e00c000f00600078030003c018001e01c001f00e000f8070007fff8007fff800f800000f@100$记$258$29$31",
"38038000e01c00038060000e038000381e0000e07c000383ffff8e1ffffc39fc0000f7e00003fd80001fc600007e180003e060000f8180003e06000078fffff8e7fffff39fffff8e1f001c38180000e06000038180030e06000e38180038e06000e38180038e07001e380ffff8e03fff83800000@00$布$337$30$31",
"00001ff87fffff8fffffe0f8000006000000300000058000002c00c0036006001b003000d8018006c00c0036006001b003000f8018007c00c003e3ffffff3fffffd9fffffec07e01f6006001b003000d8018006c00c0036006001b003000d8018006c00c0036006001b000000d800000@011$庄$280$29$31",
"7fffffe7fffffff800001f00000038000001c000000e000000703fff0383fff81c1e00e0e0e00707070018383800c1c1c0060e0e00307070018383800c1c1c0060e0e00307070038383801c1c1fffc0e03ffc0700000038000001c000000f0000007ffffffffffffffbffffff@00$回$340$29$30",
"002018040101c031880e01cc40f00e620f007310fc03988ffffcc4ffffe63fc61f33fe30799f6083fff3041ffe0820fff04107ff82083fcc1041fe60820ff104107f882083cc41041e620820f318e30798ff187cc7fee3e63fffff311fff398878018c41c00c62070040101c000080e000040300$春$393$29$32",
"0fe000083c000020e00020838000820e00020878fe082fe7f820bf9cf0827e60c208f9830820e60c20839830820e60c20879839c6fe60fffbf983ffefe60fff8f983ffe0e60e70839830820e60c20879830821e60c20cf987083fe7fc20ff8fe0839e3f820c38000830e00020c38000020fe0000@10$堂$363$30$31",
"0806030038380e00ffe03007ff80c03fe60201fc1c1c0fe1f9f0078ffffe0e7ffffc307ff800c061c003018600083e180000c000000f0000007c000003dfffe01c7fffc0e0ffff87003e06f000701b8001802e000e00b80038027801c00870060060f0380180e0c00e01e203f803800f80078000@00$轮$332$30$31",
"800000010c000002181fe00430fff00861c0e010c300c021860080430c0100861802010c3004021860080430c0100861802010c3004021860080430c0100861802090c3004121860186430fff06860ffe0d0c1ff01e0000003c00000078000000f0000001f00000077ffffffcfffffff8ffffffc@00$司$282$31$30",
"3fffffffffffff803f0007c000f0001e00078001f0003c000f8003c00078000c0000800@0$北$103$19$15",
"ffffffffffffffffffcf33f3cc7cf31f3cc7cf31f3cc7cf31f3cc7cf31f3cc7cf31fbfeffffffffffffffdffff$俱$281$18$20",
"1c0003c0003c1ff3c3ff3c3e73c3c33c3c33e3c3ff3c37f3c33c3c33c3c33c3c33e3c33ffc33ffc33efc33c7c33c3c33c3c33e3c37f3c37f3c37f3c33c3c33c3c33c3c33c3e73c3ff3c1ff3c000$芦$340$20$31",
"00200c0f01c0f03c0f07c0e07c0e0781c000070003e03ffc07ff80f8001fc1fffffffff@1$洲$127$19$15",
"00000c0400071c0e000fbc0ffffffc0ffffff8cffffff1cfffff81cfefff01ceffff01cfffff01cfffff83cfffffffceefffffcec7ffbfceefff0feeffff0ffeffff0ffeffff0ffeffff07fecfff81ceeffff3ceffffffceffffffceffff03ceffff01cec7ff01ceefff81cefffff1cefffff1cefe1ffcce3c0fbc0e00071c0e00000c04$墨$729$32$33",
"0fe0c38707f830e3c1f01c38f079071c3c1cc3c71e0730f3c701ce38f3c0738e38f01cef1c38073fcf1e41cfe3cf3873f8e3cf1cfcf1e3cf3fbcf0ffcffc783df3ffbe0f7cefff0f8f38ffffe1ce0ffff07383fff01ce0ff8007383ff001ce0e3c00738787801ce3c0f00730f01e01c43803c0730c00f01fc3001e07f00003c0fe0000f01f00001c$家$541$34$32",
"00061e00c7e0186f3388e6610cc8219907f320de6611ccfa39980333087fc1fff83fff07ffe08ffe00eec219984f33ffe661fcc8239900332086661bcce3e01c380310006@001$墨$252$19$29",
"0e000180103000030020200602106121041210412108121000211042130421e1821f10e1fb0e10f0610716103f2101f2101f2101f2101021010210102106020060200403000030000100001f000$家$140$20$31",
}

local index = addTSOcrDictEx(tab)

--修改完毕Ally
--最后一排寻找飞行符
function findFly()
	local x1,y1
	for i=0,4,1 do
		x1,y1 = findMultiColorInRegionFuzzy( 0x682cb0, "-24|11|0x33303b,1|-25|0xa3632a,32|-10|0x433325", 90, 899+135*i, 668, 1028+135*i, 800)
		if x1 ~= -1 then
			--dialog("find"..x1..y1)
			break
		end
	end
	return x1,y1
end

--最后一排寻找摄妖香
--20230812测试通过
function findSYX()
	local x1,y1
	for i=0,4,1 do
		x1,y1 = findMultiColorInRegionFuzzy( 0xe5dea5, "-1|19|0x595669,-6|62|0x91936d,26|31|0x414230", 90, 898+135*i, 668, 1028+135*i, 801)
		if x1 ~= -1 then
			break
		end
	end
	return x1,y1+30
end
--判断背包是否打开
--20230812测试通过
function isPackageOpen()

	local i,x1,y1
	for i=1,5,1 do
		x1,y1 = findMultiColorInRegionFuzzy( 0x183850, "-7|-28|0x68a7c8,-17|2|0x305778,17|-4|0x3f739f,2|19|0x285980", 90, 1565, 42, 1645, 127)
		if x1~=-1 then
			--dialog("find"..x1..y1)
			return true
		end
		mSleep(200)
	end
	--dialog("not find")
	return false
end

--修改完毕Ally
--判断背包有多少空格
function countCangKuBeiBaoEmpty()
	
	return countCangKuBeiBaoEmptyY(3)
end

--修改完毕Ally
--打开仓库后判断背包有多少空格
function countCangKuBeiBaoEmptyY(yy)
	
	keepScreen(true)
	local count=0
	
	for y=0,yy do
		for x=0,4 do
			
			local flag = true
			for j=981,1026,1 do
				color = getColor(j+x*135, 370+y*135)
				if color ~= 12103896 then
					flag = false
					break
				end
			end
			if flag == true then
				count = count+1
			end
		end
	end
	keepScreen(false)
	--dialog(count)
	return count
end

--修改完毕Ally
--判断背包哪些位置不是空的
function findCangKuBeiBaoNoEmptyMap()
	return findCangKuBeiBaoNoEmptyMapY(3)
end

--修改完毕Ally
--打开仓库时判断背包哪些位置不是空的
function findCangKuBeiBaoNoEmptyMapY(yy)
	
	keepScreen(true)
	local mapArray = {}
	local row = 1
	for y=0,yy do
		for x=0,4 do
			local flag = true
			for j=981,1026,1 do
				color = getColor(j+x*135, 370+y*135)
				
				if color ~= 12103896 then
					flag = false
					break
				end
			end
			if flag == false then
				mapArray[row] = (1001+x*135).."@"..(366+y*135)
				row = row+1
			end
		end
	end
	keepScreen(false)
	--dialog(#mapArray)
	return mapArray
end

--修改完毕Ally
--判断仓库有多少空格
function countCangKuEmpty()
	
	keepScreen(true)
	local count=0
	
	for y=0,3 do
		for x=0,4 do
			
			local flag = true
			for j=250,310,1 do
				color = getColor(j+x*135, 375+y*135)
				if color ~=12103896 then
					flag = false
				end
			end
			if flag == true then
				count = count+1
			end
		end
	end
	--dialog(count)
	keepScreen(false)
	return count
end

--修改完毕Ally
--判断仓库哪些位置不是空的
function findCangkuNoEmptyMap()
	
	keepScreen(true)
	local mapArray = {}
	local row = 1
	for y=0,3 do
		for x=0,4 do
			local flag = true
			for j=250,310,1 do
				color = getColor(j+x*135, 375+y*135)
				if color ~=12103896 then
					flag = false
					break
				end
			end
			if flag == false then
				mapArray[row] = (250+x*135).."@"..(375+y*135)
				row = row+1
			end
		end
	end
	keepScreen(false)
	dialog(#mapArray)
	return mapArray
end

--返回当前仓库所有为藏宝图的格子
--修改完毕leo
function findCangKuMap()
	--缓存图片，提高性能
	keepScreen(true)
	local mapArray = {}
	local row = 1
	--遍历4排
	for y=0,3 do
		--遍历5列
		for x=0,4 do
			--找藏宝图特征
			x1,y1 = findMultiColorInRegionFuzzy( 0xf0f5e3, "-10|21|0xeeedbb,-17|53|0xeeefb9,60|16|0xf0f6d3,43|67|0xeff1c9,52|39|0xe1e27f,17|38|0xf01560", 90, 210+x*135, 308+y*135, 331+x*135, 430+y*135)
			if x1~=-1 then
				--如果找到就存入数组
				mapArray[row] = x1.."@"..y1
				row = row+1
			end
		end
	end
	--关闭缓存图片
	keepScreen(false)
	return mapArray
end


--修改完毕Ally
function isFlyOpen()
	
	local i,x1,y1
	for i=1,5,1 do
		x1,y1 = findMultiColorInRegionFuzzy( 0x183850, "-19|-33|0xb4eff8,-8|17|0x366b98,15|10|0x1a3147,1|20|0x285c84", 90, 1564, 232, 1648, 314)
		if x1~=-1 then
			--dialog("open")
			return true
		end
		mSleep(200)
	end
	--dialog("not open")
	return false
end

--修改完毕Ally
--判断仓库是否打开
-- 20230812函数可用
function isCangKuOpen()
	local i,x1,y1
	for i=1,50,1 do 
		x1,y1 = findMultiColorInRegionFuzzy( 0xa0c0c8, "0|-16|0x384c58,-2|17|0x304048", 90, 1848, 775, 1899, 826)
		if x1~=-1 then
			--dialog("open")
			return true
		end
		mSleep(200)
	end
	--dialog("not open")
	return false
end

--修改完毕
function findAuto()
	local x1,y1
	x1,y1 = findMultiColorInRegionFuzzy( 0x384f58, "-15|-17|0xe8ec01,15|-17|0xf0f838,16|15|0xf1f938,-16|16|0xe8ec04,-18|-2|0x304450,1|-18|0x385058,16|-3|0x35565d,-1|15|0x384c58", 90, 535, 93, 768, 350)
	return y1,1080 - x1
end

--修改完毕
function findAutoKey()
	local x1,y1
	x1,y1 = findMultiColorInRegionFuzzy( 0xf3f5f6, "-2|0|0x7b8d9b,-6|1|0xfbfcfc,-6|-4|0x94a6b1,-6|7|0x94a6b1,-14|1|0xffffff,-17|1|0x8596a1,-19|1|0xdde3e6,-20|1|0x879ca7,-23|1|0xdee3e5", 90, 295, 371, 556, 791)
	return y1,1080-x1
end

--修改完毕
function doClear()
	local x1,y1
	tapp(62,383,5)
	mSleep(300)
	x1,y1 = findMultiColorInRegionFuzzy( 0x2f4c4d, "11|2|0x88b7c3,44|15|0x1a3b45,27|38|0x183941,47|39|0x6093a2,60|45|0x334c53", 95, 34, 512, 111, 572)
	if x1~=-1 then
		tapp(68,544,5)
	end
	x1,y1 = findMultiColorInRegionFuzzy( 0x355157, "9|-2|0x8ebfd1,35|15|0x314f5b,28|30|0x304e56,34|22|0x7eaab7,66|43|0x26424d,34|45|0x5f8ca0", 95, 35, 657, 109, 723)
	if x1~=-1 then
		tapp(73,695,5)
	end
	mSleep(500)
end

--修改完毕
function closeClear()
	
	tapp(49,1010,20)
	mSleep(500)
	
end

--修改完毕
function waitFight()
	local x1,y1
    -- 判断出现自动按键, 出现表示进入战斗
    x1,y1 = findMultiColorInRegionFuzzy( 0xbed4d8, "20|0|0xb9ced2,0|22|0xbed5dd,20|21|0xb8ccd0,34|10|0xc1d8df,42|21|0xc7d8df,48|3|0xcde2e8", 90, 1784, 921, 1899, 1042)
    if x1 ~=-1 then 
        return 1
    end
    -- 未出现自动按钮， 但是出现第几回合字样，表示战斗没有结束
	x1,y1 = findMultiColorInRegionFuzzy( 0xfafaf9, "0|26|0xf9f9f8,26|-1|0xfefefe,26|26|0xfbfbfa,8|6|0xf6f6f4,18|6|0xf9f8f7,20|19|0xfafaf9,8|19|0xfbfbfb", 90, 112, 157, 160, 198)
	if x1~=-1 then
		return 0
	end
	--战斗结束
	return -1
end

--修改完毕
function havNext()
	
	local x1,y1
	local threshold = 0
	x1,y1 = findMultiColorInRegionFuzzy( 0x889ca8, "-3|15|0x304448,14|16|0x718c98,18|0|0x304850,4|29|0x688290,17|34|0x334b52", 95, 520, 912, 562, 964)
	if x1 == -1 then
		mSleep(100)
		x1,y1 = findMultiColorInRegionFuzzy( 0x889ca8, "-3|15|0x304448,14|16|0x718c98,18|0|0x304850,4|29|0x688290,17|34|0x334b52", 95, 520, 912, 562, 964)
		if x1 == -1 then
			return false
		end
	end
	return true
end

--修改完毕
function havLast()
	
	local x1,y1
	x1,y1 = findMultiColorInRegionFuzzy( 0x304850, "17|3|0x809ca0,2|17|0x708c98,20|15|0x304448,-2|34|0x304448,12|29|0x688090", 95, 236, 915, 275, 962)
	if x1 == -1 then
		mSleep(100)
		x1,y1 = findMultiColorInRegionFuzzy( 0x304850, "17|3|0x809ca0,2|17|0x708c98,20|15|0x304448,-2|34|0x304448,12|29|0x688090", 95, 236, 915, 275, 962)
		if x1 == -1 then
			return false
		end
	end
	return true
end

--修改完毕
--判断背包藏宝图卡片是否打开
function bbMapOpenSuc()
	
	local x1,y1,i1
	for i1=1,100,1 do
		--最多进行100次循环，至少10秒
		mSleep(100)
		x1,y1 = findMultiColorInRegionFuzzy( 0x01ff01, "", 90, 533, 443, 570, 491)
		if x1 ~= -1 then
			return true
		end
	end
	return false
end

--修改完毕
--判断仓库里的藏宝图，地图和坐标是否加载成功
function ckMapOpenSuc()
	
	local x1,y1,i1
	for i1=1,50,1 do
		--最多进行50次循环，至少5秒
		mSleep(100)
		x1,y1 = findMultiColorInRegionFuzzy( 0x01ff01, "", 90, 1083, 1080-487, 1131,1080-528)
		if x1 ~= -1 then
			return true
		end
	end
	return false
end

--取仓库宝图坐标
function cutck()
	--点击仓库藏宝图，并且藏宝图的地点已经加载成功
	ckMapOpenSuc()
	--截图藏宝图地点信息，保存为test1.png
	snapshot("test1.png", 1083,556,1316,593)
	local str
	--图片识别，保存结果到str
	str = upload2()
	--如果是别失败了，那么再次识别
	if str == false then
		return cutck()
	end
	--返回藏宝图的地点
	return str
end

--修改完毕
--初始化所有宝图坐标  
function getAllMap()
	-- nLog("获取所有宝图开始")
	local pos
	local city
	local ckNum = 0
	while( true ) do
		--获取藏宝图位置列表
		mapArrayList = findCangKuMap()
		--遍历所有藏宝图位置
		for key, var in ipairs(mapArrayList) do
			--获取藏宝图仓库页码和位置信息，转换成数组
			mapxy = strSplit(var,"@")
			--按照仓库页码和位置点击藏宝图
			tapp(mapxy[1],mapxy[2],5)
			mSleep(50)
		end
		
		for key, var in ipairs(mapArrayList) do
			mapxy = strSplit(var,"@")
			--点击坐标
			tapp(mapxy[1],mapxy[2],5)
			pos = cutck()
			--toast(pos,2)
			data = strSplit(pos,"@")
			city = data[1]
			toast(data[1].."("..string.gsub(data[2],"-","")..","..string.gsub(data[3],"-","")..")")
			
			local mapProp = {}
			mapProp[1] = ckNum
			mapProp[2] = mapxy[1]
			mapProp[3] = mapxy[2]
			mapProp[4] = data[2]
			mapProp[5] = data[3]
			-- nLog("藏宝图信息，仓库页码："..ckNum.."，宝图城市："..city.."，宝图位置："..mapxy[1]..","..mapxy[2].."，宝图坐标："..data[2]..","..data[3])
			if city == "五庄观" then
				-- nLog("宝图加入五庄观")
				table.insert(wzg,mapProp)

			elseif city == "傲来国" then
				-- nLog("宝图加入傲来国")
				table.insert(alg,mapProp)
				
			elseif city == "建邺城"  then
				-- nLog("宝图加入建邺城")
				table.insert(jyc,mapProp)

			elseif city == "狮驼岭" then
				-- nLog("宝图加入狮驼岭")
				table.insert(stl,mapProp)
				
			elseif city == "朱紫国" then
				-- nLog("宝图加入朱紫国")
				table.insert(zzg,mapProp)
				
			elseif city == "东海湾" then
				-- nLog("宝图加入东海湾")
				table.insert(dhw,mapProp)
				
			elseif city == "大唐境外" then
				-- nLog("宝图加入大唐境外")
				table.insert(dtjw,mapProp)
				
			elseif city == "大唐国境" then
				-- nLog("宝图加入大唐国境")
				table.insert(dtgj,mapProp)
				
			elseif city == "女儿村" then
				-- nLog("宝图加入女儿村")
				table.insert(nec,mapProp)
				
			elseif city == "花果山" then
				-- nLog("宝图加入花果山")
				table.insert(hgs,mapProp)
				
			elseif city == "墨家村" then
				-- nLog("宝图加入墨家村")
				table.insert(mjc,mapProp)
				
			elseif city == "普陀山" then
				-- nLog("宝图加入普陀山")
				table.insert(pts,mapProp)
				
			elseif city == "长寿郊外" then
				-- nLog("宝图加入长寿郊外")
				table.insert(csjw,mapProp)
				
			elseif city == "江南野外" then
				-- nLog("宝图加入江南野外")
				table.insert(jnyw,mapProp)
				
			elseif city == "北俱芦洲" and beijuluzhouFlag == "北俱芦洲" then
				-- nLog("宝图加入北俱芦洲")
				table.insert(bjlz,mapProp)
				
			elseif city == "麒麟山" and qilinshanFlag == "麒麟山" then
				-- nLog("宝图加入麒麟山")
				table.insert(qls,mapProp)
				
			end
		end
		if havNext() == false then
			
			-- nLog("获取所有宝图结束")
			break
		end
		-- nLog(ckNum.."页宝图获取结束")
		tapp(549,944,10)
		ckNum = ckNum +1
		mSleep(1000)
	end
end


--修改完毕
function getCityMap()
	resetck()
	local threshold = 15
	local ckPage = 0
	local lastCity = ""
	while(threshold>0)
	do
		if wzg[1]~=nil then
			if lastCity == "" then
				lastCity = "wzg"
			elseif lastCity ~= "wzg" then
				lastCity = "wzg"
				resetck()
				ckPage = 0
			end
			ckPage = getOne(ckPage,wzg[1],threshold,lastCity)
			table.remove(wzg,1)

		elseif jyc[1]~=nil then
			if lastCity == "" then
				lastCity = "jyc"
			elseif lastCity ~= "jyc" then
				lastCity = "jyc"
				resetck()
				ckPage = 0
			end

			ckPage = getOne(ckPage,jyc[1],threshold,lastCity)
			table.remove(jyc,1)
		elseif stl[1]~=nil then
			if lastCity == "" then
				lastCity = "stl"
			elseif lastCity ~= "stl" then
				lastCity = "stl"
				resetck()
				ckPage = 0
			end
			ckPage = getOne(ckPage,stl[1],threshold,lastCity)
			table.remove(stl,1)

		elseif zzg[1]~=nil then
			if lastCity == "" then
				lastCity = "zzg"
			elseif lastCity ~= "zzg" then
				lastCity = "zzg"
				resetck()
				ckPage = 0
			end
			ckPage = getOne(ckPage,zzg[1],threshold,lastCity)
			table.remove(zzg,1)

		elseif dhw[1]~=nil then
			if lastCity == "" then
				lastCity = "dhw"
			elseif lastCity ~= "dhw" then
				lastCity = "dhw"
				resetck()
				ckPage = 0
			end
			ckPage = getOne(ckPage,dhw[1],threshold,lastCity)
			table.remove(dhw,1)

		elseif dtjw[1]~=nil then
			if lastCity == "" then
				lastCity = "dtjw"
			elseif lastCity ~= "dtjw" then
				lastCity = "dtjw"
				resetck()
				ckPage = 0
			end
			ckPage = getOne(ckPage,dtjw[1],threshold,lastCity)
			table.remove(dtjw,1)

		elseif dtgj[1]~=nil then
			if lastCity == "" then
				lastCity = "dtgj"
			elseif lastCity ~= "dtgj" then
				lastCity = "dtgj"
				resetck()
				ckPage = 0
			end
			ckPage = getOne(ckPage,dtgj[1],threshold,lastCity)
			table.remove(dtgj,1)

		elseif alg[1]~=nil then
			if lastCity == "" then
				lastCity = "alg"
			elseif lastCity ~= "alg" then
				lastCity = "alg"
				resetck()
				ckPage = 0
			end
			ckPage = getOne(ckPage,alg[1],threshold,lastCity)
			table.remove(alg,1)

		elseif nec[1]~=nil then
			if lastCity == "" then
				lastCity = "nec"
			elseif lastCity ~= "nec" then
				lastCity = "nec"
				resetck()
				ckPage = 0
			end
			ckPage = getOne(ckPage,nec[1],threshold,lastCity)
			table.remove(nec,1)

		elseif hgs[1]~=nil then
			if lastCity == "" then
				lastCity = "hgs"
			elseif lastCity ~= "hgs" then
				lastCity = "hgs"
				resetck()
				ckPage = 0
			end
			ckPage = getOne(ckPage,hgs[1],threshold,lastCity)
			table.remove(hgs,1)

		elseif mjc[1]~=nil then
			if lastCity == "" then
				lastCity = "mjc"
			elseif lastCity ~= "mjc" then
				lastCity = "mjc"
				resetck()
				ckPage = 0
			end
			ckPage = getOne(ckPage,mjc[1],threshold,lastCity)
			table.remove(mjc,1)

		elseif pts[1]~=nil then
			if lastCity == "" then
				lastCity = "pts"
			elseif lastCity ~= "pts" then
				lastCity = "pts"
				resetck()
				ckPage = 0
			end
			ckPage = getOne(ckPage,pts[1],threshold,lastCity)
			table.remove(pts,1)

		elseif csjw[1]~=nil then
			if lastCity == "" then
				lastCity = "csjw"
			elseif lastCity ~= "csjw" then
				lastCity = "csjw"
				resetck()
				ckPage = 0
			end
			ckPage = getOne(ckPage,csjw[1],threshold,lastCity)
			table.remove(csjw,1)

		elseif jnyw[1]~=nil then
			if lastCity == "" then
				lastCity = "jnyw"
			elseif lastCity ~= "jnyw" then
				lastCity = "jnyw"
				resetck()
				ckPage = 0
			end
			ckPage = getOne(ckPage,jnyw[1],threshold,lastCity)
			table.remove(jnyw,1)

		elseif bjlz[1]~=nil then
			if lastCity == "" then
				lastCity = "bjlz"
			elseif lastCity ~= "bjlz" then
				lastCity = "bjlz"
				resetck()
				ckPage = 0
			end
			ckPage = getOne(ckPage,bjlz[1],threshold,lastCity)
			table.remove(bjlz,1)

		elseif qls[1]~=nil then
			if lastCity == "" then
				lastCity = "qls"
			elseif lastCity ~= "qls" then
				lastCity = "qls"
				resetck()
				ckPage = 0
			end
			ckPage = getOne(ckPage,qls[1],threshold,lastCity)
			table.remove(qls,1)
		else
			return threshold
		end		
		threshold = threshold -1
	end
	return threshold
end


--修改完毕
function getOne(ckPageO,arrO,thresholdO,cityNameO)
	--dialog("当前页："..ckPageO.."，目标页："..arrO[1].."坐标："..arrO[2]..","..arrO[3])
	-- nLog("取第"..(15-thresholdO).."张宝图，开始，仓库当前页码："..ckPageO.."目标仓库页码："..arrO[1].."藏宝图地图："..cityNameO)
	local waitFlag = ckPageO < arrO[1]
	local tempx,tempy,row,col
	row = 2 - math.floor((thresholdO-1)/5)
	col = 5 - (thresholdO % 5)
	if col == 5 then
		col = 0
	end
	tempx = 962 + col * 135
	tempy = 318 + row * 135
	while(ckPageO < arrO[1])
	do
		mSleep(200)
		ckPageO = ckPageO +1
		tapp(546,933,5)
	end
	if waitFlag == true then
		mSleep(500)
	end
	-- nLog("点击宝图，位置："..arrO[2]..","..arrO[3])
	tapp(arrO[2],arrO[3],5)
	if ckMapOpenSuc() then 
		for temp=0,10 do
			x1,y1 = findMultiColorInRegionFuzzy( 0x889ea7, "13|-3|0x385767,0|12|0x2f4b5e,14|11|0x768e9b,3|26|0x688590,14|26|0x254352", 90, 1140, 631, 1187, 918)
			if x1 > 0 then
				break
			end
			-- nLog("查找取回仓库按钮失败，重试")
			mSleep(500)
		end
		-- nLog("宝图点击成功,点击取出,位置"..x1..","..y1)
		tapp(x1,y1,5)
	else
		-- nLog("宝图未选中，再次点击")
		tapp(arrO[2],arrO[3],5)
		ckMapOpenSuc()
		for temp=0,10 do
			x1,y1 = findMultiColorInRegionFuzzy( 0x889ea7, "13|-3|0x385767,0|12|0x2f4b5e,14|11|0x768e9b,3|26|0x688590,14|26|0x254352", 90, 1140, 631, 1187, 918)
			if x1 > 0 then
				break
			end
			-- nLog("查找取回仓库按钮失败，重试")
			mSleep(500)
		end
		-- nLog("宝图点击成功,点击取出,位置"..x1..","..y1)
		tapp(x1,y1,5)
	end
	-- nLog("宝图信息："..cityNameO..":"..tempx..","..tempy.."点击坐标"..arrO[4]..","..arrO[5])
	if (cityNameO=="jyc")
	then
		jianyechengArray[jianyechengRow] = tempx.."@"..tempy
		jianyechengXYArray[jianyechengRow] = "1@"..arrO[4].."@"..arrO[5].."@"
		jianyechengRow = jianyechengRow +1

	elseif(cityNameO == "wzg")
	then
		wuzhuangguanArray[wuzhuangguanRow] = tempx.."@"..tempy
		wuzhuangguanXYArray[wuzhuangguanRow] = "1@"..arrO[4].."@"..arrO[5].."@"
		wuzhuangguanRow = wuzhuangguanRow +1

	elseif(cityNameO == "stl")
	then
		shituolingArray[shituolingRow] = tempx.."@"..tempy
		shituolingXYArray[shituolingRow] = "1@"..arrO[4].."@"..arrO[5].."@"
		shituolingRow = shituolingRow +1
	elseif(cityNameO == "zzg")
	then
		zhuziguoArray[zhuziguoRow] = tempx.."@"..tempy
		zhuziguoXYArray[zhuziguoRow] = "1@"..arrO[4].."@"..arrO[5].."@"
		zhuziguoRow = zhuziguoRow+1
	elseif(cityNameO == "dhw")
	then
		donghaiwanArray[donghaiwanRow] = tempx.."@"..tempy
		donghaiwanXYArray[donghaiwanRow] = "1@"..arrO[4].."@"..arrO[5].."@"
		donghaiwanRow = donghaiwanRow +1
	elseif(cityNameO == "dtjw")
	then
		datangjingwaiArray[datangjingwaiRow] = tempx.."@"..tempy
		datangjingwaiXYArray[datangjingwaiRow] = "1@"..arrO[4].."@"..arrO[5].."@"
		datangjingwaiRow = datangjingwaiRow +1
	elseif(cityNameO == "dtgj")
	then
		datangguojingArray[datangguojingRow] = tempx.."@"..tempy
		datangguojingXYArray[datangguojingRow] = "1@"..arrO[4].."@"..arrO[5].."@"
		datangguojingRow = datangguojingRow +1
	elseif(cityNameO == "alg")
	then
		aolaiguoArray[aolaiguoRow] = tempx.."@"..tempy
		aolaiguoXYArray[aolaiguoRow] = "1@"..arrO[4].."@"..arrO[5].."@"
		aolaiguoRow = aolaiguoRow +1
	elseif(cityNameO == "nec")
	then
		nvercunArray[nvercunRow] = tempx.."@"..tempy
		nvercunXYArray[nvercunRow] = "1@"..arrO[4].."@"..arrO[5].."@"
		nvercunRow = nvercunRow+1
	elseif(cityNameO == "hgs")
	then
		huaguoshanArray[huaguoshanRow] = tempx.."@"..tempy
		huaguoshanXYArray[huaguoshanRow] = "1@"..arrO[4].."@"..arrO[5].."@"
		huaguoshanRow = huaguoshanRow+1
	elseif(cityNameO == "mjc")
	then
		mojiacunArray[mojiacunRow] = tempx.."@"..tempy
		mojiacunXYArray[mojiacunRow] = "1@"..arrO[4].."@"..arrO[5].."@"
		mojiacunRow = mojiacunRow+1
	elseif(cityNameO == "pts")
	then
		putuoshanArray[putuoshanRow] = tempx.."@"..tempy
		putuoshanXYArray[putuoshanRow] = "1@"..arrO[4].."@"..arrO[5].."@"
		putuoshanRow = putuoshanRow+1
	elseif(cityNameO == "csjw")
	then
		changshoujiaowaiArray[changshoujiaowaiRow] = tempx.."@"..tempy
		changshoujiaowaiXYArray[changshoujiaowaiRow] = "1@"..arrO[4].."@"..arrO[5].."@"
		changshoujiaowaiRow = changshoujiaowaiRow+1
	elseif(cityNameO == "jnyw")
	then
		jiangnanyewaiArray[jiangnanyewaiRow] = tempx.."@"..tempy
		jiangnanyewaiXYArray[jiangnanyewaiRow] = "1@"..arrO[4].."@"..arrO[5].."@"
		jiangnanyewaiRow = jiangnanyewaiRow+1
	elseif(cityNameO == "bjlz" and beijuluzhouFlag ~= nil)
	then
		beijuluzhouArray[beijuluzhouRow] = tempx.."@"..tempy
		beijuluzhouXYArray[beijuluzhouRow] = "1@"..arrO[4].."@"..arrO[5].."@"
		beijuluzhouRow = beijuluzhouRow+1
	elseif(cityNameO == "qls" and qilinshanFlag ~= nil)
	then
		qilinshanArray[qilinshanRow] = tempx.."@"..tempy
		qilinshanXYArray[qilinshanRow] = "1@"..arrO[4].."@"..arrO[5].."@"
		qilinshanRow = qilinshanRow+1
	end
	-- nLog("开始等待取宝图成功")
	--[[
	while(true)
	do
		mSleep(200)
		if countCangKuBeiBaoEmptyY(2) < thresholdO then
			break
		end
	end
	]]
	local getsuccess = false
	for tmpx = 0,40 do
		mSleep(200)
		if countCangKuBeiBaoEmptyY(2) < thresholdO then
			getsuccess = true
			break
		end
	end
	if getsuccess == false then
		-- nLog("取宝图失败，递归取")
		getOne(ckPageO,arrO,thresholdO,cityNameO)
	end
	-- nLog("取宝图成功，本次取宝图结束")
	return ckPageO
end

--修改完毕
function resetck()
	while( havLast() )
	do
		tapp(256,937,5)
		mSleep(200)
	end
end

--修改完毕
function doStay()
	tapp(1008,1016,5)
	mSleep(100)
	tapp(1454,401,10)
	mSleep(100)
	tapp(1866,182,5)
	mSleep(100)
end

--修改完毕
function exitGame()
	
	mSleep(100)
	tapp(445,90,0)
	mSleep(100)
	tapp(1165,671,0)
end

function upload2()
	
	path = userPath();
	path = path.."/res/test1.png"
	
	local files
	local file = io.open(path,"rb")

	if file then
		files = file:read("*a")
		file:close()
	else
		toast("没有找到文件",2)
	end
	base64 = ZZBase64.encode(files)
	
	
	--timestamp = os.time()
	cutImageStr = post(base64)
	return cutImageStr
end



function getMapName()
	local ret = tsOcrText(index, 131, 34, 328, 82, "070707 , 060606 # 1B1C1E , 1A1B1D", 90)
	ret = string.gsub(ret,"@","")
	return ret
end


function getCAJD()
	local i1
	for i1=0,100,1 do
		if getMapName() == "长安酒店" then
			return true
		end
		mSleep(100)
	end
	return false
end

function getCAGZJ()
	local i1
	for i1=0,100,1 do
		if getMapName() == "国子监书库" then
			return true
		end
		mSleep(100)
	end
	return false
end

function getALGKZ()
	local i1,str
	for i1=0,100,1 do
		str = getMapName()
		if str == "傲来国客" or str == "傲来国客栈" then
			return true
		end
		mSleep(100)
	end
	return false
end

--等待直到当前地图为长安城
--20230812测试通过
function getCAC()
	local i1
	for i1=0,100,1 do
		if getMapName() == "长安城" then
			return true
		end
		mSleep(100)
	end
	return false
end


function getCAZHD()
	local i1
	for i1=0,100,1 do
		if getMapName() == "南化杂货店" then
			return true
		end
		mSleep(100)
	end
	return false
end

function getALG()
	local i1
	for i1=0,100,1 do
		if getMapName() == "傲来国" then
			return true
		end
		mSleep(100)
	end
	return false
end

function getALGYD()
	local i1
	for i1=0,100,1 do
		if getMapName() == "傲来国药店" then
			return true
		end
		mSleep(100)
	end
	return false
end

function getCSC()
	local i1
	for i1=0,100,1 do
		if getMapName() == "长寿村" then
			return true
		end
		mSleep(100)
	end
	return false
end

function getCSCDP()
	local i1
	for i1=0,100,1 do
		if getMapName() == "长寿村当铺" then
			return true
		end
		mSleep(100)
	end
	return false
end

function getCSCJD()
	local i1
	for i1=0,100,1 do
		if getMapName() == "长寿村酒馆" then
			return true
		end
		mSleep(100)
	end
	return false
end

function getDTGJ()
	local i1
	for i1=0,100,1 do
		if getMapName() == "大唐国境" then
			return true
		end
		mSleep(100)
	end
	return false
end

function getDTJW()
	local i1
	for i1=0,100,1 do
		if getMapName() == "大唐境外" then
			return true
		end
		mSleep(100)
	end
	return false
end


function exitDTJW()
	local i1
	for i1=0,100,1 do
		if getMapName() ~= "大唐境外" then
			mSleep(2000)
			return true
		end
		mSleep(100)
	end
	return false
end

function getJYC()
	local i1
	for i1=0,100,1 do
		if getMapName() == "建邺城" then
			return true
		end
		mSleep(100)
	end
	return false
end

function getJYCZHD()
	local i1,str
	for i1=0,100,1 do
		str = getMapName()
		if str == "东升货" or str == "东升货栈" then
			return true
		end
		mSleep(100)
	end
	return false
end

function getJYCBD()
	local i1
	for i1=0,100,1 do
		if getMapName() == "李记布庄" then
			return true
		end
		mSleep(100)
	end
	return false
end



function getHGS()
	local i1
	for i1=0,100,1 do
		if getMapName() == "花果山" then
			return true
		end
		mSleep(100)
	end
	return false
end


function getNEC()
	local i1
	for i1=0,100,1 do
		if getMapName() == "女儿村" then
			return true
		end
		mSleep(100)
	end
	return false
end

function getDHW()
	local i1
	for i1=0,100,1 do
		if getMapName() == "东海湾" then
			return true
		end
		mSleep(100)
	end
	return false
end


function getJNYW()
	local i1
	for i1=0,100,1 do
		if getMapName() == "江南野外" then
			return true
		end
		mSleep(100)
	end
	return false
end

function getZZG()
	local i1
	for i1=0,100,1 do
		if getMapName() == "朱紫国" then
			return true
		end
		mSleep(100)
	end
	return false
end

function getSTL()
	local i1
	for i1=0,100,1 do
		if getMapName() == "狮驼岭" then
			return true
		end
		mSleep(100)
	end
	return false
end

function getPTS()
	local i1
	for i1=0,100,1 do
		if getMapName() == "普陀山" then
			return true
		end
		mSleep(100)
	end
	return false
end


function getDF()
	local i1
	for i1=0,100,1 do
		if getMapName() == "地府" then
			return true
		end
		mSleep(100)
	end
	return false
end


function getBXG()
	local i1
	for i1=0,100,1 do
		if getMapName() == "宝象国" then
			return true
		end
		mSleep(100)
	end
	return false
end

function getXLNG()
	local i1
	for i1=0,100,1 do
		if getMapName() == "西梁女国" then
			return true
		end
		mSleep(100)
	end
	return false
end

function getLHS()
	if getMapName() == "轮回司" then
		return true
	end
	return false
end


function getCSJW()
	local i1
	for i1=0,100,1 do
		if getMapName() == "长寿郊外" then
			return true
		end
		mSleep(100)
	end
	return false
end


function getHSS()
	local i1
	for i1=0,100,1 do
		if getMapName() == "化生寺" then
			return true
		end
		mSleep(100)
	end
	return false
end


function getCASPD()
	local i1
	for i1=0,100,1 do
		if getMapName() == "锦绣饰品店" then
			return true
		end
		mSleep(100)
	end
	return false
end

function getCAYD()
	local i1
	for i1=0,100,1 do
		if getMapName() == "回春堂" then
			return true
		end
		mSleep(100)
	end
	return false
end

--需要做字库
--Ally
function getBJLZ()
	local i1
	for i1=0,100,1 do
		if getMapName() ~= "长寿郊外" then
			return true
		end
		mSleep(100)
	end
	return false
end

function getMJC()
	local i1
	for i1=0,100,1 do
		if getMapName() ~= "大唐境外" then
			return true
		end
		mSleep(100)
	end
	return false
end

function tapp(x9,y9,r9)
	local randomx = 0
	local randomy = 0
	if r9 ~= 0 then
		randomx = math.random(r9*2+1) - r9
		randomy = math.random(r9*2+1) - r9
	end
	-- nLog("点击坐标"..(x9+randomx)..","..(y9+randomy))
	os.execute("input mouse tap "..(x9+randomx).." "..(y9+randomy))
end

function tappp(x9,y9,xr9,yr9)
	local randomx = 0
	local randomy = 0
	if xr9 ~= 0 then
		randomx = math.random(xr9*2) - xr9
	end
	if yr9 ~= 0 then
		randomy = math.random(yr9*2) - yr9
	end
	nLog("点击坐标:"..(x9+randomx)..","..(y9+randomy),1)
	os.execute("input mouse tap "..(x9+randomx).." "..(y9+randomy))
end


--20230812 测试通过
function openPacket()
	-- nLog("打开背包开始")
	-- body
   --打包背包
	mSleep(500)
	tapp(1701,1021,10)
	if tempPackageFlag == false then
		if isPackageOpen() then
			return
		else
			tapp(1606,832,30)
			if isPackageOpen() then
				tempPackageFlag = true
			else
				dialog("打开背包失败，5s内手动打开背包")
				mSleep(5000)
			end
		end
	else
		tapp(1606,832,30)
		if isPackageOpen() then
			tempPackageFlag = true
		else
			dialog("打开背包失败，5s内手动打开背包")
			mSleep(5000)
		end
	end
	
	-- nLog("打开背包结束")
end


function tapPackageMap1()
	
	--908 278 1012 366
	--136
	keepScreen(true)
	local tmpList = {}
	for tpmy = 0,2 do
		for tpmx=0,4 do
			x1,y1 = findMultiColorInRegionFuzzy( 0xf01460, "-3|-8|0xed2b5f,4|7|0xec2759,34|3|0xeae59b,-27|-13|0xeaec9d,-6|-26|0x8f6849,-8|20|0xcb9c7a", 90, 908+tpmx*136, 278+tpmy*136, 1012+tpmx*136, 366+tpmy*136)
			if x1>-1 then
				tmpList[x1.."#"..y1] = y1
			end
		end
	end
	for x1, y1 in pairs(tmpList) do
		x1 = string.gsub(x1,"#"..y1,'')
		tapp(x1,y1,20)
		mSleep(200)
	end
	tmpList = nil
	keepScreen(false)
end


function tapPackageMap2()
	
	--908 278 1012 366
	--136
	keepScreen(true)
	local tmpList = {}
	for tpmy = 2,0,-1 do
		for tpmx=0,4 do
			x1,y1 = findMultiColorInRegionFuzzy( 0xf01460, "-3|-8|0xed2b5f,4|7|0xec2759,34|3|0xeae59b,-27|-13|0xeaec9d,-6|-26|0x8f6849,-8|20|0xcb9c7a", 90, 908+tpmx*136, 278+tpmy*136, 1012+tpmx*136, 366+tpmy*136)
			if x1>-1 then
				tmpList[x1.."#"..y1] = y1
			end
		end
	end
	for x1, y1 in pairs(tmpList) do
		x1 = string.gsub(x1,"#"..y1,'')
		tapp(x1,y1,20)
		mSleep(100)
	end
	tmpList = nil
	keepScreen(false)
end

function tapPackageMap3()
	
	--908 278 1012 366
	--136
	keepScreen(true)
	local tmpList = {}
	for tpmy = 0,2 do
		for tpmx=4,0,-1 do
			x1,y1 = findMultiColorInRegionFuzzy( 0xf01460, "-3|-8|0xed2b5f,4|7|0xec2759,34|3|0xeae59b,-27|-13|0xeaec9d,-6|-26|0x8f6849,-8|20|0xcb9c7a", 90, 908+tpmx*136, 278+tpmy*136, 1012+tpmx*136, 366+tpmy*136)
			if x1>-1 then
				tmpList[x1.."#"..y1] = y1
			end
		end
	end
	for x1, y1 in pairs(tmpList) do
		x1 = string.gsub(x1,"#"..y1,'')
		tapp(x1,y1,20)
		mSleep(100)
	end
	tmpList = nil
	keepScreen(false)
end


function tapPackageMap4()
	
	--908 278 1012 366
	--136
	keepScreen(true)
	local tmpList = {}
	for tpmy = 2,0,-1 do
		for tpmx=4,0,-1 do
			x1,y1 = findMultiColorInRegionFuzzy( 0xf01460, "-3|-8|0xed2b5f,4|7|0xec2759,34|3|0xeae59b,-27|-13|0xeaec9d,-6|-26|0x8f6849,-8|20|0xcb9c7a", 90, 908+tpmx*136, 278+tpmy*136, 1012+tpmx*136, 366+tpmy*136)
			if x1>-1 then
				tmpList[x1.."#"..y1] = y1
			end
		end
	end
	for x1, y1 in pairs(tmpList) do
		x1 = string.gsub(x1,"#"..y1,'')
		tapp(x1,y1,20)
		mSleep(100)
	end
	tmpList = nil
	keepScreen(false)
end


function tapPackageMapX(mTime)

	--908 278 1012 366
	--136
	keepScreen(true)
	local tmpList = {}
	for tpmy = 0,2 do
		for tpmx=4,0,-1 do
			x1,y1 = findMultiColorInRegionFuzzy( 0xf01460, "-3|-8|0xed2b5f,4|7|0xec2759,34|3|0xeae59b,-27|-13|0xeaec9d,-6|-26|0x8f6849,-8|20|0xcb9c7a", 90, 908+tpmx*136, 278+tpmy*136, 1012+tpmx*136, 366+tpmy*136)
			if x1>-1 then
				tmpList[x1.."#"..y1] = y1
			end
		end
	end
	for x1, y1 in pairs(tmpList) do
		x1 = string.gsub(x1,"#"..y1,'')
		tapp(x1,y1,20)
		mSleep(mTime)
	end
	tmpList = nil
	keepScreen(false)
end

function ifDialogOpen()
	local xif,yif,iif
	for iif = 0,20 do
		xif,yif = findMultiColorInRegionFuzzy( 0xa0c0c8, "-19|0|0x304850,-12|-11|0xa0bcc8,11|-9|0xa0c0c8,15|-1|0x304850,12|11|0x98bcc8", 90, 1818, 769, 1916, 822)
		if xif>0 then
			return true
		end
		mSleep(500)
	end
	return false
end


function tapPackageMap5time()

	--908 278 1012 366
	--136
	keepScreen(true)
	local tmpList = {}
	for tpmy = 0,2 do
		for tpmx=4,0,-1 do
			x1,y1 = findMultiColorInRegionFuzzy( 0xf01460, "-3|-8|0xed2b5f,4|7|0xec2759,34|3|0xeae59b,-27|-13|0xeaec9d,-6|-26|0x8f6849,-8|20|0xcb9c7a", 90, 908+tpmx*136, 278+tpmy*136, 1012+tpmx*136, 366+tpmy*136)
			if x1>-1 then
				tmpList[x1.."#"..y1] = y1
			end
		end
	end
	local tapcount = 1
	for x1, y1 in pairs(tmpList) do
		x1 = string.gsub(x1,"#"..y1,'')
		tapp(x1,y1,20)
		mSleep(100)
		tapcount = tapcount +1
		if tapcount > 5 then
			break
		end
	end
	tmpList = nil
	keepScreen(false)
end


function getRandom10()
	return math.random(9)+1
end

function sortxl(tmpArray,tmpArray2)

	local tmpArrayl,tmpArrayr
	for tmpi = 1,#tmpArray2-1 do
		tmpArrayl = strSplit(tmpArray2[tmpi],"@")
		for tmpj = tmpi+1,#tmpArray2 do
			tmpArrayr = strSplit(tmpArray2[tmpj],"@")
			if tonumber((string.gsub(tmpArrayl[2],"[^0-9]",""))) > tonumber((string.gsub(tmpArrayr[2],"[^0-9]",""))) then
				tmpArrayl = tmpArrayr
				tmp = tmpArray[tmpi]
				tmpArray[tmpi] = tmpArray[tmpj]
				tmpArray[tmpj] = tmp
				tmp = tmpArray2[tmpi]
				tmpArray2[tmpi] = tmpArray2[tmpj]
				tmpArray2[tmpj] = tmp
			end
		end
	end
	
end

function sortxr(tmpArray,tmpArray2)

	local tmpArrayl,tmpArrayr
	for tmpi = 1,#tmpArray2-1 do
		tmpArrayl = strSplit(tmpArray2[tmpi],"@")
		for tmpj = tmpi+1,#tmpArray2 do
			tmpArrayr = strSplit(tmpArray2[tmpj],"@")
			if tonumber((string.gsub(tmpArrayl[2],"[^0-9]",""))) < tonumber((string.gsub(tmpArrayr[2],"[^0-9]",""))) then
				tmpArrayl = tmpArrayr
				tmp = tmpArray[tmpi]
				tmpArray[tmpi] = tmpArray[tmpj]
				tmpArray[tmpj] = tmp
				tmp = tmpArray2[tmpi]
				tmpArray2[tmpi] = tmpArray2[tmpj]
				tmpArray2[tmpj] = tmp
			end
		end
	end
end

function sortyd(tmpArray,tmpArray2)

	local tmpArrayl,tmpArrayr
	for tmpi = 1,#tmpArray2-1 do
		tmpArrayl = strSplit(tmpArray2[tmpi],"@")
		for tmpj = tmpi+1,#tmpArray2 do
			tmpArrayr = strSplit(tmpArray2[tmpj],"@")
			
			if tonumber((string.gsub(tmpArrayl[3],"[^0-9]",""))) > tonumber((string.gsub(tmpArrayr[3],"[^0-9]",""))) then
				tmpArrayl = tmpArrayr
				tmp = tmpArray[tmpi]
				tmpArray[tmpi] = tmpArray[tmpj]
				tmpArray[tmpj] = tmp
				tmp = tmpArray2[tmpi]
				tmpArray2[tmpi] = tmpArray2[tmpj]
				tmpArray2[tmpj] = tmp
			end
		end
	end
end

function sortyt(tmpArray,tmpArray2)

	local tmpArrayl,tmpArrayr
	for tmpi = 1,#tmpArray2-1 do
		tmpArrayl = strSplit(tmpArray2[tmpi],"@")
		for tmpj = tmpi+1,#tmpArray2 do
			tmpArrayr = strSplit(tmpArray2[tmpj],"@")
			if tonumber((string.gsub(tmpArrayl[3],"[^0-9]",""))) < tonumber((string.gsub(tmpArrayr[3],"[^0-9]",""))) then
				tmpArrayl = tmpArrayr
				tmp = tmpArray[tmpi]
				tmpArray[tmpi] = tmpArray[tmpj]
				tmpArray[tmpj] = tmp
				tmp = tmpArray2[tmpi]
				tmpArray2[tmpi] = tmpArray2[tmpj]
				tmpArray2[tmpj] = tmp
			end
		end
	end
end

function cangKuOpenSuccess()
	local ckosx,ckosy,ckosi
	for ckosi=0,20 do
		ckosx,ckosy = findMultiColorInRegionFuzzy( 0x183850, "-18|0|0x30597f,-3|-16|0x477c9f,-16|-16|0x203f56,14|-16|0x183c50,16|0|0x305c80", 90, 1579, 52, 1638, 106)
		if ckosx>0 then
			return true
		end
		mSleep(500)
	end
	return false
	
end

function inputWordValidate(original,x1,y1,x2,y2)

	path = userPath();
	path = path.."/res/test1.png"
	snapshot(path, x1, y1, x2, y2)


	local files
	local file = io.open(path,"rb")

	if file then
		files = file:read("*a")
		file:close()
	else
		toast("没有找到文件",2)
	end
	base64 = ZZBase64.encode(files)
	nLog(base64)

	local a = post2(base64)
	toast(a)
	mSleep(3000)
	--return original == a
	return a 
end

--20230812测试通过
function useCangbaotu()
	while (true) do
		x1,y1 = findMultiColorInRegionFuzzy( 0x02f602, "", 90, 441, 511, 669, 548)
		if x1>-1 then
			break
		end
	end
	x1,y1 = findMultiColorInRegionFuzzy( 0xffffff, "1|-20|0x385c70,0|28|0x284450,67|-23|0x3e5c70,71|-5|0x305368", 90, 665, 564, 768, 887)
	tapp(x1,y1,20)
end


--20230812 无需测试
function table_leng(t)
  local leng=0
  for k, v in pairs(t) do
    leng=leng+1
  end
  return leng;
end

--修改完毕
--20230812 测试通过
function useFly()
	local x1,y1
	x1,y1 = findFly()
	if x1 == -1 then
		dialog("请在1分钟内购买飞行符，并放在包囊最下排")
		mSleep(60000)
		x1,y1 = findFly()
		if x1 == -1 then
			error("未发现飞行符，脚本结束")
			mSleep(10)
		end
	end
	
	tapp(x1,y1,5)
	--使用飞行符
	mSleep(600)
	--点击使用
	tapp(664,611,5)
	for i=0,9,1 do
		if isFlyOpen() then
			return 
		end
	end
	error("异常：使用飞行符失败")
	
end

--关闭背包
--20230812 测试通过
function closePacket()
	mSleep(500)
	tapp(1600,80,20)
	mSleep(500)
end

--修改完毕
--打开小地图
function openMap(...)
    if math.random(11) > 5 then
    	tappp(229,80,81,41)
    	mSleep(500)
	else
    	tappp(67,84,22,38)
    	mSleep(500)
	end
end


--修改完毕
--20230812 测试通过
function useSYX()
	
	local x1,y1
	x1,y1 = findSYX()
	if x1 == -1 then
		error("未发现摄妖香，脚本结束")
	end
	
	tapp(x1,y1,50)

	mSleep(600)
	--点击使用
	tapp(650,620,20)
end

--计算背包内藏宝图数量
--20230812测试通过
function countMap()
	
	keepScreen(true)
	local mapCount = 0
	local x1,y1
	for x=0,4 do
		for y=0,2 do
			x1,y1 = findMultiColorInRegionFuzzy( 0xed2b5f, "3|8|0xf01560,6|15|0xef2158,-13|-30|0xf0f5d4,-24|-6|0xf0eeab,-31|23|0xeeefb8,29|37|0xeff1c9,37|9|0xeae39e,46|-15|0xf0f1cd", 90, 897+x*135, 260+y*135, 1026+x*135, 391+y*135)
			if x1~=-1 then
				mapCount = mapCount +1
			end
		end
	end
	keepScreen(false)
	return mapCount
end

--遇怪自动
--20230818测试通过
function slayMonster(...)
	time = 0
	while(true) do
		fightflag = waitFight()
		if fightflag == 1 then
			time = time +1
            toast("自动第"..time.."回合")
			--toast("fighting...",1)
			tapp(1832,1021,5)
			tapp(1832,1021,5)
		elseif fightflag == 0 then
		    toast("战斗中，等待战斗结束")    
	    else
			return time
		end
    	mSleep(3000)
	end
end

--修改完毕
function localZuobiao()
	--snapshot(userPath() .. "/res/getColor.png", 957, 151, 988, 300)
	path = userPath();
	path = path.."/res/test1.png"
	snapshot(path, 151, 92, 300, 123)


	local files
	local file = io.open(path,"rb")

	if file then
		files = file:read("*a")
		file:close()
	else
		toast("没有找到文件",2)
	end
	base64 = ZZBase64.encode(files)

	--local newImage1,msg = image.loadFile(userPath() .. "/res/getColor.png")
	--local base64 = imageTurn270ToBase64(newImage1)
	local a = post1(base64)
	return a
end

--to长安城
--20230812测试通过
function toChangancheng(...)
	useFly()
	tapp(1180,498,30)
	closePacket()
	
	if getCAC() then
		return
	else
		dialog("飞长安城失败")
	end
end

--飞行符飞朱紫国
--20230812修改未测试
--20230818测试通过
function toZhuziguo(...)
	useFly()
	tapp(853,729,15)
	closePacket()
	if getZZG() then
		return
	else
		dialog("飞朱紫国失败")
	end
end

--朱紫国移动到指定坐标
--20230818测试通过
function zhuziguo(data)
	--closePacket()
	openMap()
	tappp(550,115,20,10)
	x = strSplit(data[2],"-")
	for i=1,table_leng(x)-1 do
		local n = x[i]
		if(n == "1")
		then
			mSleep(100)
			tapp(498,289,52)
		elseif(n == "2")
		then
			mSleep(100)
			tapp(648,289,52)
		elseif(n == "3")
		then
			mSleep(100)
			tapp(798,289,52)
		elseif(n == "4")
		then
			mSleep(100)
			tapp(498,439,52)
		elseif(n == "5")
		then
			mSleep(100)
			tapp(648,439,52)
		elseif(n == "6")
		then
			mSleep(100)
			tapp(798,439,52)
		elseif(n == "7")
		then
			mSleep(100)
			tapp(498,589,52)
		elseif(n == "8")
		then
			mSleep(100)
			tapp(648,589,52)
		elseif(n == "9")
		then
			mSleep(100)
			tapp(798,589,52)
		elseif(n == "0")
		then
			mSleep(100)
			tapp(948,445,52)

		end
	end
	mSleep(200)
    tapp(1600,400,300)
    
    tappp(752,117,46,27)
	y = strSplit(data[3],"-")
	for i=1,table_leng(y)-1 do
		local n = y[i]
		if(n == "1")
		then
			mSleep(100)
			tapp(701,292,52)
		elseif(n == "2")
		then
			mSleep(100)
			tapp(851,292,52)
		elseif(n == "3")
		then
			mSleep(100)
			tapp(1001,292,52)
		elseif(n == "4")
		then
			mSleep(100)
			tapp(701,442,52)
		elseif(n == "5")
		then
			mSleep(845)
			tapp(851,442,52)
		elseif(n == "6")
		then
			mSleep(100)
			tapp(1001,442,52)
		elseif(n == "7")
		then
			mSleep(100)
			tapp(701,592,52)
		elseif(n == "8")
		then
			mSleep(100)
			tapp(851,592,52)
		elseif(n == "9")
		then
			mSleep(100)
			tapp(1001,592,52)
		elseif(n == "0")
		then
			mSleep(100)
			tapp(1151,442,52)

		end
	end
	mSleep(200)
	if math.random(9)>6 then
	    tapp(1145,595,20)
	else
	    tappp(943,117,86,28)
	end
    tappp(943,117,86,28)
	mSleep(200)
	tapp(1563,70,28)
end

--飞朱紫国移动麒麟山
function toQilinshan()
	toZhuziguo()
	toQilinshan2()
end

--朱紫国移动到麒麟山
--20230818测试通过
function toQilinshan2()
	zhuziguo({"1","4-","1-0-9-"})
	mSleep(2000)
	openPacket()
	mSleep(500)
	tapPackageMapX(400)
	mSleep(2000)
	closePacket()
	local str = "@4-@1-0-9-@"
	local lastxy,nowxy
	
	--容错
	repeat
		mSleep(3000)
		nowxy = localZuobiao()
		if nowxy == lastxy then
			return toQilinshan2()
		else
			lastxy = nowxy
		end
	until(nowxy==str)
	if math.random(9)>6 then
	    tapp(50,150,0)
	else
	    tapp(1432,680,42)
	end
	mSleep(3000)
end

--麒麟山移动到指定坐标
function qilinshan(data)

	openMap()
	mSleep(200)
	--选择X坐标输入框
	tappp(527,167,50,23)
	--获取x坐标 x-x-x-
	x = strSplit(data[2],"-")
	for i=1,table_leng(x)-1 do
		mSleep(100)
		local n = x[i]
		if(n == "1")
		then
			tapp(473,340,52)
		elseif(n == "2")
		then
			tapp(623,340,52)
		elseif(n == "3")
		then
			tapp(773,340,52)
		elseif(n == "4")
		then
			tapp(473,490,52)
		elseif(n == "5")
		then
			tapp(623,490,52)
		elseif(n == "6")
		then
			tapp(773,490,52)
		elseif(n == "7")
		then
			tapp(473,640,52)
		elseif(n == "8")
		then
			tapp(623,640,52)
		elseif(n == "9")
		then
			tapp(773,640,52)
		elseif(n == "0")
		then
			tapp(923,490,52)
		end
	end
	--点击其他位置
	mSleep(200)
	tapp(1600,400,300)
	
	tappp(729,166,49,22)
	y = strSplit(data[3],"-")
	for i=1,table_leng(y)-1 do
		mSleep(100)
		local n = y[i]
		if(n == "1")
		then
			tapp(673,340,52)
		elseif(n == "2")
		then
			tapp(823,340,52)
		elseif(n == "3")
		then
			tapp(973,340,52)
		elseif(n == "4")
		then
			tapp(673,490,52)
		elseif(n == "5")
		then
			tapp(823,490,52)
		elseif(n == "6")
		then
			tapp(973,490,52)
		elseif(n == "7")
		then
			tapp(673,640,52)
		elseif(n == "8")
		then
			tapp(823,640,52)
		elseif(n == "9")
		then
			tapp(973,640,52)
		elseif(n == "0")
		then
			tapp(1123,490,52)
		end
	end
	--点击确定
	mSleep(200)
	if math.random(9)>6 then
	    tapp(1123,640,52)
	else
	    tapp(1600,400,300)
	end
	--点击前往
	tappp(918,166,90,26)
	--点击关闭地图
	mSleep(200)
	tapp(1588,121,24)
end
--移动到大唐境外
function toDatangjingwai()
	
	toZhuziguo()
	zhuzi2jingwai()
end
--朱紫国移动到大唐境外
--20230818测试通过
function zhuzi2jingwai()
	zhuziguo({"1-","7-","3-"})
	mSleep(2000)
	openPacket()
	mSleep(500)
	tapPackageMapX(450)
	mSleep(2000)
	closePacket()
	local str = "@7-@3-@"
	local lastxy,nowxy
	
	--容错
	repeat
		mSleep(3000)
		nowxy = localZuobiao()
		if nowxy == lastxy then
			return zhuzi2jingwai()
		else
			lastxy = nowxy
		end
	until(nowxy==str)
	if math.random(9)>6 then
	    tapp(38,945,0)
	else
	    tapp(1432,680,42)
	end
	mSleep(1000)
	if getDTJW() then
		return
	else
		dialog("朱紫国进入大唐境外失败")
	end
	
end

--大唐境外移动到指定坐标
function datangjingwai(data)
	
	--点开地图
	openMap()
	--选择X坐标输入框
	tappp(358,335,20,10)
	--获取x坐标 x-x-x-
	x = strSplit(data[2],"-")
	for i=1,table_leng(x)-1 do
		local n = x[i]
		if(n == "1")
		then
			mSleep(100)
			tapp(308,508,52)
		elseif(n == "2")
		then
			mSleep(100)
			tapp(458,508,52)
		elseif(n == "3")
		then
			mSleep(100)
			tapp(608,508,52)
		elseif(n == "4")
		then
			mSleep(100)
			tapp(308,658,52)
		elseif(n == "5")
		then
			mSleep(100)
			tapp(458,658,52)
		elseif(n == "6")
		then
			mSleep(100)
			tapp(608,658,52)
		elseif(n == "7")
		then
			mSleep(100)
			tapp(308,808,52)
		elseif(n == "8")
		then
			mSleep(100)
			tapp(458,808,52)
		elseif(n == "9")
		then
			mSleep(100)
			tapp(608,808,52)
		elseif(n == "0")
		then
			mSleep(100)
			tapp(758,658,52)

		end
	end
	--点击其他位置
	mSleep(200)
    tapp(1600,400,300)

	--选择y坐标输入框
	tappp(560,334,50,23)
	y = strSplit(data[3],"-")
	for i=1,table_leng(y)-1 do
		local n = y[i]
		if(n == "1")
		then
			mSleep(100)
			tapp(510,511,52)
		elseif(n == "2")
		then
			mSleep(100)
			tapp(660,511,52)
		elseif(n == "3")
		then
			mSleep(100)
			tapp(810,511,52)
		elseif(n == "4")
		then
			mSleep(100)
			tapp(510,661,52)
		elseif(n == "5")
		then
			mSleep(100)
			tapp(660,661,52)
		elseif(n == "6")
		then
			mSleep(100)
			tapp(810,661,52)
		elseif(n == "7")
		then
			mSleep(100)
			tapp(510,811,52)
		elseif(n == "8")
		then
			mSleep(100)
			tapp(660,811,52)
		elseif(n == "9")
		then
			mSleep(100)
			tapp(810,811,52)
		elseif(n == "0")
		then
			mSleep(100)
			tapp(960,661,52)

		end
	end
	--点击确定
	mSleep(200)
	if math.random(9)>6 then
	    tapp(960,811,52)
	else
        tapp(1600,400,300)
	end

	--点击前往
	tappp(752,336,89,28)
	--点击关闭地图
	mSleep(200)
	tapp(1754,289,27)
	
end
--大唐境外移动到墨家村
--20230819测试通过
function jingwai2mojiacun(...)
    
	mSleep(1000)
	datangjingwai({"1","2-3-4-","1-1-0-"})
	mSleep(2000)
	openPacket()
	mSleep(500)
	tapPackageMapX(600)
	mSleep(2000)
	closePacket()
	local str = "@2-3-4-@1-1-0-@"
	local lastxy,nowxy
	
	--容错
	repeat
		mSleep(3000)
		nowxy = localZuobiao()
		if nowxy == lastxy then
			return jingwai2mojiacun()
		else
			lastxy = nowxy
		end
	until(nowxy==str)
	
	--点击火焰山土地
	tapp(1124,319,0)
	if ifDialogOpen() == false then
		dialog("手动进入墨家村")
		mSleep(10000)
	else
		--todo
		--墨家村传送人对话框
		tappp(1550,380,100,20)
	end
	mSleep(1000)
	
	--进入墨家村判断
	if getMJC() then
		return
	else
		dialog("进入墨家村失败")
	end
	
end

--移动到墨家村
function toMojiacun()
	-- body
	toDatangjingwai()
	jingwai2mojiacun()
end
--墨家村内移动到指定坐标
--20230819测试通过
function mojiacun(data)
	openMap()
	--选择X坐标输入框
	tappp(651,328,20,10)
	--获取x坐标 x-x-x-
	x = strSplit(data[2],"-")
	for i=1,table_leng(x)-1 do
		local n = x[i]
		if(n == "1")
		then
			mSleep(100)
			tapp(600,502,52)
		elseif(n == "2")
		then
			mSleep(100)
			tapp(750,502,52)
		elseif(n == "3")
		then
			mSleep(100)
			tapp(900,502,52)
		elseif(n == "4")
		then
			mSleep(100)
			tapp(600,652,52)
		elseif(n == "5")
		then
			mSleep(100)
			tapp(750,652,52)
		elseif(n == "6")
		then
			mSleep(100)
			tapp(900,652,52)
		elseif(n == "7")
		then
			mSleep(100)
			tapp(600,802,52)
		elseif(n == "8")
		then
			mSleep(100)
			tapp(750,802,52)
		elseif(n == "9")
		then
			mSleep(100)
			tapp(900,802,52)
		elseif(n == "0")
		then
			mSleep(100)
			tapp(1050,652,52)
		end
	end
	--点击其他位置
	mSleep(200)
    tapp(1600,400,300)
	--选择y坐标输入框
	tappp(657,429,47,24)
	y = strSplit(data[3],"-")
	for i=1,table_leng(y)-1 do
		local n = y[i]
		if(n == "1")
		then
			mSleep(100)
			tapp(602,603,52)
		elseif(n == "2")
		then
			mSleep(100)
			tapp(752,603,52)
		elseif(n == "3")
		then
			mSleep(100)
			tapp(902,603,52)
		elseif(n == "4")
		then
			mSleep(100)
			tapp(602,753,52)
		elseif(n == "5")
		then
			mSleep(100)
			tapp(752,753,52)
		elseif(n == "6")
		then
			mSleep(100)
			tapp(902,753,52)
		elseif(n == "7")
		then
			mSleep(100)
			tapp(602,903,52)
		elseif(n == "8")
		then
			mSleep(100)
			tapp(752,903,52)
		elseif(n == "9")
		then
			mSleep(100)
			tapp(902,903,52)
		elseif(n == "0")
		then
			mSleep(100)
			tapp(1052,753,52)

		end
	end
	--点击其他位置
	mSleep(200)
    tapp(1600,400,300)
	--点击前往
	tappp(644,514,87,28)
	--点击关闭地图
	mSleep(200)
	tapp(1382,31,25)
end

--飞行符飞傲来国
--20230812修改未测试
--20230819测试通过
function toAolaiguo(...)
	useFly()
	tapp(1505,764,25)
	closePacket()
	if getALG() then
		return
	else
		dialog("飞傲来国失败")
	end
end
--傲来国移动到指定坐标
--20230819测试通过
function aolaiguo(data)
	
	openMap()
	mSleep(200)
	tappp(602,122,46,25)
	x = strSplit(data[2],"-")
	for i=1,table_leng(x)-1 do
		local n = x[i]
		if(n == "1")
		then
			mSleep(100)
			tapp(548,296,52)
		elseif(n == "2")
		then
			mSleep(100)
			tapp(698,296,52)
		elseif(n == "3")
		then
			mSleep(100)
			tapp(848,296,52)
		elseif(n == "4")
		then
			mSleep(100)
			tapp(548,446,52)
		elseif(n == "5")
		then
			mSleep(100)
			tapp(698,446,52)
		elseif(n == "6")
		then
			mSleep(100)
			tapp(848,446,52)
		elseif(n == "7")
		then
			mSleep(100)
			tapp(548,596,52)
		elseif(n == "8")
		then
			mSleep(100)
			tapp(698,596,52)
		elseif(n == "9")
		then
			mSleep(100)
			tapp(848,596,52)
		elseif(n == "0")
		then
			mSleep(100)
			tapp(998,446,52)

		end
	end
	--点击其他位置
	mSleep(200)
    tapp(1600,400,300)

	--选择y坐标输入框
	tappp(802,132,47,36)
	y = strSplit(data[3],"-")
	for i=1,table_leng(y)-1 do
		local n = y[i]
		if(n == "1")
		then
			mSleep(100)
			tapp(747,296,52)
		elseif(n == "2")
		then
			mSleep(100)
			tapp(897,296,52)
		elseif(n == "3")
		then
			mSleep(100)
			tapp(1047,296,52)
		elseif(n == "4")
		then
			mSleep(100)
			tapp(747,446,52)
		elseif(n == "5")
		then
			mSleep(100)
			tapp(897,446,52)
		elseif(n == "6")
		then
			mSleep(100)
			tapp(1047,446,52)
		elseif(n == "7")
		then
			mSleep(100)
			tapp(747,596,52)
		elseif(n == "8")
		then
			mSleep(100)
			tapp(897,596,52)
		elseif(n == "9")
		then
			mSleep(100)
			tapp(1047,596,52)
		elseif(n == "0")
		then
			mSleep(100)
			tapp(1197,446,52)

		end
	end
	--点击确定
	mSleep(200)
	if math.random(9) > 6 then
	    tapp(1195,596,52)
	else
        tapp(1600,400,300)
	end

	tappp(991,123,85,30)
	--点击关闭地图
	mSleep(400)
	tapp(1514,77,25)
end

--移动到女儿村
--20230819测试通过
function toNvercun()

	toAolaiguo()
	toNvercun2()
end
--从傲来国移动到女儿村
--20230819测试通过
function toNvercun2()
	
	aolaiguo({"1","9-","1-4-1-"})

	mSleep(2000)
	openPacket()
	mSleep(500)
	tapPackageMapX(500)
	mSleep(2000)
	closePacket()

	local str = "@9-@1-4-1-@"
	local lastxy,nowxy
	
	--容错
	repeat
		mSleep(3000)
		nowxy = localZuobiao()
		if nowxy == lastxy then
			return toNvercun2()
		else
			lastxy = nowxy
		end
	until(nowxy==str)
	if math.random(9)>6 then
	    tapp(61,313,0)
	else
	    tapp(1432,680,42)
	end
	mSleep(1000)
	if getNEC() then
		return
	else
		dialog("进入女儿村失败")
	end
	
end

--女儿村移动到坐标
--20230819测试通过
function nvercun(data)
	openMap()
	tappp(530,360,49,26)
	x = strSplit(data[2],"-")
	for i=1,table_leng(x)-1 do
		local n = x[i]
		if(n == "1")
		then
			mSleep(100)
			tapp(475,534,52)
		elseif(n == "2")
		then
			mSleep(100)
			tapp(625,534,52)
		elseif(n == "3")
		then
			mSleep(100)
			tapp(775,534,52)
		elseif(n == "4")
		then
			mSleep(100)
			tapp(475,684,52)
		elseif(n == "5")
		then
			mSleep(100)
			tapp(625,684,52)
		elseif(n == "6")
		then
			mSleep(100)
			tapp(775,684,52)
		elseif(n == "7")
		then
			mSleep(100)
			tapp(475,834,52)
		elseif(n == "8")
		then
			mSleep(100)
			tapp(625,834,52)
		elseif(n == "9")
		then
			mSleep(100)
			tapp(775,834,52)
		elseif(n == "0")
		then
			mSleep(100)
			tapp(925,684,52)

		end
	end
	mSleep(200)
    tapp(1600,400,300)
	
	tappp(530,463,20,10)
	y = strSplit(data[3],"-")
	for i=1,table_leng(y)-1 do
		local n = y[i]
		if(n == "1")
		then
			mSleep(100)
			tapp(476,634,52)
		elseif(n == "2")
		then
			mSleep(100)
			tapp(626,634,52)
		elseif(n == "3")
		then
			mSleep(100)
			tapp(776,634,52)
		elseif(n == "4")
		then
			mSleep(100)
			tapp(476,784,52)
		elseif(n == "5")
		then
			mSleep(100)
			tapp(626,784,52)
		elseif(n == "6")
		then
			mSleep(100)
			tapp(776,784,52)
		elseif(n == "7")
		then
			mSleep(100)
			tapp(476,934,52)
		elseif(n == "8")
		then
			mSleep(100)
			tapp(626,934,52)
		elseif(n == "9")
		then
			mSleep(100)
			tapp(776,934,52)
		elseif(n == "0")
		then
			mSleep(100)
			tapp(926,784,52)

		end
	end
	mSleep(200)
    if math.random(9)>6 then
	    tapp(926,934,52)
	else
        tapp(1600,400,300)
    end
    
		
	tappp(519,547,87,27)
	mSleep(200)
	tapp(1508,62,26)
end
--移动到花果山
function toHuaguoshan()
	
	toAolaiguo()
	toHuaguoshan2()
end
-- 傲来国移动到花果山
function toHuaguoshan2()
	
	aolaiguo({"1","2-1-2-","1-4-3-"})
	mSleep(2000)
	openPacket()
	mSleep(500)
	tapPackageMapX(250)
	mSleep(2000)
	closePacket()
	
	local str = "@2-1-2-@1-4-3-@"
	local lastxy,nowxy
	
	--容错
	repeat
		mSleep(3000)
		nowxy = localZuobiao()
		if nowxy == lastxy then
			return toHuaguoshan2()
		else
			lastxy = nowxy
		end
	until(nowxy==str)
	if math.random(9)>6 then
	    tapp(1640,156,0)
	else
	    tapp(1432,680,42)
	end
	mSleep(1000)
	if getHGS then
		return
	else
		dialog("进入花果山失败")
	end
end

--花果山移动到指定坐标
function huaguoshan(data)
	openMap()
	--选择X坐标输入框
	tappp(542,165,49,25)
	--获取x坐标 x-x-x-
	x = strSplit(data[2],"-")
	for i=1,table_leng(x)-1 do
		local n = x[i]
		if(n == "1")
		then
			mSleep(100)
			tapp(488,340,52)
		elseif(n == "2")
		then
			mSleep(100)
			tapp(635,340,52)
		elseif(n == "3")
		then
			mSleep(100)
			tapp(785,340,52)
		elseif(n == "4")
		then
			mSleep(100)
			tapp(485,490,52)
		elseif(n == "5")
		then
			mSleep(100)
			tapp(635,490,52)
		elseif(n == "6")
		then
			mSleep(100)
			tapp(785,490,52)
		elseif(n == "7")
		then
			mSleep(100)
			tapp(485,640,52)
		elseif(n == "8")
		then
			mSleep(100)
			tapp(635,640,52)
		elseif(n == "9")
		then
			mSleep(100)
			tapp(785,640,52)
		elseif(n == "0")
		then
			mSleep(100)
			tapp(935,490,52)

		end
	end
	--点击其他位置
	mSleep(200)
    tapp(1600,400,300)
	
	--选择y坐标输入框
	tappp(742,166,49,25)
	y = strSplit(data[3],"-")
	for i=1,table_leng(y)-1 do
		local n = y[i]
		if(n == "1")
		then
			mSleep(100)
			tapp(688,340,52)
		elseif(n == "2")
		then
			mSleep(100)
			tapp(848,340,52)
		elseif(n == "3")
		then
			mSleep(100)
			tapp(988,340,52)
		elseif(n == "4")
		then
			mSleep(100)
			tapp(688,490,52)
		elseif(n == "5")
		then
			mSleep(100)
			tapp(848,490,52)
		elseif(n == "6")
		then
			mSleep(100)
			tapp(988,490,52)
		elseif(n == "7")
		then
			mSleep(100)
			tapp(688,640,52)
		elseif(n == "8")
		then
			mSleep(100)
			tapp(848,640,52)
		elseif(n == "9")
		then
			mSleep(100)
			tapp(988,640,52)
		elseif(n == "0")
		then
			mSleep(100)
			tapp(1148,490,52)

		end
	end
	--点击确定
	mSleep(200)
	if math.random(9)>6 then
	    tapp(1145,640,52)
	else
	    tapp(1600,400,300)
    end
	--点击前往
	tappp(931,167,86,29)
	--点击关闭地图
	mSleep(200)
	tapp(1574,120,27)

end
--飞行符飞长寿村
--20230819测试通过
function toChangshoucun()
	useFly()
	mSleep(500)
	tapp(775,312,5)
	closePacket()
	if getCSC() then
		return
	else
		dialog("飞长寿村失败")
	end
end
--移动到长寿郊外
function toChangshoujiaowai()
	
	toChangshoucun()
	toChangshoujiaowai2()
end

--长寿村到长寿郊外
function toChangshoujiaowai2()
	openMap()
	--151,3
	mSleep(200)
	tappp(732,152,48,27)
	mSleep(100)
	tapp(678,327,52)
	mSleep(100)
	tapp(828,477,52)
	mSleep(100)
	tapp(678,327,52)
	mSleep(100)
	tapp(1600,400,300)
	
	mSleep(200)
	tappp(933,152,49,27)
	mSleep(100)
	tapp(1183,327,52)
	mSleep(100)
	tappp(1800,400,100,300)
	
	mSleep(200)
	tappp(1121,152,88,28)
	mSleep(200)
	tapp(1384,106,26)

	mSleep(2000)
	openPacket()
	mSleep(500)
	tapPackageMapX(350)
	mSleep(2000)
	closePacket()
	local str = "@1-4-7-@7-@"
	local lastxy,nowxy
	
	repeat
		mSleep(3000)
		local nowxy = localZuobiao()
		if nowxy == lastxy then
			return toChangshoujiaowai2()
		else
			lastxy = nowxy
		end
	until(nowxy==str)
	if math.random(9)>6 then
	    tapp(1695,863,67)
	else
	    tapp(1432,680,42)
	end
	mSleep(1000)
	if getCSJW() then
		return
	else
		dialog("进入长寿郊外失败")
	end
end

--长寿郊外移动到坐标
--20230819测试通过
function changshoujiaowai(data)
	openMap()
	--选择X坐标输入框
	tappp(608,167,48,24)
	--获取x坐标 x-x-x-
	x = strSplit(data[2],"-")
	for i=1,table_leng(x)-1 do
		mSleep(100)
		local n = x[i]
		if(n == "1")
		then
			tapp(554,341,52)
		elseif(n == "2")
		then
			tapp(704,341,52)
		elseif(n == "3")
		then
			tapp(854,341,52)
		elseif(n == "4")
		then
			tapp(554,491,52)
		elseif(n == "5")
		then
			tapp(704,491,52)
		elseif(n == "6")
		then
			tapp(854,491,52)
		elseif(n == "7")
		then
			tapp(554,641,52)
		elseif(n == "8")
		then
			tapp(704,641,52)
		elseif(n == "9")
		then
			tapp(854,641,52)
		elseif(n == "0")
		then
			tapp(1004,491,52)
		end
	end
	--点击其他位置
	mSleep(200)
	tappp(1800,400,100,300)

	--选择y坐标输入框
	tappp(809,166,50,23)
	y = strSplit(data[3],"-")
	for i=1,table_leng(y)-1 do
		mSleep(100)
		local n = y[i]
		if(n == "1")
		then
			tapp(754,340,52)
		elseif(n == "2")
		then
			tapp(904,340,52)
		elseif(n == "3")
		then
			tapp(1054,340,52)
		elseif(n == "4")
		then
			tapp(754,490,52)
		elseif(n == "5")
		then
			tapp(904,490,52)
		elseif(n == "6")
		then
			tapp(1054,490,52)
		elseif(n == "7")
		then
			tapp(754,640,52)
		elseif(n == "8")
		then
			tapp(904,640,52)
		elseif(n == "9")
		then
			tapp(1054,640,52)
		elseif(n == "0")
		then
			tapp(1204,490,52)

		end
	end
	--点击确定
	mSleep(200)
	if math.random(9)>6 then
	    tapp(1200,640,52)
	else
	    tappp(1800,400,100,300)
    end

	tappp(998,164,20,10)
	--点击关闭地图
	mSleep(200)
	tapp(1507,120,10)
end
--移动到北俱芦洲
function toBeijuluzhou()
	toChangshoujiaowai()
	toBeijuluzhou2()
end
--长寿郊外移动到北俱芦洲
--20230819测试通过
function toBeijuluzhou2()

	changshoujiaowai({"1","6-3-","6-6-"})
	mSleep(1000)
	openPacket()
	mSleep(500)
	--tapPackageMapX(100)
	tapPackageMap5time()
	mSleep(1000)
	closePacket()
	local str = "@6-3-@6-6-@"
	local lastxy,nowxy
	
	--容错
	repeat
		mSleep(3000)
		nowxy = localZuobiao()
		if nowxy == lastxy then
			return toBeijuluzhou2()
		else
			lastxy = nowxy
		end
	until(nowxy==str)
	
	tapp(840,388,10)
	mSleep(3000)
	tapp(1592,499,2)
	mSleep(1000)
	
	--进入北俱芦洲验证
	if getBJLZ() then
		return
	else
		dialog("进入北俱芦洲失败")
	end
end

--北俱芦洲移动到坐标
--20230819测试通过
function beijuluzhou(data)
	--closePacket()
	openMap()
	tappp(537,160,49,23)
	x = strSplit(data[2],"-")
	for i=1,table_leng(x)-1 do
		mSleep(100)
		local n = x[i]
		if(n == "1")
		then
			tapp(484,335,52)
		elseif(n == "2")
		then
			tapp(634,335,52)
		elseif(n == "3")
		then
			tapp(784,335,52)
		elseif(n == "4")
		then
			tapp(484,485,52)
		elseif(n == "5")
		then
			tapp(634,485,52)
		elseif(n == "6")
		then
			tapp(784,485,52)
		elseif(n == "7")
		then
			tapp(484,635,52)
		elseif(n == "8")
		then
			tapp(634,635,52)
		elseif(n == "9")
		then
			tapp(784,635,52)
		elseif(n == "0")
		then
			tapp(934,485,52)

		end
	end
	mSleep(200)
	tappp(1800,400,100,300)

	tappp(736,160,49,23)
	y = strSplit(data[3],"-")
	for i=1,table_leng(y)-1 do
		mSleep(100)
		local n = y[i]
		if(n == "1")
		then
			tapp(684,335,52)
		elseif(n == "2")
		then
			tapp(834,335,52)
		elseif(n == "3")
		then
			tapp(984,335,52)
		elseif(n == "4")
		then
			tapp(684,485,52)
		elseif(n == "5")
		then
			tapp(834,485,52)
		elseif(n == "6")
		then
			tapp(984,485,52)
		elseif(n == "7")
		then
			tapp(684,635,52)
		elseif(n == "8")
		then
			tapp(834,635,52)
		elseif(n == "9")
		then
			tapp(984,635,52)
		elseif(n == "0")
		then
			tapp(1134,485,52)
		end
	end
	mSleep(200)
	if math.random(9)>6 then
	    tapp(1134,635,52)
    else
	    tappp(1800,400,100,300)
	end

	tappp(927,160,87,27)
	mSleep(200)
	tapp(1578,116,26)
end


--飞行符飞建邺城
--20230812修改未测试
--20230819测试通过
function toJianyecheng(...)
	useFly()
	tapp(1210,659,20)
	closePacket()
	
	if getJYC() then
		return
	else
		dialog("飞建邺城失败")
	end
end
--建邺城移动到指定坐标
--20230819测试通过
function jianyecheng(data)
	openMap()
	mSleep(200)
	tappp(422,124,49,24)
	x = strSplit(data[2],"-")
	for i=1,table_leng(x)-1 do
		local n = x[i]
		if(n == "1")
		then
			tapp(367,298,52)
		elseif(n == "2")
		then
			tapp(517,298,52)
		elseif(n == "3")
		then
			tapp(667,298,52)
		elseif(n == "4")
		then
			tapp(367,448,52)
		elseif(n == "5")
		then
			tapp(517,448,52)
		elseif(n == "6")
		then
			tapp(667,448,52)
		elseif(n == "7")
		then
			tapp(367,598,52)
		elseif(n == "8")
		then
			tapp(517,598,52)
		elseif(n == "9")
		then
			tapp(667,598,52)
		elseif(n == "0")
		then
			tapp(817,448,52)

		end
	end
	--点击其他位置
	mSleep(200)
	tappp(1800,400,100,300)

	--选择y坐标输入框
	tappp(622,124,50,24)
	y = strSplit(data[3],"-")
	for i=1,table_leng(y)-1 do
		mSleep(100)
		local n = y[i]
		if(n == "1")
		then
			tapp(566,298,52)
		elseif(n == "2")
		then
			tapp(716,298,52)
		elseif(n == "3")
		then
			tapp(866,298,52)
		elseif(n == "4")
		then
			tapp(566,448,52)
		elseif(n == "5")
		then
			tapp(716,448,52)
		elseif(n == "6")
		then
			tapp(866,448,52)
		elseif(n == "7")
		then
			tapp(566,598,52)
		elseif(n == "8")
		then
			tapp(716,598,52)
		elseif(n == "9")
		then
			tapp(866,598,52)
		elseif(n == "0")
		then
			tapp(1016,448,52)

		end
	end
	--点击确定
	mSleep(200)
	if math.random(9)>6 then
	    tapp(1016,598,52)
	else
	    tappp(1800,400,100,300)
	end

	--点击前往
	tappp(812,125,89,27)
	--点击关闭地图
	mSleep(200)
	tapp(1695,75,24)
end

--移动到大唐国境
function toDatangguojing()
	
	toChangancheng()
	changan2guojing()
end

--长安城移动到大唐国境
--20230819测试通过
function changan2guojing()
	--点开地图输入坐标
	--12,3去大唐国境
	openMap()
	
	--X坐标输入框
	mSleep(100)
	tappp(438,127,50,23)
	mSleep(200)
	tapp(382,300,52)
	mSleep(100)
	tapp(532,300,52)
	--点击其他位置
	mSleep(100)
	tapp(1600,400,300)
	
	--y坐标输入框
	mSleep(100)
	tappp(638,126,50,24)
	mSleep(200)
	tapp(887,300,52)
	--点击其他位置
	mSleep(200)
	tapp(1600,400,300)
		
	--点击前往
	mSleep(200)
	tapp(833,124,2)
	--点击关闭地图
	mSleep(200)
	tapp(1680,80,2)

	mSleep(2000)
	openPacket()
	mSleep(500)
	tapPackageMapX(1950)
	mSleep(2000)
	closePacket()
	--local str = "@2-2-2-@1-4-1-@"
	local str = "@1-2-@3-@"
	local lastxy,nowxy
	
	--容错
	repeat
		mSleep(3000)
		nowxy = localZuobiao()
		if nowxy == lastxy then
			return changan2guojing()
		else
			lastxy = nowxy
		end
	until(nowxy==str)
	if math.random(9)>6 then
	    tapp(36,963,0)
	else
	    tapp(1432,680,42)
	end
	mSleep(1000)
	if getDTGJ() then
		return
	else
		dialog("进入大唐国境失败")
	end
end

--大唐国境移动到执行坐标
--20230819测试通过
function datangguojing(data)

	--closePacket()
	--点开地图输入坐标
	openMap()
	--选择X坐标输入框
	tappp(554,84,49,23)
	--获取x坐标 x-x-x-
	x = strSplit(data[2],"-")
	for i=1,table_leng(x)-1 do
		mSleep(100)
		local n = x[i]
		if(n == "1")
		then
			tapp(497,259,52)
		elseif(n == "2")
		then
			tapp(647,259,52)
		elseif(n == "3")
		then
			tapp(797,259,52)
		elseif(n == "4")
		then
			tapp(497,409,52)
		elseif(n == "5")
		then
			tapp(647,409,52)
		elseif(n == "6")
		then
			tapp(797,409,52)
		elseif(n == "7")
		then
			tapp(497,559,52)
		elseif(n == "8")
		then
			tapp(647,559,52)
		elseif(n == "9")
		then
			tapp(797,559,52)
		elseif(n == "0")
		then
			tapp(947,409,52)
		end
	end
	--点击确定
	mSleep(200)
	tapp(1600,400,300)
	
	--选择y坐标输入框
	tappp(754,85,49,26)
	y = strSplit(data[3],"-")
	for i=1,table_leng(y)-1 do
		mSleep(100)
		local n = y[i]
		if(n == "1")
		then
			tapp(700,259,52)
		elseif(n == "2")
		then
			tapp(850,259,52)
		elseif(n == "3")
		then
			tapp(1000,259,52)
		elseif(n == "4")
		then
			tapp(700,409,52)
		elseif(n == "5")
		then
			tapp(850,409,52)
		elseif(n == "6")
		then
			tapp(1000,409,52)
		elseif(n == "7")
		then
			tapp(700,559,52)
		elseif(n == "8")
		then
			tapp(850,559,52)
		elseif(n == "9")
		then
			tapp(1000,559,52)
		elseif(n == "0")
		then
			tapp(1150,409,52)

		end
	end
	--点击确定
	mSleep(200)
	if math.random(9) > 6 then
	    tapp(1150,559,52)
	else
	   tapp(1600,400,300) 
	end
	--点击前往
	tappp(945,84,89,28)
	--点击关闭地图
	mSleep(200)
	tapp(1561,39,26)
end
--移动到普陀山
function toPutuoshan()
	toDatangguojing()
	guojing2putuo()
end
--大唐国境移动到普陀山
--20230819测试通过
function guojing2putuo()
	datangguojing({"1","2-2-7-","6-0-"})
	mSleep(2000)
	openPacket()
	mSleep(500)
	tapPackageMapX(400)
	mSleep(2000)
	closePacket()
	local str = "@2-2-7-@6-0-@"
	local lastxy,nowxy
	
	--容错
	repeat
		mSleep(3000)
		nowxy = localZuobiao()
		if nowxy == lastxy then
			return guojing2putuo()
		else
			lastxy = nowxy
		end
	until(nowxy==str)
	doClear()
	tapp(717,437,5)
	if ifDialogOpen() == false then
		dialog("请手动进入普陀山")
	else
		tappp(1600,520,100,20)
	end
    closeClear()
	
	--进入普陀山验证
	mSleep(1000)
	if getPTS() then
		return
	else
		dialog("进入普陀山失败")
	end
end

--普陀山移动到指定坐标
--20230819测试通过
function putuoshan(data)
	
	--关闭背包
	--closePacket()
	--点开地图
	openMap()
	--选择X坐标输入框
	tappp(535,161,50,20)
	--获取x坐标 x-x-x-
	x = strSplit(data[2],"-")
	for i=1,table_leng(x)-1 do
			mSleep(100)
		local n = x[i]
		if(n == "1")
		then
			tapp(481,334,52)
		elseif(n == "2")
		then
			tapp(631,334,52)
		elseif(n == "3")
		then
			tapp(781,334,52)
		elseif(n == "4")
		then
			tapp(481,484,52)
		elseif(n == "5")
		then
			tapp(631,484,52)
		elseif(n == "6")
		then
			tapp(781,484,52)
		elseif(n == "7")
		then
			tapp(481,634,52)
		elseif(n == "8")
		then
			tapp(631,634,52)
		elseif(n == "9")
		then
			tapp(781,634,52)
		elseif(n == "0")
		then
			tapp(931,484,52)

		end
	end
	--点击其他位置
	mSleep(200)
	tapp(1600,400,300)

	--选择y坐标输入框
	tappp(717,161,50,20)
	y = strSplit(data[3],"-")
	for i=1,table_leng(y)-1 do
		local n = y[i]
		if(n == "1")
		then
			mSleep(100)
			tapp(682,335,52)
		elseif(n == "2")
		then
			mSleep(100)
			tapp(832,335,52)
		elseif(n == "3")
		then
			mSleep(100)
			tapp(982,335,52)
		elseif(n == "4")
		then
			mSleep(100)
			tapp(682,485,52)
		elseif(n == "5")
		then
			mSleep(100)
			tapp(832,485,52)
		elseif(n == "6")
		then
			mSleep(100)
			tapp(982,485,52)
		elseif(n == "7")
		then
			mSleep(100)
			tapp(682,635,52)
		elseif(n == "8")
		then
			mSleep(100)
			tapp(832,635,52)
		elseif(n == "9")
		then
			mSleep(100)
			tapp(982,635,52)
		elseif(n == "0")
		then
			mSleep(100)
			tapp(1132,485,52)

		end
	end
	--点击确定
	mSleep(200)
	if math.random(9)>6 then
	    tapp(1132,635,52)
    else
        tapp(1600,400,300)
	end

	--点击前往
	tappp(926,163,88,28)
	--点击关闭地图
	mSleep(200)
	tapp(1575,115,23)
end