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

--移动到东海湾
function toDonghaiwan()
	toJianyecheng()
	toDonghaiwan2()
end
--建邺城移动到东海湾
function toDonghaiwan2()
    
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

--移动到江南野外
function toJiangnanyewai()
	
	toJianyecheng()
	toJiangnanyewai2()
end
--建邺城到江南野外
function toJiangnanyewai2()
	
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

--江南野外移动到指定坐标
function jiangnanyewai(data)
	
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

--移动到五庄观
function toWuzhuangguan()
	--跑图
	toDatangjingwai()
	toWuzhuangguan2()
	
end

--大唐境外到五庄观
function toWuzhuangguan2()
	mSleep(1000)
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

--五庄观移动到指定坐标
function wuzhuangguan(data)

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

--移动到狮驼岭
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

--狮驼岭内移动到指定坐标
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

--已修改
function addBlood(time)
	if time==0 then 
	    return
    end
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
	--20230812可用
	tapp(750,434,20)
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

-- 入口函数
function autoDo()
	
	require("TSLib")
	--弹出对话框判断是否挖北俱芦洲和麒麟山宝图
	UINew({width=1000,height=600})
	UICheck("qls,bjlz","麒麟山,北俱芦洲","0@1",-1,0,"",1,1)
	UIShow()
	beijuluzhouFlag = bjlz
	qilinshanFlag = qls
	-- nLog(beijuluzhouFlag)
	-- nLog(qilinshanFlag)
	while (true) do
		--初始化
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