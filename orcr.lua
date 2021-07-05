require("ZZBase64")
require("TSLib")
require("leoScript")

init(1)
local ts = require("ts")
local json = ts.json
local image = require("tsimg")
syxTime = ts.ms() 
local getAllFlag = false
local bbmapcount = 0
jyc = {}
wzg = {}
stl = {}
zzg = {}
dhw = {}
dtjw = {}
dtgj = {}
alg = {}
nec = {}
hgs = {}
mjc = {}
pts = {}
csjw = {}
jnyw = {}
bjlz = {}
qls = {}


wuzhuangguanArray = {}
shituolingArray = {}
zhuziguoArray = {}
jianyechengArray = {}
donghaiwanArray = {}
datangjingwaiArray = {}
datangguojingArray = {}
aolaiguoArray = {}
nvercunArray = {}
huaguoshanArray = {}
mojiacunArray = {}
putuoshanArray = {}
changshoujiaowaiArray = {}
jiangnanyewaiArray = {}
beijuluzhouArray = {}
qilinshanArray = {}


wuzhuangguanXYArray = {}
shituolingXYArray = {}
zhuziguoXYArray = {}
jianyechengXYArray = {}
donghaiwanXYArray = {}
datangjingwaiXYArray = {}
datangguojingXYArray = {}
aolaiguoXYArray = {}
nvercunXYArray = {}
huaguoshanXYArray = {}
mojiacunXYArray = {}
putuoshanXYArray = {}
changshoujiaowaiXYArray = {}
jiangnanyewaiXYArray = {}
beijuluzhouXYArray = {}
qilinshanXYArray = {}

wuzhuangguanRow = 1
shituolingRow = 1
zhuziguoRow = 1
jianyechengRow = 1
donghaiwanRow = 1
datangjingwaiRow = 1
datangguojingRow = 1
aolaiguoRow = 1
nvercunRow = 1
huaguoshanRow = 1
mojiacunRow = 1
putuoshanRow = 1
changshoujiaowaiRow = 1
jiangnanyewaiRow = 1
beijuluzhouRow = 1
qilinshanRow = 1


beijuluzhouFlag = 't'
qilinshanFlag = 't'
tempPackageFlag = false 

currentPage = 1

tapflag = false

function table_leng(t)
  local leng=0
  for k, v in pairs(t) do
    leng=leng+1
  end
  return leng;
end

--修改完毕
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

--修改完毕
function useSYX()
	
	local x1,y1
	x1,y1 = findSYX()
	if x1 == -1 then
		error("未发现摄妖香，脚本结束")
	end
	
	tapp(x1,y1,5)

	mSleep(600)
	--点击使用
	tapp(663,608,5)
end


--修改完毕
function closePacket()
	mSleep(500)
	tapp(1603,86,0)
	mSleep(500)
end

--修改完毕
function openMap(...)
	tapp(155,80,5)
	mSleep(100)
	tapp(66,71,2)
	mSleep(500)
end

--to长安城
function toChangancheng(...)
	useFly()
	tapp(1187,495,5)
	closePacket()
	
	if getCAC() then
		return
	else
		dialog("飞长安城失败")
	end
end

--修改完毕
function toJianyecheng(...)
	useFly()
	tapp(1218,654,5)
	closePacket()
	
	if getJYC() then
		return
	else
		dialog("飞建邺城失败")
	end
end

