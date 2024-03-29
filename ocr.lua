
require("ZZBase64")
require("TSLib")
local ts = require("ts")
local image = require("tsimg")
local json = ts.json

--获取藏宝图坐标请求
function post(base64str)
	--local url = "http://cd.51ruzhu.com:30000/discern/ocrSub/post"
	--local url = "http://101.34.73.218:30000/cd1080/getLocation"
	local url = "http://192.168.31.84:30000/cd1080/getLocation"

	local data = "{\"body\":\""..base64str.."\",\"uuid\":\"uuid\"}"
	local options = {
		["tstab"] = 1, -- 必填项
		["timeOut"] = 90,
		["urlEnCode"] = false
	}
	return httpPost(url,data,options)
end

--获取小地图输入坐标
function post2(base64str)
	--local url = "http://cd.51ruzhu.com:30000/discern/ocrSub/post"
	local url = "http://192.168.31.84:30000/cd1080/getInputWord"

	local data = "{\"body\":\""..base64str.."\",\"uuid\":\"uuid\"}"
	local options = {
		["tstab"] = 1, -- 必填项
		["timeOut"] = 90,
		["urlEnCode"] = false
	}
	return httpPost(url,data,options)
end

function upload()
	
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
	
	
	timestamp = os.time()
--	cutImageStr = duociGet(base64,timestamp,ltype,1,1,5000)
	cutImageStr = post(base64)
	return cutImageStr
	--local code,header_resp, body_resp = ts.httpsGet("http://192.168.40.67:8080/discern/upload", header_send,body_send)
	--dialog(body_resp)
end

--获取人物当前坐标
function post1(base64str)
	--local url = "http://118.31.47.19:30000/cd1080/getLocation"
	local url = "http://192.168.31.84:30000/cd1080/getLocation"
	
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