--修改完毕
function jianyecheng(data)
	openMap()
	mSleep(200)
	while true do
		tapp(415,125,20)
		x = strSplit(data[2],"-")
		for i=1,table_leng(x)-1 do
			local n = x[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(365,300,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(515,300,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(665,300,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(365,450,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(515,450,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(665,450,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(365,600,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(515,600,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(665,600,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(815,450,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(815,600,20)

		mSleep(400)
		if inputWordValidate(data[2],380,109,444,142) then
			break
		end
	end
	while true do
		--选择y坐标输入框
		tapp(617,124,20)
		y = strSplit(data[3],"-")
		for i=1,table_leng(y)-1 do
			local n = y[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(565,300,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(715,300,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(865,300,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(565,450,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(715,450,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(865,450,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(565,600,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(715,600,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(865,600,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(1015,450,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(1015,600,20)

		mSleep(400)
		if inputWordValidate(data[3],584,109,649,143) then
			break
		end
	end
	--点击前往
	tappp(811,122,30,20)
	--点击关闭地图
	mSleep(200)
	tapp(1697,79,10)
end

--修改完毕
function toAolaiguo(...)
	useFly()
	tapp(1525,781,5)
	closePacket()
	if getALG() then
		return
	else
		dialog("飞傲来国失败")
	end
end

--修改完毕
function aolaiguo(data)
	
	--closePacket()
	
	openMap()
	mSleep(200)
	while true do
		tappp(602,123,20,10)
		x = strSplit(data[2],"-")
		for i=1,table_leng(x)-1 do
			local n = x[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(545,300,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(695,300,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(845,300,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(545,450,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(695,450,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(845,450,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(545,600,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(695,600,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(845,600,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(995,450,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(995,600,20)

		mSleep(400)
		if inputWordValidate(data[3],560,105,624,141) then
			break
		end
	end
	while true do
		--选择y坐标输入框
		tappp(799,126,20,10)
		y = strSplit(data[3],"-")
		for i=1,table_leng(y)-1 do
			local n = y[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(745,300,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(895,300,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(1045,300,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(745,450,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(895,450,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(1045,450,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(745,600,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(895,600,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(1045,600,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(1195,450,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(1195,600,20)

		--点击前往
		mSleep(400)
		if inputWordValidate(data[3],764,105,822,140) then
			break
		end
	end
	tappp(991,123,20,10)
	--点击关闭地图
	mSleep(400)
	tapp(1512,74,10)
end

--修改完毕
function toZhuziguo(...)
	useFly()
	tapp(866,725,5)
	closePacket()
	if getZZG() then
		return
	else
		dialog("飞朱紫国失败")
	end
end

--修改完毕
function zhuziguo(data)
	--closePacket()
	openMap()
	while true do
		tappp(550,115,20,10)
		x = strSplit(data[2],"-")
		for i=1,table_leng(x)-1 do
			local n = x[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(495,295,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(645,295,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(795,295,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(495,445,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(645,445,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(795,445,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(495,595,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(645,595,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(795,595,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(945,445,20)

			end
		end
		mSleep(200)
		tapp(945,595,20)

		mSleep(400)
		if inputWordValidate(data[2],511,101,577,135) then
			break
		end
	end
	while true do
		tappp(749,116,20,10)
		y = strSplit(data[3],"-")
		for i=1,table_leng(y)-1 do
			local n = y[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(695,295,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(845,295,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(995,295,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(695,445,20)
			elseif(n == "5")
			then
				mSleep(845)
				tapp(849,445,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(995,445,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(695,595,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(845,595,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(995,595,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(1145,445,20)

			end
		end
		mSleep(200)
		tapp(1145,595,20)

		mSleep(400)
		if inputWordValidate(data[3],713,100,776,135) then
			break
		end
	end
	tappp(941,117,20,10)
	mSleep(200)
	tapp(1563,70,10)
end

--修改完毕
function toNvercun()
	
	--[[useFly()
	mSleep(500)
	tapp(1531,770,5)
	closePacket()]]
	
	toAolaiguo()
	toNvercun2()
end

--修改完毕???
function toNvercun2()
	
	--9，141
	--[[
	openMap()
	mSleep(200)
	tapp(609,119,2)
	mSleep(200)
	tapp(852,595,20)
	mSleep(200)
	tapp(1015,593,2)
	
	mSleep(200)
	tapp(800,129,2)
	mSleep(200)
	tapp(753,296,20)
	mSleep(200)
	tapp(752,449,20)
	mSleep(200)
	tapp(755,299,20)
	mSleep(200)
	tapp(1205,594,2)
	
	mSleep(200)
	tapp(999,123,2)
	mSleep(200)
	tapp(1517,77,2)
]]
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
	
	tapp(61,313,0)
	mSleep(1000)
	if getNEC() then
		return
	else
		dialog("进入女儿村失败")
	end
	
end

--修改完毕
function nvercun(data)
	--closePacket()
	openMap()
	while true do
		tappp(526,361,20,10)
		x = strSplit(data[2],"-")
		for i=1,table_leng(x)-1 do
			local n = x[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(475,540,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(625,540,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(775,540,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(475,690,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(625,690,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(775,690,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(475,840,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(625,840,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(775,840,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(925,687,20)

			end
		end
		mSleep(200)
		tapp(925,835,20)
		mSleep(400)
		if inputWordValidate(data[2],491,345,554,379) then
			break
		end
	end
	while true do
		tappp(530,463,20,10)
		y = strSplit(data[3],"-")
		for i=1,table_leng(y)-1 do
			local n = y[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(475,645,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(625,645,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(775,645,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(475,795,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(625,795,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(775,795,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(471,945,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(625,945,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(775,945,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(925,795,20)

			end
		end
		mSleep(200)
		tapp(925,945,20)
		mSleep(400)
		if inputWordValidate(data[3],490,444,560,479) then
			break
		end
	end
	tappp(516,544,20,10)
	mSleep(200)
	tapp(1507,62,10)
end

--修改完毕
function toBeijuluzhou()
	toChangshoujiaowai()
	toBeijuluzhou2()
end
--修改完毕
function toBeijuluzhou2()

	--63,66
	--[[
	openMap()
	mSleep(200)
	tapp(603,161,2)
	mSleep(200)
	tapp(854,490,20)
	mSleep(200)
	tapp(860,340,20)
	mSleep(200)
	tapp(1010,635,2)
	
	mSleep(200)
	tapp(795,164,2)
	mSleep(200)
	tapp(1061,488,20)
	mSleep(200)
	tapp(1064,491,20)
	mSleep(200)
	tapp(1213,637,2)
	
	mSleep(200)
	tapp(999,167,2)
	mSleep(200)
	tapp(1509,120,2)
]]
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

--修改完毕
function beijuluzhou(data)
	--closePacket()
	openMap()
	while true do
		tappp(530,167,20,10)
		x = strSplit(data[2],"-")
		for i=1,table_leng(x)-1 do
			local n = x[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(480,335,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(630,335,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(780,335,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(480,485,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(630,485,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(780,485,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(480,635,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(630,635,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(780,635,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(930,485,20)

			end
		end
		mSleep(200)
		tapp(930,635,20)

		mSleep(400)
		if inputWordValidate(data[2],494,144,568,180) then
			break
		end
	end
	while true do
		tappp(736,163,20,10)
		y = strSplit(data[3],"-")
		for i=1,table_leng(y)-1 do
			local n = y[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(680,340,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(830,340,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(980,340,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(680,490,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(830,490,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(980,490,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(680,640,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(830,640,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(980,640,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(1130,490,20)

			end
		end
		mSleep(200)
		tapp(1130,640,20)

		mSleep(400)
		if inputWordValidate(data[3],697,141,766,181) then
			break
		end
	end
	tappp(928,159,20,10)
	mSleep(200)
	tapp(1580,113,10)
	
	
end

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

--修改完毕
function toChangshoujiaowai()
	
	toChangshoucun()
	toChangshoujiaowai2()
end

--修改完毕
function toChangshoujiaowai2()
	openMap()
	--151,3
	mSleep(200)
	tapp(752,142,2)
	mSleep(200)
	tapp(683,344,20)
	mSleep(200)
	tapp(685,490,20)
	mSleep(200)
	tapp(686,626,20)
	mSleep(200)
	tapp(1140,627,2)
	
	mSleep(200)
	tapp(927,158,2)
	mSleep(200)
	tapp(889,623,20)
	mSleep(200)
	tapp(1349,627,2)
	
	mSleep(200)
	tapp(1125,158,2)
	mSleep(200)
	tapp(1382,113,2)

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
	
	tapp(1731,932,0)
	mSleep(1000)
	if getCSJW() then
		return
	else
		dialog("进入长寿郊外失败")
	end
end

--修改完毕
function changshoujiaowai(data)
	--关闭背包
	--closePacket()
	--点开地图输入坐标
	openMap()
	while true do
		--选择X坐标输入框
		tappp(603,169,20,10)
		--获取x坐标 x-x-x-
		x = strSplit(data[2],"-")
		for i=1,table_leng(x)-1 do
			local n = x[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(550,340,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(700,340,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(850,340,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(550,490,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(700,490,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(850,490,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(550,640,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(700,640,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(850,640,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(1000,490,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(1000,640,20)

		mSleep(400)
		if inputWordValidate(data[2],568,151,634,184) then
			break
		end
	end
	while true do
		--选择y坐标输入框
		tappp(805,167,20,10)
		y = strSplit(data[3],"-")
		for i=1,table_leng(y)-1 do
			local n = y[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(750,340,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(900,340,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(1050,340,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(750,490,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(900,490,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(1050,490,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(750,640,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(900,640,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(1050,640,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(1200,490,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(1200,640,20)

		--点击前往
		mSleep(400)
		if inputWordValidate(data[3],768,150,832,186) then
			break
		end
	end
	tappp(998,164,20,10)
	--点击关闭地图
	mSleep(200)
	tapp(1507,120,10)
end

--修改完毕
function toQilinshan()
	
	-- body
	useFly()
	--点击朱紫国
	mSleep(500)
	tapp(860,724,5)
	
	--关闭背包
	closePacket()
	toQilinshan2()
end


--修改完毕
function toQilinshan2()
	--4，109
	--点开地图输入坐标
	--[[
	openMap()
	tapp(543,120,2)
	--选择X坐标输入框
	mSleep(200)
	tapp(503,437,20)
	mSleep(200)
	tapp(967,584,2)
	
	--选择y坐标输入框
	mSleep(200)
	tapp(760,125,2)
	mSleep(200)
	tapp(700,300,20)
	mSleep(200)
	tapp(1150,430,20)
	mSleep(200)
	tapp(1000,600,20)
	--点击确定
	mSleep(200)
	tapp(1150,600,2)
	
	--点击前往
	mSleep(200)
	tapp(900,100,2)
	--点击关闭地图
	mSleep(200)
	tapp(1550,70,2)
]]
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
	
	tapp(50,150,0)
	mSleep(3000)
end

--修改完毕
function qilinshan(data)
	-- nLog("麒麟山移动坐标："..data[2]..","..data[3])

	--closePacket()

	openMap()
	mSleep(200)
	while true do
		--选择X坐标输入框
		tappp(523,168,20,10)
		--获取x坐标 x-x-x-
		x = strSplit(data[2],"-")
		for i=1,table_leng(x)-1 do
			local n = x[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(470,345,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(620,345,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(770,345,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(470,495,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(620,495,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(770,495,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(470,645,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(620,645,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(770,645,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(920,495,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(920,645,20)
		mSleep(400)
		if inputWordValidate(data[2],490,149,548,185) then
			break
		end
		
	end
	--选择y坐标输入框
	while true do
		tappp(727,171,20,10)
		y = strSplit(data[3],"-")
		for i=1,table_leng(y)-1 do
			local n = y[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(670,345,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(820,345,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(970,345,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(670,495,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(820,495,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(970,495,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(670,645,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(820,645,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(970,645,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(1120,495,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(1120,645,20)
		mSleep(400)
		if inputWordValidate(data[2],690,149,755,186) then
			break
		end
	end
	--点击前往
	tappp(919,166,20,10)
	--点击关闭地图
	mSleep(200)
	tapp(1587,120,10)

end

--修改完毕
function changan2guojing()
	--点开地图输入坐标
	--12,3去大唐国境
	openMap()
	
	--X坐标输入框
	mSleep(200)
	tapp(452,127,2)
	mSleep(200)
	tapp(387,302,20)
	mSleep(200)
	tapp(548,302,20)
	--点击确定
	mSleep(200)
	tapp(846,604,2)
	
	--y坐标输入框
	mSleep(200)
	tapp(624,127,2)
	mSleep(200)
	tapp(893,302,20)
	--点击确定
	mSleep(200)
	tapp(1050,604,2)
		
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
	
	tapp(36,963,0)
	mSleep(1000)
	if getDTGJ() then
		return
	else
		dialog("进入大唐国境失败")
	end
end

--修改完毕
function zhuzi2jingwai()
	--7,3
	--朱紫国--大唐境外
	--[[
	mSleep(2000)
	--点开地图输入坐标
	openMap()
	--选择X坐标输入框
	tapp(548,126,2)
	mSleep(200)
	tapp(503,587,20)
	--点击确定
	mSleep(200)
	tapp(960,591,2)
	
	--选择y坐标输入框
	mSleep(200)
	tapp(738,122,2)
	mSleep(200)
	tapp(1000,290,20)
	--点击确定
	mSleep(200)
	tapp(1164,580,2)
	
	--点击前往
	mSleep(200)
	tapp(948,110,2)
	--点击关闭地图
	mSleep(200)
	tapp(1570,69,2)
]]
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
	
	tapp(38,945,0)
	mSleep(1000)
	if getDTJW() then
		return
	else
		dialog("朱紫国进入大唐境外失败")
	end
	
end


--修改完毕
function guojing2putuo()
	
	--长安--大唐国境227,60--普陀仙子
	--点开地图输入坐标
	--[[
	openMap()
	--选择X坐标输入框
	mSleep(200)
	tapp(566,88,2)
	mSleep(200)
	tapp(660,262,20)
	mSleep(200)
	tapp(663,263,20)
	mSleep(200)
	tapp(504,546,20)
	--点击确定
	mSleep(200)
	tapp(958,550,2)
	
		
	--选择y坐标输入框
	mSleep(400)
	tapp(747,87,2)
	mSleep(200)
	tapp(1013,420,20)
	mSleep(200)
	tapp(1164,404,20)
	--点击确定
	mSleep(200)
	tapp(1163,557,2)
	
	--点击前往
	mSleep(200)
	tapp(947,79,2)
	--点击关闭地图
	mSleep(200)
	tapp(1562,39,2)
]]
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
	
	tapp(717,437,5)
	if ifDialogOpen() == false then
		dialog("请手动进入普陀山")
	else
		tappp(1600,520,100,20)
	end
	
	--进入普陀山验证
	mSleep(1000)
	if getPTS() then
		return
	else
		dialog("进入普陀山失败")
	end
	
end


--修改完毕
function toDatangguojing()
	--[[ body
	useFly()
	--点击长安
	mSleep(500)
	tapp(1187 495")
	--关闭背包
	closePacket()
	-- body]]
	
	toChangancheng()
	changan2guojing()
end

--修改完毕
function datangguojing(data)

	--closePacket()
	--点开地图输入坐标
	openMap()
	while true do
		--选择X坐标输入框
		tappp(549,90,20,10)
		--获取x坐标 x-x-x-
		x = strSplit(data[2],"-")
		for i=1,table_leng(x)-1 do
			local n = x[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(500,265,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(650,265,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(800,265,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(500,415,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(650,415,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(800,415,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(500,565,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(650,565,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(800,565,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(950,415,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(950,565,20)
		mSleep(400)
		if inputWordValidate(data[3],510,68,579,104) then
			break
		end
	end
	while true do
		--选择y坐标输入框
		tappp(753,86,20,10)
		y = strSplit(data[3],"-")
		for i=1,table_leng(y)-1 do
			local n = y[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(700,260,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(850,260,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(1000,260,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(700,410,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(850,410,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(1000,410,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(700,560,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(850,560,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(1000,560,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(1150,410,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(1150,560,20)
		mSleep(400)
		if inputWordValidate(data[3],711,69,779,102) then
			break
		end
	end
	--点击前往

	tappp(944,86,20,10)
	--点击关闭地图
	mSleep(200)
	tapp(1561,38,10)
end

--修改完毕
function toDatangjingwai()
	--[[ body
	useFly()
	--点击朱紫国
	mSleep(500)
	tapp(862 730")
	--关闭背包
	closePacket()]]
	
	toZhuziguo()
	zhuzi2jingwai()
end

--修改完毕
function datangjingwai(data)
	
	--closePacket()
	
	--点开地图
	openMap()
	while true do
		--选择X坐标输入框
		tappp(358,335,20,10)
		--获取x坐标 x-x-x-
		x = strSplit(data[2],"-")
		for i=1,table_leng(x)-1 do
			local n = x[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(305,510,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(455,510,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(605,510,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(305,660,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(455,660,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(605,660,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(305,810,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(455,810,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(605,810,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(755,660,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(755,810,20)

		mSleep(400)
		if inputWordValidate(data[2],318,317,388,354) then
			break
		end
	end
	while true do
		--选择y坐标输入框
		tappp(557,337,20,10)
		y = strSplit(data[3],"-")
		for i=1,table_leng(y)-1 do
			local n = y[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(505,510,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(655,510,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(805,510,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(505,660,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(655,660,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(805,660,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(505,810,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(655,810,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(805,810,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(955,660,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(955,810,20)

		mSleep(400)
		if inputWordValidate(data[3],522,317,587,354) then
			break
		end
	end
	--点击前往
	tappp(752,336,20,10)
	--点击关闭地图
	mSleep(200)
	tapp(1754,289,10)
	
end
--修改完毕
function jingwai2mojiacun(...)
	-- body
	--大唐境外234,110 ---墨家村
	--点开地图
	mSleep(1000)
	--[[
	openMap()
	
	--选择X坐标输入框
	tapp(354,333,2)
	mSleep(200)
	tapp(437,526,20)
	mSleep(200)
	tapp(621,529,20)
	mSleep(200)
	tapp(308,649,20)
	--点击确定
	mSleep(200)
	tapp(767,807,2)
	
	--选择y坐标输入框
	mSleep(400)
	tapp(547,330,2)
	mSleep(200)
	tapp(514,523,20)
	mSleep(200)
	tapp(517,525,20)
	mSleep(200)
	tapp(965,658,20)
	--点击确定
	mSleep(200)
	tapp(967,803,2)
	
	--点击前往
	mSleep(200)
	tapp(752,332,2)
	--点击关闭地图
	mSleep(200)
	tapp(1755,283,2)
]]
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

--修改完毕
function toMojiacun()
	-- body
	toDatangjingwai()
	jingwai2mojiacun()
end

--修改完毕
function mojiacun(data)
	--关闭背包
	--closePacket()
	--点开地图输入坐标
	openMap()
	while true do
		--选择X坐标输入框
		tappp(651,328,20,10)
		--获取x坐标 x-x-x-
		x = strSplit(data[2],"-")
		for i=1,table_leng(x)-1 do
			local n = x[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(600,510,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(750,510,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(900,510,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(600,660,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(750,660,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(900,660,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(600,810,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(750,810,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(900,810,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(1050,660,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(1050,810,20)
		mSleep(400)
		if inputWordValidate(data[2],611,311,674,348) then
			break
		end
	end
	while true do
		--选择y坐标输入框
		tappp(652,430,20,10)
		y = strSplit(data[3],"-")
		for i=1,table_leng(y)-1 do
			local n = y[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(600,610,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(750,610,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(900,610,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(600,760,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(750,760,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(900,760,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(600,910,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(750,910,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(900,910,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(1050,760,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(1050,910,20)
		mSleep(400)
		if inputWordValidate(data[3],610,408,677,450) then
			break
		end
	end
	--点击前往
	tappp(641,519,20,10)
	--点击关闭地图
	mSleep(200)
	tapp(1382,30,10)

end

--修改完毕
function toPutuoshan()
	--[[ body
	useFly()
	--点击长安
	mSleep(500)
	tapp(1195 492")
	--关闭背包
	closePacket()
	-- body
	changan2putuo()]]
	toDatangguojing()
	guojing2putuo()
end

--修改完毕
function putuoshan(data)
	
	--关闭背包
	--closePacket()
	--点开地图
	openMap()
	while true do
		--选择X坐标输入框
		tappp(532,164,20,10)
		--获取x坐标 x-x-x-
		x = strSplit(data[2],"-")
		for i=1,table_leng(x)-1 do
			local n = x[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(480,340,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(630,340,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(780,340,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(480,490,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(630,490,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(780,490,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(480,640,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(630,640,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(780,640,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(930,490,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(930,640,20)

		mSleep(400)
		if inputWordValidate(data[2],493,145,540,182) then
			break
		end
	end
	while true do
		--选择y坐标输入框
		tappp(734,165,20,10)
		y = strSplit(data[3],"-")
		for i=1,table_leng(y)-1 do
			local n = y[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(680,340,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(830,340,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(980,340,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(680,490,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(830,490,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(980,490,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(680,640,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(830,640,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(980,640,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(1130,490,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(1130,640,20)

		mSleep(400)
		if inputWordValidate(data[3],692,145,750,183) then
			break
		end
	end
	--点击前往
	tappp(926,165,20,10)
	--点击关闭地图
	mSleep(200)
	tapp(1580,117,10)
end

--修改完毕
function toDonghaiwan()
	toJianyecheng()
	
	toDonghaiwan2()
end
--修改完毕
function toDonghaiwan2()
	
	--270,29
	-- body
	--点开地图输入坐标
	--[[
	openMap()
	--选择X坐标输入框
	mSleep(200)
	tapp(416,126,2)
	mSleep(200)
	tapp(520,309,20)
	mSleep(200)
	tapp(370,596,20)
	mSleep(200)
	tapp(821,451,20)
	--点击确定
	mSleep(200)
	tapp(830,581,2)
	
	--选择y坐标输入框
	mSleep(400)
	tapp(605,129,2)
	mSleep(200)
	tapp(724,302,20)
	mSleep(200)
	tapp(875,596,20)
	--点击确定
	mSleep(200)
	tapp(1034,599,2)
	
	--点击前往
	mSleep(200)
	tapp(808,123,2)
	--点击关闭地图
	mSleep(200)
	tapp(1691,81,2)
]]
	jianyecheng({"1-","2-7-0-","2-9-"})
	mSleep(2000)
	openPacket()
	mSleep(500)
	tapPackageMapX(1500)
	mSleep(2000)
	closePacket()
	local str = "@2-7-0-@2-9-@"
	local lastxy,nowxy
	
	--容错
	repeat
		mSleep(3000)
		nowxy = localZuobiao()
		if nowxy == lastxy then
			return toDonghaiwan2()
		else
			lastxy = nowxy
		end
	until(nowxy==str)
	
	tapp(1900,800,0)
	mSleep(1000)
	if getDHW() then
		return
	else
		dialog("进入东海湾失败")
	end
	
end

--修改完毕
function donghaiwan(data)
	--closePacket()
	openMap()
	while true do
		--选择X坐标输入框
		tappp(658,167,20,10)
		--获取x坐标 x-x-x-
		x = strSplit(data[2],"-")
		for i=1,table_leng(x)-1 do
			local n = x[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(605,345,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(755,345,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(905,345,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(605,495,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(755,495,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(905,495,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(605,645,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(755,645,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(905,645,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(1055,495,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(1055,645,20)

		mSleep(400)
		if inputWordValidate(data[2],618,149,682,185) then
			break
		end
	end
	while true do
		--选择y坐标输入框
		tappp(856,166,20,10)
		y = strSplit(data[3],"-")
		for i=1,table_leng(y)-1 do
			local n = y[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(805,345,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(955,345,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(1105,345,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(805,495,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(955,495,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(1105,495,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(805,645,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(955,645,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(1105,645,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(1255,495,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(1255,645,20)

		mSleep(400)
		if inputWordValidate(data[3],821,150,882,184) then
			break
		end
	end
	--点击前往
	tappp(1046,166,20,10)
	--点击关闭地图
	mSleep(200)
	tapp(1459,119,10)
	
end

--修改完毕
function toJiangnanyewai()
	--[[ body
	useFly()
	--点击建邺城位置
	mSleep(500)
	tapp(1226 657")
	-- body
	closePacket()]]
	
	toJianyecheng()
	toJiangnanyewai2()
end
--修改完毕
function toJiangnanyewai2()
	
	--18,5
	--点开地图输入坐标
	--[[
	openMap()
	--选择X坐标输入框
	tapp(426,129,2)
	mSleep(200)
	tapp(368,303,20)
	mSleep(200)
	tapp(519,598,20)
	--点击确定
	mSleep(200)
	tapp(830,600,2)
	
	--选择y坐标输入框
	mSleep(400)
	tapp(623,123,2)
	mSleep(200)
	tapp(722,450,20)
	--点击确定
	mSleep(200)
	tapp(1032,603,2)
	
	--点击前往
	mSleep(200)
	tapp(815,126,2)
	--点击关闭地图
	mSleep(200)
	tapp(1695,77,2)
]]
	jianyecheng({"1","1-8-","5-"})
	mSleep(1000)
	openPacket()
	mSleep(500)
	tapPackageMap5time()
	mSleep(1000)
	closePacket()
	local str = "@1-8-@5-@"
	local lastxy,nowxy
	
	--容错
	repeat
		mSleep(3000)
		nowxy = localZuobiao()
		if nowxy == lastxy then
			return toJiangnanyewai2()
		else
			lastxy = nowxy
		end
	until(nowxy==str)
	--点击传送
	
	tapp(555,747,0)
	if ifDialogOpen() == false then
		dialog("手动进入江南野外")
	else
		tapp(1597,499,0)
	end
	
	mSleep(1000)
	if getJNYW() then
		return
	else
		dialog("进入江南野外失败")
	end
end

--修改完毕
function jiangnanyewai(data)

	--关闭背包
	--closePacket()
	
	--点开地图输入坐标
	openMap()

	--选择X坐标输入框
	mSleep(200)
	while true do
		tapp(543,169,2)
		--获取x坐标 x-x-x-
		x = strSplit(data[2],"-")
		for i=1,table_leng(x)-1 do
			local n = x[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(479,334,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(635,336,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(788,338,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(482,491,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(638,493,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(791,495,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(485,625,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(641,627,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(794,629,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(933,497,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(936,631,2)

		mSleep(400)
		if inputWordValidate(data[2],493,146,554,177) then
			break
		end
	end
	while true do
		--选择y坐标输入框
		tapp(719,172,2)
		y = strSplit(data[3],"-")
		for i=1,table_leng(y)-1 do
			local n = y[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(678,341,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(838,344,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(992,346,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(681,499,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(841,501,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(995,503,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(684,633,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(844,635,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(998,637,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(1139,505,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(1142,639,2)

		mSleep(400)
		if inputWordValidate(data[3],692,146,758,178) then
			break
		end
	end
	--点击前往
	tapp(915,165,2)
	--点击关闭地图
	mSleep(200)
	tapp(1582,113,2)
	
end

--修改完毕
function toHuaguoshan()
	--[[ body
	useFly()
	--点击傲来国
	mSleep(500)
	tapp(1523 774")
	--关闭背包
	closePacket()
	]]
	
	toAolaiguo()
	toHuaguoshan2()
end
--修改完毕
function toHuaguoshan2()
	
	--212，143
	-- body
	--点开地图输入坐标
	--[[
	openMap()
	--选择X坐标输入框
	mSleep(200)
	tapp(620,128,2)
	mSleep(200)
	tapp(704,292,20)
	mSleep(200)
	tapp(551,295,20)
	mSleep(200)
	tapp(701,289,20)
	--点击确定
	mSleep(200)
	tapp(995,598,2)
	
	--选择y坐标输入框
	mSleep(400)
	tapp(799,127,2)
	mSleep(200)
	tapp(752,296,20)
	mSleep(200)
	tapp(758,446,20)
	mSleep(200)
	tapp(1055,300,20)
	--点击确定
	mSleep(200)
	tapp(1213,601,2)
	
	--点击前往
	mSleep(200)
	tapp(988,128,2)
	--点击关闭地图
	mSleep(200)
	tapp(1515,74,2)
]]
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
	
	tapp(1640,156,0)
	mSleep(1000)
	if getHGS then
		return
	else
		dialog("进入花果山失败")
	end
	
end

--处理完毕
function huaguoshan(data)
	--点开地图输入坐标
	--closePacket()
	openMap()
	while true do
		--选择X坐标输入框
		tappp(539,169,20,10)
		--获取x坐标 x-x-x-
		x = strSplit(data[2],"-")
		for i=1,table_leng(x)-1 do
			local n = x[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(485,345,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(635,345,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(785,345,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(485,495,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(635,495,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(785,495,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(485,645,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(635,645,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(785,645,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(935,495,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(935,645,20)
		mSleep(400)
		if inputWordValidate(data[2],501,151,566,184) then
			break
		end
	end
	while true do
		--选择y坐标输入框
		tappp(739,165,20,10)
		y = strSplit(data[3],"-")
		for i=1,table_leng(y)-1 do
			local n = y[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(685,345,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(845,345,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(985,345,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(685,495,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(845,495,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(985,495,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(685,645,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(845,645,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(985,645,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(1145,495,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(1145,645,20)
		mSleep(400)
		if inputWordValidate(data[3],703,151,766,184) then
			break
		end
	end
	--点击前往
	tappp(930,168,20,10)
	--点击关闭地图
	mSleep(200)
	tapp(1574,120,10)

end

--已修改
function toWuzhuangguan()
	--跑图
	toDatangjingwai()
	toWuzhuangguan2()
	
end

--已修改
function toWuzhuangguan2()
	--628，71
	--点开地图
	mSleep(1000)
	--[[
	openMap()
	
	--选择X坐标输入框
	mSleep(200)
	tapp(358,336,2)
	mSleep(200)
	tapp(615,657,20)
	mSleep(200)
	tapp(566,508,20)
	mSleep(200)
	tapp(566,508,20)
	--点击确定
	mSleep(200)
	tapp(769,797,2)
	
	--选择y坐标输入框
	mSleep(400)
	tapp(561,336,2)
	mSleep(200)
	tapp(505,809,20)
	mSleep(200)
	tapp(510,650,20)
	--点击确定
	mSleep(200)
	tapp(967,813,2)
	
	--点击前往
	mSleep(200)
	tapp(746,338,2)
	--点击关闭地图
	mSleep(200)
	tapp(1759,288,2)
]]
	datangjingwai({"1","6-3-3-","7-4-"})
	mSleep(2000)
	openPacket()
	mSleep(500)
	tapPackageMapX(3000)
	mSleep(2000)
	closePacket()
	mSleep(10000)
	openPacket()
	mSleep(500)
	tapPackageMapX(2000)
	mSleep(2000)
	closePacket()
	local str = "@6-3-3-@7-4-@"
	local lastxy,nowxy
	
	--容错
	repeat
		mSleep(3000)
		nowxy = localZuobiao()
		if nowxy == lastxy then
			return toWuzhuangguan2()
		else
			lastxy = nowxy
		end
	until(nowxy==str)
	
	mSleep(1000)
	tapp(1700,290,0)
	mSleep(1000)
	
	--getWZG todo
	--if getWZG() then
	if exitDTJW() then
		return
	else
		dialog("进入五庄观失败")
	end
	
end

--修改完毕
function wuzhuangguan(data)

	--关闭背包
	--closePacket()
	
	--点开地图输入坐标
	openMap()
	--选择X坐标输入框
	mSleep(200)
	while true do
		tappp(540,166,20,10)
		--获取x坐标 x-x-x-
		x = strSplit(data[2],"-")
		for i=1,table_leng(x)-1 do
			local n = x[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(480,340,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(630,340,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(780,340,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(480,490,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(630,490,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(780,490,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(480,640,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(630,640,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(790,640,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(930,490,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(930,640,20)

		mSleep(400)
		if inputWordValidate(data[2],498,146,561,182) then
			break
		end
	end
	while true do
		--选择y坐标输入框
		tappp(735,162,20,10)
		y = strSplit(data[3],"-")
		for i=1,table_leng(y)-1 do
			local n = y[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(680,340,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(830,340,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(980,340,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(680,490,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(830,490,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(980,490,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(680,640,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(830,640,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(980,640,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(1130,490,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(1130,640,20)

		mSleep(400)
		if inputWordValidate(data[3],694,146,755,181) then
			break
		end
	end
	--点击前往
	tappp(926,162,20,10)
	--点击关闭地图
	mSleep(200)
	tapp(1580,117,10)
	
end

--修改完毕  
function toShituoling(...)
	--跑图
	toDatangjingwai()
	
	mSleep(1000)
	tapp(31,1065,0)
	
	mSleep(1000)
	if getSTL() then
		return
	else
		dialog("进入狮驼岭失败")
	end
	
end

--修改完毕
function shituoling(data)
	
	--点开地图输入坐标
	openMap()
	--选择X坐标输入框
	mSleep(200)
	while true do
		tappp(528,160,20,10)
		--获取x坐标 x-x-x-
		x = strSplit(data[2],"-")
		for i=1,table_leng(x)-1 do
			local n = x[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(475,335,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(625,335,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(775,335,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(475,485,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(625,485,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(775,485,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(475,635,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(625,635,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(775,635,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(925,485,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(925,635,20)

		mSleep(400)
		if inputWordValidate(data[2],490,142,555,178) then
			break
		end
	end
	while true do
		--选择y坐标输入框
		tappp(733,156,20,10)
		y = strSplit(data[3],"-")
		for i=1,table_leng(y)-1 do
			local n = y[i]
			if(n == "1")
			then
				mSleep(100)
				tapp(675,335,20)
			elseif(n == "2")
			then
				mSleep(100)
				tapp(825,335,20)
			elseif(n == "3")
			then
				mSleep(100)
				tapp(975,335,20)
			elseif(n == "4")
			then
				mSleep(100)
				tapp(675,485,20)
			elseif(n == "5")
			then
				mSleep(100)
				tapp(825,485,20)
			elseif(n == "6")
			then
				mSleep(100)
				tapp(975,485,20)
			elseif(n == "7")
			then
				mSleep(100)
				tapp(675,635,20)
			elseif(n == "8")
			then
				mSleep(100)
				tapp(825,635,20)
			elseif(n == "9")
			then
				mSleep(100)
				tapp(975,635,20)
			elseif(n == "0")
			then
				mSleep(100)
				tapp(1125,485,20)

			end
		end
		--点击确定
		mSleep(200)
		tapp(1125,635,20)

		mSleep(400)
		if inputWordValidate(data[3],690,141,755,178) then
			break
		end
	end
	--点击前往
	tappp(922,159,20,10)
	--点击关闭地图
	mSleep(200)
	tapp(1586,112,10)
end

--修改完毕
--打开背包需要遍历所有的藏宝图
function findMap()
	keepScreen(true)
	local mapArray = {}
	local row = 1
	for x=0,3 do
		for y=0,4 do
			x1,y1 = findMultiColorInRegionFuzzy( 0x71867a, "0|4|0x6c8375,12|8|0xed2b5f,4|12|0xf01460,-4|15|0xee2358,14|27|0x6d8378,6|47|0xf0f095,-25|38|0xeff0cc,-10|-22|0xf0f2d4,18|-15|0xf0edab", 90, 302+x*135, 908+y*135, 394+x*135, 1019+y*135)

			if x1~=-1 then
				--dialog(x..","..y,1)
				mapArray[row] = y1.."@"..(1080-x1)
				row = row+1
			end
		end
	end
	keepScreen(false)
	return mapArray
end

--修改完毕
--打开背包需要遍历所有的藏宝图
function countMap()
	
	keepScreen(true)
	local mapCount = 0
	local x1,y1
	for x=0,4 do
		for y=0,2 do
			x1,y1 = findMultiColorInRegionFuzzy( 0xf0f5e2, "-9|22|0xeceab3,13|31|0xec3877,51|41|0xeae59b,60|16|0xf0f5d0,43|67|0xeff2cc", 90, 897+x*135, 260+y*135, 1026+x*135, 391+y*135)
			if x1~=-1 then
				mapCount = mapCount +1
			end
		end
	end
	keepScreen(false)
	return mapCount
end

--无需改
function useSuccess()
	
	bbmapcount = bbmapcount-1
	-- body
	while(true)
	do
		mSleep(200)
		if countMap() == bbmapcount then
			break
		end
	end
end

--无需改
function slayMonster(...)
	
	time = 0
	while(true) do
		fightflag = waitFight()
		if fightflag == 1 then
			time = time +1
			--toast("fighting...",1)
			tapp(1832,1021,5)
			mSleep(500)
			tapp(1832,1021,5)
		else
			return time
		end
	end
end

--已修改
function addBlood(time)
	
	-- 人物补血
	if isColor(1912, 12,0xec2602,95) == false then
		tapp(1873,45,2)
		mSleep(300)
		tapp(1503,157,2)
		mSleep(300)
	end
	-- 人物补篮
	if isColor( 1830, 32, 0x1d8af2 ,95) == false then
		tapp(1842,40,2)
		mSleep(300)
		tapp(1760,152,2)
		mSleep(300)
	end
	
	-- 宝宝补血
	if isColor( 1652, 10, 0xeb1d02 ,95) == false then
		
		mSleep(300)
		tapp(1616,29,2)
		mSleep(300)
		tapp(1211,159,2)
	end
end

--已修改
function cut()
	bbMapOpenSuc()
	snapshot("test1.png", 531,440,572,760)
	local str
	--[[
	--将文件转换为图片对象
	local img,msg = image.loadFile(userPath() .. "/res/test1.png") 


	if image.is(img) then
			--将图片对象顺时针旋转 270 度
			local img,msg = image.setRotation270(img);
			if image.is(img) then
				--将图片对象转换为图片
				local boo,msg = image.saveToPngFile(img,userPath() .. "/res/test2.png")
			else
				dialog(msg,3)
			end
		else
			dialog(msg,3)
	end
	]]
	str = upload()
	if str == false then
		return cut()
	end
		
	return str
end

--无需改
local function imageToBase64(imageObj)
	
	local boo,msg = image.saveToPngFile(imageObj,userPath() .. "/res/1.jpg")
			
	local files
	local file = io.open(userPath() .. "/res/1.jpg","rb")

	if file then
		files = file:read("*a")
		file:close()
	else
		toast("没有找到文件",2)
	end
	
	return ZZBase64.encode(files)
end

--无需改
local function imageTurn270ToBase64(imageObj)
	local newImage,msg = image.setRotation270(imageObj)
	return imageToBase64(newImage)
end


--已修改
function post1(base64str)
	--local url = "http://118.31.47.19:30000/cd1080/getLocation"
	local url = "http://101.34.73.218:30000/cd1080/getLocation"
	
	--local data = [[{"body":base64str,"uuid":"uuid"}]]
	local data = "{\"body\":\""..base64str.."\",\"uuid\":\"uuid\"}"
	--local data = [[{"action": "getAuth","key": "开发者的key","devices": {"设备号1"},"valid": 3600,"time": ]].. os.time() ..[[}]]
	local options = {
		["tstab"] = 1, -- 必填项
		["timeOut"] = 90,
		["urlEnCode"] = false
	}
	return httpPost(url,data,options)
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


--修改完毕
--背包物品存入仓库
function beibao2cangku(count)
	if count < 15 then
		--每次存储一个,然后重新调用
		arrayList = findCangKuBeiBaoNoEmptyMapY(2)
		if tapflag == false then
			tapflag = true
			
			for key, var in ipairs(arrayList) do
				mapxy = strSplit(var,"@")
				--点击坐标
				tapp(mapxy[1],mapxy[2],5)
				mSleep(100)
			end
			tapp(1526,217,5)
		end
		mSleep(250)
		local cangkuEmpCount = countCangKuEmpty()
		if cangkuEmpCount == 0 then
			tapp(259,944,2)
			mSleep(500)
			beibao2cangku(count)
			return
		end
		
		if count > 9 then
			mSleep(1000)
		end
		if count > 4 then
			mSleep(1000)
		end
		
		--t1Count = #arrayList
		for key, var in ipairs(arrayList) do
			local crflag = false
			while true do
				mapxy = strSplit(var,"@")
				--点击坐标
				tapp(mapxy[1],mapxy[2],5)
				mSleep(500)
				--why：修改点击存入仓库按钮范围。有个别物品按钮扫描不到
				x,y = findMultiColorInRegionFuzzy( 0x385868, "11|4|0x8aa1a9,-1|17|0x758d9a,15|18|0x304c60,13|32|0x66828d,-2|36|0x305060", 90, 367, 592, 440, 1078)
				if x ~= -1 and y ~= -1 then  --如果在指定区域找到某点符合条件
					tapp(x,y,5)
				end
				for tmptime =0,100 do
					mSleep(100)
					beibaoemp = countCangKuBeiBaoEmptyY(2)
					--toast(beibaoemp,1)
					if beibaoemp > count then
						count = beibaoemp
						crflag = true
						break
					end
				end
				if crflag == true then
					break
				end
			end
			cangkuEmpCount = cangkuEmpCount -1
			if cangkuEmpCount == 0 then 
				break
			end
		end
		--点一下仓库
		mSleep(200)
		tapp(259,944,5)
		mSleep(500)
		count = countCangKuBeiBaoEmptyY(2)
		beibao2cangku(count)
	end
end



--修改完毕
function initMap(...)
	--初始化数据
	wuzhuangguanArray = {}
	shituolingArray = {}
	zhuziguoArray = {}
	jianyechengArray = {}
	donghaiwanArray = {}
	datangjingwaiArray = {}
	datangguojingArray = {}
	aolaiguoArray = {}
	nvercunArray = {}
	huaguoshanArray = {}
	mojiacunArray = {}
	putuoshanArray = {}
	changshoujiaowaiArray = {}
	jiangnanyewaiArray = {}
	beijuluzhouArray = {}
	qilinshanArray = {}
	
	
	wuzhuangguanXYArray = {}
	shituolingXYArray = {}
	zhuziguoXYArray = {}
	jianyechengXYArray = {}
	donghaiwanXYArray = {}
	datangjingwaiXYArray = {}
	datangguojingXYArray = {}
	aolaiguoXYArray = {}
	nvercunXYArray = {}
	huaguoshanXYArray = {}
	mojiacunXYArray = {}
	putuoshanXYArray = {}
	changshoujiaowaiXYArray = {}
	jiangnanyewaiXYArray = {}
	beijuluzhouXYArray = {}
	qilinshanXYArray = {}

	wuzhuangguanRow = 1
	shituolingRow = 1
	zhuziguoRow = 1
	jianyechengRow = 1
	donghaiwanRow = 1
	datangjingwaiRow = 1
	datangguojingRow = 1
	aolaiguoRow = 1
	nvercunRow = 1
	huaguoshanRow = 1
	mojiacunRow = 1
	putuoshanRow = 1
	changshoujiaowaiRow = 1
	jiangnanyewaiRow = 1
	beijuluzhouRow = 1
	qilinshanRow = 1
	-- body
	

	--[[
	openPacket()
	useFly()
	--点击长安
	--tapp(1174 496")
	--关闭背包
	closePacket()
	
	getCAC()
	mSleep(3000)
	tapp(559 503")
	mSleep(3000)
	doStay()
	doClear()
	
	--打开仓库
	mSleep(500)
	tapp(849 484")
	if isCangKuOpen() then
		mSleep(1000)
		tapp(1614 634")
		mSleep(500)
		closeClear()
		mSleep(2000)
	else
		dialog("打开仓库失败,10秒内打开仓库")
		mSleep(10000)
	end
	]]
	
	
	openPacket()
	useFly()
	--点击西凉女国
	tapp(750,434,10)
	closePacket()
	
	--西凉女国仓库
	getXLNG()
	mSleep(1000)
	doClear()
	mSleep(500)
	--点击管理员
	tapp(960,200,10)
	if isCangKuOpen() then
		mSleep(1000)
		tappp(1600,660,150,20)
		mSleep(500)
		closeClear()
		if cangKuOpenSuccess() == false then
			dialog("请手动打开仓库")
			cangKuOpenSuccess()
		end
		
	else
		dialog("打开仓库失败,10秒内打开仓库")
		mSleep(10000)
	end
	
	--进入仓库预读取所有仓库内容
	while( havNext() )
		do
			tapp(549,944,2)
			mSleep(200)
		end
	--[[
	while( havLast() )
		do
			mSleep(200)
			tapp(259 944")
		end
		]]
	--优化第一次取藏宝图速度
	bbempCount = countCangKuBeiBaoEmptyY(2)
	if bbempCount >10 then
		mSleep(2000)
	end
	if bbempCount >5 then
		mSleep(2000)
	end
	
	if bbempCount<15 then
		--[[
		--获取仓库空格,然后将身上的前三排扔到仓库,直到前三排都说空为止
		while( havNext() )
		do
			mSleep(200)
			tapp(549 944")
		end
		]]
		tapflag = false
		beibao2cangku(bbempCount)
		
	end
	
	--回到第一页,然后从仓库里面拿藏宝图
	while( havLast() )
	do
		tapp(259,944,2)
		mSleep(200)
	end
		
	if getAllFlag ==false then
		getAllFlag = true
		jyc = {}
		wzg = {}
		stl = {}
		zzg = {}
		dhw = {}
		dtjw = {}
		dtgj = {}
		alg = {}
		nec = {}
		hgs = {}
		mjc = {}
		pts = {}
		csjw = {}
		jnyw = {}
		bjlz = {}
		qls = {}
		getAllMap()
	end

	bbmapcount = 15 - getCityMap()
	--关闭仓库
	mSleep(500)
	tapp(1618,80,2)
	openPacket()
	mSleep(2000)
end



function autoDo()
	
	require("TSLib")
	UINew({width=1000,height=600})
	UICheck("qls,bjlz","麒麟山,北俱芦洲","0@1",-1,0,"",1,1)
	UIShow()
	beijuluzhouFlag = bjlz
	qilinshanFlag = qls
	-- nLog(beijuluzhouFlag)
	-- nLog(qilinshanFlag)
	while (true) do
		--把物品存到仓库，把仓库宝图挪到身上
		initMap()
		
		--如果所有的数组都是空，证明已经没有图了
		if(#wuzhuangguanArray == 0) and (#shituolingArray == 0) and  (#zhuziguoArray == 0) and  (#jianyechengArray == 0) and  (#donghaiwanArray == 0) and  (#datangjingwaiArray == 0) and  (#datangguojingArray == 0) and  (#aolaiguoArray == 0) and  (#nvercunArray == 0) and  (#huaguoshanArray == 0) and  (#mojiacunArray == 0)  and  (#putuoshanArray == 0)  and  (#changshoujiaowaiArray == 0)  and  (#jiangnanyewaiArray == 0)  and  (#beijuluzhouArray == 0) and  (#qilinshanArray == 0) then
			break
		end
		
		useSYX()
		tapPackageMap4()
		--麒麟山
		if(#qilinshanArray > 0) then
			-- nLog("麒麟山宝图排序")
			sortxr(qilinshanArray,qilinshanXYArray)
			-- nLog("麒麟山挖宝开始")
			openPacket()
			toQilinshan()
			
			for key,value in ipairs(qilinshanArray) 
			do
				mapxy = strSplit(value,"@")
				local mapLocal = qilinshanXYArray[key]
				data = strSplit(mapLocal,"@")
				qilinshan(data)
				--对比当前坐标和地图坐标是否一致
				repeat
					mSleep(3000)
					if getLocation(data) then
						break
					end
				until(false)
				doStay()
				--打包背包
				openPacket()
				--选择藏宝图 使用
				mSleep(500)
				if getRandom10() < 4 then
					tmpbt = qilinshanArray[key+1]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)

						local mapLocal2 = qilinshanXYArray[key+1]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				if getRandom10() < 4 then
					tmpbt = qilinshanArray[key+2]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = qilinshanXYArray[key+2]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				
				tapp(mapxy[1],mapxy[2],5)
				mSleep(500)
				useCangbaotu()
				
				useSuccess()
				tapPackageMap5time()
				closePacket()
				local times = slayMonster()
				
				addBlood(times)
			end
		end

		--花果山
		if(#huaguoshanArray > 0) then
			
			-- nLog("花果山宝图排序")
			sortxl(huaguoshanArray,huaguoshanXYArray)
			-- nLog("花果山挖宝开始")
			openPacket()
			toHuaguoshan()
			
			for key,value in ipairs(huaguoshanArray) 
			do
				mapxy = strSplit(value,"@")
				local mapLocal = huaguoshanXYArray[key]
				data = strSplit(mapLocal,"@")
				huaguoshan(data)
				--对比当前坐标和地图坐标是否一致
				repeat
					mSleep(3000)
					if getLocation(data) then
						break
					end
				until(false)
				doStay()
				--打包背包
				openPacket()
				--选择藏宝图 使用
				mSleep(500)
				if getRandom10() < 4 then
					tmpbt = huaguoshanArray[key+1]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = huaguoshanXYArray[key+1]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				if getRandom10() < 4 then
					tmpbt = huaguoshanArray[key+2]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = huaguoshanXYArray[key+2]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				
				tapp(mapxy[1],mapxy[2],5)
				mSleep(500)
				useCangbaotu()
				useSuccess()
				tapPackageMap5time()
				closePacket()
				local times = slayMonster()
				
				
				addBlood(times)
			end
		end

		--墨家村
		if(#mojiacunArray > 0) then
			
			-- nLog("墨家村宝图排序")
			sortyd(mojiacunArray,mojiacunXYArray)
			-- nLog("墨家村挖宝开始")
			openPacket()
			toMojiacun()
			
			for key,value in ipairs(mojiacunArray) 
			do
				mapxy = strSplit(value,"@")
				local mapLocal = mojiacunXYArray[key]
				data = strSplit(mapLocal,"@")
				mojiacun(data)
				--对比当前坐标和地图坐标是否一致
				repeat
					mSleep(3000)
					if getLocation(data) then
						break
					end
				until(false)
				doStay()
				--打包背包
				openPacket()
				--选择藏宝图 使用
				mSleep(500)
				if getRandom10() < 4 then
					tmpbt = mojiacunArray[key+1]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = mojiacunXYArray[key+1]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				if getRandom10() < 4 then
					tmpbt = mojiacunArray[key+2]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = mojiacunXYArray[key+2]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				
				tapp(mapxy[1],mapxy[2],5)
				mSleep(500)
				useCangbaotu()
				useSuccess()
				tapPackageMap5time()
				closePacket()
				local times = slayMonster()
				
				
				addBlood(times)
			end
		end

		--女儿村
		if(#nvercunArray > 0) then
			
			-- nLog("女儿村宝图排序")
			sortyd(nvercunArray,nvercunXYArray)
			-- nLog("女儿村挖宝开始")
			openPacket()
			toNvercun()
			
			for key,value in ipairs(nvercunArray) 
			do
				mapxy = strSplit(value,"@")
				local mapLocal = nvercunXYArray[key]
				data = strSplit(mapLocal,"@")
				nvercun(data)
				--对比当前坐标和地图坐标是否一致
				repeat
					mSleep(3000)
					if getLocation(data) then
						break
					end
				until(false)
				doStay()
				--打包背包
				openPacket()
				--选择藏宝图 使用
				mSleep(500)
				if getRandom10() < 4 then
					tmpbt = nvercunArray[key+1]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = nvercunArray[key+1]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				if getRandom10() < 4 then
					tmpbt = nvercunArray[key+2]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = nvercunArray[key+2]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				
				tapp(mapxy[1],mapxy[2],5)
				mSleep(500)
				useCangbaotu()
				useSuccess()
				tapPackageMap5time()
				closePacket()
				local times = slayMonster()
				
				
				addBlood(times)
			end
		end

		--大唐国境
		if(#datangguojingArray > 0) then
			
			-- nLog("大唐国境宝图排序")
			sortxr(datangguojingArray,datangguojingXYArray)
			-- nLog("大唐国境挖宝开始")
			openPacket()
			toDatangguojing()
			
			for key,value in ipairs(datangguojingArray) 
			do
				mapxy = strSplit(value,"@")
				local mapLocal = datangguojingXYArray[key]
				data = strSplit(mapLocal,"@")
				datangguojing(data)
				--对比当前坐标和地图坐标是否一致
				repeat
					mSleep(3000)
					if getLocation(data) then
						break
					end
				until(false)
				doStay()
				--打包背包
				openPacket()
				--选择藏宝图 使用
				mSleep(500)
				if getRandom10() < 4 then
					tmpbt = datangguojingArray[key+1]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = datangguojingArray[key+1]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				if getRandom10() < 4 then
					tmpbt = datangguojingArray[key+2]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = datangguojingArray[key+2]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				
				tapp(mapxy[1],mapxy[2],5)
				mSleep(500)
				useCangbaotu()
				useSuccess()
				tapPackageMap5time()
				closePacket()
				local times = slayMonster()
				
				
				addBlood(times)
			end
		end

		--普陀山
		if(#putuoshanArray > 0) then
			
			-- nLog("普陀山宝图排序")
			sortyd(putuoshanArray,putuoshanXYArray)
			-- nLog("普陀山挖宝开始")
			openPacket()
			toPutuoshan()
			
			for key,value in ipairs(putuoshanArray) 
			do
				mapxy = strSplit(value,"@")
				local mapLocal = putuoshanXYArray[key]
				data = strSplit(mapLocal,"@")
				putuoshan(data)
				--对比当前坐标和地图坐标是否一致
				repeat
					mSleep(3000)
					if getLocation(data) then
						break
					end
				until(false)
				doStay()
				--打包背包
				openPacket()
				--选择藏宝图 使用
				mSleep(500)
				if getRandom10() < 4 then
					tmpbt = putuoshanArray[key+1]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = putuoshanXYArray[key+1]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				if getRandom10() < 4 then
					tmpbt = putuoshanArray[key+2]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = putuoshanXYArray[key+2]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				
				tapp(mapxy[1],mapxy[2],5)
				mSleep(500)
				useCangbaotu()
				useSuccess()
				tapPackageMap5time()
				closePacket()
				local times = slayMonster()
				
				
				addBlood(times)
			end
		end


		--长寿郊外
		if(#changshoujiaowaiArray > 0) then
			
			-- nLog("长寿郊外宝图排序")
			sortyt(changshoujiaowaiArray,changshoujiaowaiXYArray)
			-- nLog("长寿郊外挖宝开始")
			openPacket()
			toChangshoujiaowai()
			
			for key,value in ipairs(changshoujiaowaiArray) 
			do
				mapxy = strSplit(value,"@")
				local mapLocal = changshoujiaowaiXYArray[key]
				data = strSplit(mapLocal,"@")
				changshoujiaowai(data)
				--对比当前坐标和地图坐标是否一致
				repeat
					mSleep(3000)
					if getLocation(data) then
						break
					end
				until(false)
				doStay()
				--打包背包
				openPacket()
				--选择藏宝图 使用
				mSleep(500)
				if getRandom10() < 4 then
					tmpbt = changshoujiaowaiArray[key+1]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = changshoujiaowaiXYArray[key+1]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				if getRandom10() < 4 then
					tmpbt = changshoujiaowaiArray[key+2]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = changshoujiaowaiXYArray[key+2]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				
				tapp(mapxy[1],mapxy[2],5)
				mSleep(500)
				useCangbaotu()
				useSuccess()
				tapPackageMap5time()
				closePacket()
				local times = slayMonster()
				
				
				addBlood(times)
			end
		end

		--江南野外
		if(#jiangnanyewaiArray > 0) then
			
			-- nLog("江南野外宝图排序")
			sortyd(jiangnanyewaiArray,jiangnanyewaiXYArray)
			-- nLog("江南野外挖宝开始")
			openPacket()
			toJiangnanyewai()
			
			for key,value in ipairs(jiangnanyewaiArray) 
			do
				mapxy = strSplit(value,"@")
				local mapLocal = jiangnanyewaiXYArray[key]
				data = strSplit(mapLocal,"@")
				jiangnanyewai(data)
				--对比当前坐标和地图坐标是否一致
				repeat
					mSleep(3000)
					if getLocation(data) then
						break
					end
				until(false)
				doStay()
				--打包背包
				openPacket()
				--选择藏宝图 使用
				mSleep(500)
				if getRandom10() < 4 then
					tmpbt = jiangnanyewaiArray[key+1]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = jiangnanyewaiXYArray[key+1]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				if getRandom10() < 4 then
					tmpbt = jiangnanyewaiArray[key+2]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = jiangnanyewaiXYArray[key+2]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				
				tapp(mapxy[1],mapxy[2],5)
				mSleep(500)
				useCangbaotu()
				useSuccess()
				tapPackageMap5time()
				closePacket()
				local times = slayMonster()
				
				
				addBlood(times)
			end
		end

		--五庄观
		if(#wuzhuangguanArray > 0) then
			
			-- nLog("五庄观宝图排序")
			sortxl(wuzhuangguanArray,wuzhuangguanXYArray)
			-- nLog("五庄观挖宝开始")
			openPacket()
			toWuzhuangguan()
			
			for key,value in ipairs(wuzhuangguanArray) 
			do
				mapxy = strSplit(value,"@")
				local mapLocal = wuzhuangguanXYArray[key]
				data = strSplit(mapLocal,"@")
				wuzhuangguan(data)
				--对比当前坐标和地图坐标是否一致
				repeat
					mSleep(3000)
					if getLocation(data) then
						break
					end
				until(false)
				doStay()
				--打包背包
				openPacket()
				--选择藏宝图 使用
				mSleep(500)
				if getRandom10() < 4 then
					tmpbt = wuzhuangguanArray[key+1]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = wuzhuangguanXYArray[key+1]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				if getRandom10() < 4 then
					tmpbt = wuzhuangguanArray[key+2]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = wuzhuangguanXYArray[key+2]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				
				tapp(mapxy[1],mapxy[2],5)
				mSleep(500)
				useCangbaotu()
				useSuccess()
				tapPackageMap5time()
				closePacket()
				local times = slayMonster()
				
				
				addBlood(times)
			end
		end

		--狮驼岭
		if(#shituolingArray > 0) then
			
			-- nLog("狮驼岭宝图排序")
			sortyt(shituolingArray,shituolingXYArray)
			-- nLog("狮驼岭挖宝开始")
			
			if isPackageOpen() then
				toShituoling()
			else
				openPacket()
				toShituoling()
			end
			
			for key,value in ipairs(shituolingArray) 
			do
				mapxy = strSplit(value,"@")
				local mapLocal = shituolingXYArray[key]
				data = strSplit(mapLocal,"@")
				data = strSplit(mapLocal,"@")
				wuzhuangguan(data)
				--对比当前坐标和地图坐标是否一致
				repeat
					mSleep(3000)
					if getLocation(data) then
						break
					end
				until(false)
				doStay()
				--打包背包
				openPacket()
				--选择藏宝图 使用
				mSleep(500)
				if getRandom10() < 4 then
					tmpbt = shituolingArray[key+1]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = shituolingXYArray[key+1]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				if getRandom10() < 4 then
					tmpbt = shituolingArray[key+2]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = shituolingXYArray[key+2]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				
				tapp(mapxy[1],mapxy[2],5)
				mSleep(500)
				useCangbaotu()
				useSuccess()
				tapPackageMap5time()
				closePacket()
				local times = slayMonster()
				
				
				addBlood(times)
			end
		end

		--东海湾
		if(#donghaiwanArray > 0) then
			
			-- nLog("东海湾宝图排序")
			sortxr(donghaiwanArray,donghaiwanXYArray)
			-- nLog("东海湾挖宝开始")
			
			openPacket()
			toDonghaiwan()
			
			for key,value in ipairs(donghaiwanArray) 
			do
				mapxy = strSplit(value,"@")
				local mapLocal = donghaiwanXYArray[key]
				data = strSplit(mapLocal,"@")
				donghaiwan(data)
				--对比当前坐标和地图坐标是否一致
				repeat
					mSleep(3000)
					if getLocation(data) then
						break
					end
				until(false)
				doStay()
				--打包背包
				openPacket()
				--选择藏宝图 使用
				mSleep(500)
				if getRandom10() < 4 then
					tmpbt = donghaiwanArray[key+1]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = donghaiwanXYArray[key+1]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				if getRandom10() < 4 then
					tmpbt = donghaiwanArray[key+2]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = donghaiwanXYArray[key+2]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				
				tapp(mapxy[1],mapxy[2],5)
				mSleep(500)
				useCangbaotu()
				useSuccess()
				tapPackageMap5time()
				closePacket()
				local times = slayMonster()
				
				
				addBlood(times)
			end
		end

		--北俱芦洲
		if(#beijuluzhouArray > 0) then
			
			-- nLog("北俱芦洲宝图排序")
			sortxr(beijuluzhouArray,beijuluzhouXYArray)
			-- nLog("北俱芦洲挖宝开始")
			openPacket()
			toBeijuluzhou()
			
			for key,value in ipairs(beijuluzhouArray) 
			do
				mapxy = strSplit(value,"@")
				local mapLocal = beijuluzhouXYArray[key]
				data = strSplit(mapLocal,"@")
				beijuluzhou(data)
				--对比当前坐标和地图坐标是否一致
				repeat
					mSleep(3000)
					if getLocation(data) then
						break
					end
				until(false)
				doStay()
				--打包背包
				openPacket()
				--选择藏宝图 使用
				mSleep(500)
				if getRandom10() < 4 then
					tmpbt = beijuluzhouArray[key+1]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = beijuluzhouXYArray[key+1]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				if getRandom10() < 4 then
					tmpbt = beijuluzhouArray[key+2]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = beijuluzhouXYArray[key+2]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				
				tapp(mapxy[1],mapxy[2],5)
				mSleep(500)
				useCangbaotu()
				useSuccess()
				tapPackageMap5time()
				closePacket()
				local times = slayMonster()
				
				addBlood(times)
			end
		end
		
		--大唐境外
		if(#datangjingwaiArray > 0) then
			
			-- nLog("大唐境外宝图排序")
			sortxl(datangjingwaiArray,datangjingwaiXYArray)
			-- nLog("大唐境外挖宝开始")
			openPacket()
			toDatangjingwai()
			
			for key,value in ipairs(datangjingwaiArray) 
			do
				mapxy = strSplit(value,"@")
				local mapLocal = datangjingwaiXYArray[key]
				data = strSplit(mapLocal,"@")
				
				datangjingwai(data)
				--对比当前坐标和地图坐标是否一致
				repeat
					mSleep(3000)
					if getLocation(data) then
						break
					end
				until(false)
				doStay()
				--打包背包
				openPacket()
				--选择藏宝图 使用
				mSleep(500)
				if getRandom10() < 4 then
					tmpbt = datangjingwaiArray[key+1]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = datangjingwaiXYArray[key+1]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				if getRandom10() < 4 then
					tmpbt = datangjingwaiArray[key+2]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = datangjingwaiXYArray[key+2]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				
				tapp(mapxy[1],mapxy[2],5)
				mSleep(500)
				useCangbaotu()
				useSuccess()
				tapPackageMap5time()
				closePacket()
				local times = slayMonster()
				
				
				addBlood(times)
			end
		end


		--朱紫国
		if(#zhuziguoArray > 0) then
			
			-- nLog("朱紫国宝图排序")
			sortyt(zhuziguoArray,zhuziguoXYArray)
			-- nLog("朱紫国挖宝开始")
			openPacket()
			toZhuziguo()
			for key,value in ipairs(zhuziguoArray) 
			do
				mapxy = strSplit(value,"@")
				local mapLocal = zhuziguoXYArray[key]
				data = strSplit(mapLocal,"@")
				zhuziguo(data)
				--对比当前坐标和地图坐标是否一致
				repeat
					mSleep(3000)
					if getLocation(data) then
						break
					end
				until(false)
				doStay()
				--打包背包
				openPacket()
				--选择藏宝图 使用
				mSleep(500)
				if getRandom10() < 4 then
					tmpbt = zhuziguoArray[key+1]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = zhuziguoXYArray[key+1]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				if getRandom10() < 4 then
					tmpbt = zhuziguoArray[key+2]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = zhuziguoXYArray[key+2]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				
				tapp(mapxy[1],mapxy[2],5)
				mSleep(500)
				useCangbaotu()
				
				useSuccess()
				tapPackageMap5time()
				closePacket()
				local times = slayMonster()
				
				addBlood(times)
			end
		end
		
		--傲来国
		if(#aolaiguoArray > 0) then
			
			-- nLog("傲来国宝图排序")
			sortyt(aolaiguoArray,aolaiguoXYArray)
			-- nLog("傲来国挖宝开始")
			openPacket()
			toAolaiguo()
			
			for key,value in ipairs(aolaiguoArray) 
			do
				mapxy = strSplit(value,"@")
				local mapLocal = aolaiguoXYArray[key]
				data = strSplit(mapLocal,"@")
				aolaiguo(data)
				--对比当前坐标和地图坐标是否一致
				repeat
					mSleep(3000)
					if getLocation(data) then
						break
					end
				until(false)
				doStay()
				--打包背包
				openPacket()
				--选择藏宝图 使用
				mSleep(500)
				if getRandom10() < 4 then
					tmpbt = aolaiguoArray[key+1]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = aolaiguoXYArray[key+1]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				if getRandom10() < 4 then
					tmpbt = aolaiguoArray[key+2]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = aolaiguoXYArray[key+2]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				
				tapp(mapxy[1],mapxy[2],5)
				mSleep(500)
				useCangbaotu()
				useSuccess()
				tapPackageMap5time()
				closePacket()
				local times = slayMonster()
				
				addBlood(times)
			end
		end


		--建邺城
		if(#jianyechengArray > 0) then
			
			-- nLog("建邺城宝图排序")
			sortyd(jianyechengArray,jianyechengXYArray)
			-- nLog("建邺城挖宝开始")
			openPacket()
			toJianyecheng()
			for key,value in ipairs(jianyechengArray) 
			do
				-- nLog("当前宝图使用开始")
				mapxy = strSplit(value,"@")
				local mapLocal = jianyechengXYArray[key]
				data = strSplit(mapLocal,"@")
				-- nLog("开始移动：坐标"..data[1]..","..data[2])
				jianyecheng(data)
				--对比当前坐标和地图坐标是否一致
				repeat
					mSleep(3000)
					if getLocation(data) then
						break
					end
				until(false)
				doStay()
				--打包背包
				openPacket()
				--选择藏宝图 使用
				mSleep(500)
				if getRandom10() < 4 then
					tmpbt = jianyechengArray[key+1]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = jianyechengXYArray[key+1]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				if getRandom10() < 4 then
					tmpbt = jianyechengArray[key+2]
					if tmpbt ~= nil then
						tmpxy = strSplit(tmpbt,"@")
						tapp(tmpxy[1],tmpxy[2],5)
						mSleep(500)
						local mapLocal2 = jianyechengXYArray[key+2]
						data2 = strSplit(mapLocal2,"@")
						if isSimilarLocate(data,data2) == false then
							useCangbaotu()
						end
					end
				end
				
				tapp(mapxy[1],mapxy[2],5)
				mSleep(500)
				useCangbaotu()
				useSuccess()
				tapPackageMap5time()
				closePacket()
				local times = slayMonster()
				addBlood(times)
				-- nLog("当前宝图使用结束")
			end
		end

		if tempPackageFlag == true then
			tempPackageFlag = false
			mSleep(500)
			tapp(1701,1021,10)
			mSleep(500)
			tapp(1606,702,30)
			mSleep(500)
			tappp(775,859,100,20)
			mSleep(5000)
		end
	end
end

function useCangbaotu()
	while (true) do
		x1,y1 = findMultiColorInRegionFuzzy( 0x02f602, "", 90, 441, 511, 669, 548)
		if x1>-1 then
			break
		end
	end
	x1,y1 = findMultiColorInRegionFuzzy( 0xffffff, "1|-20|0x385c70,0|28|0x284450,67|-23|0x3e5c70,71|-5|0x305368", 90, 665, 564, 768, 887)
	tapp(x1,y1,10)
end

function getLocation(data)
	data1 = strSplit(localZuobiao(),"@")
	if #data1 < 3 then
		return false
	end
	local cx,cy,tx,ty
	tx = string.gsub(data[2], "-", "")
	ty = string.gsub(data[3], "-", "")
	cx = string.gsub(data1[2], "-", "")
	cy = string.gsub(data1[3], "-", "")

	if math.abs(tx - cx) <2 and math.abs(ty - cy) < 2 then
		return true
	else
		return false
	end
end

function isSimilarLocate(data1,data2)
	return true
	--[[nLog("data1:"..data1[1]..","..data1[2]..","..data1[3].." data2:"..data2[1]..","..data2[2]..","..data2[3])
	local islx1,islx2,isly1,isly2,islstr
	islx1 = tonumber(string.gsub(data1[2],"[^0-9]",""))
	islx2 = tonumber(string.gsub(data2[2],"[^0-9]",""))
	isly1 = tonumber(string.gsub(data1[3],"[^0-9]",""))
	isly2 = tonumber(string.gsub(data2[3],"[^0-9]",""))

	isltr = "比较坐标：("..islx1..","..isly1.."),("..islx2..","..isly2..")->"
	if math.abs(islx1 - islx2) < 10 and math.abs(isly1 - isly2) < 10 then
		isltr = isltr + "相近"
		nLog(isltr)
		return true
	end
	isltr = isltr + "不相近"
	nLog(isltr)
	return false]]
end

--pcall(autoDo)
autoDo()
--closePacket()
--mSleep(500)
--exitGame()

--toast(inputWordValidate(nil,498,146,561,182),1)
--mSleep(1000)
--toast(inputWordValidate(nil,694,146,755,181),1)
--mSleep(1000)

--[[
x: 498 146
   561 182
y: 694 146
   755 181
]]   
	
