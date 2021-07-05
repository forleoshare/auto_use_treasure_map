require("ZZBase64")
require("TSLib")
require("ocr")

local ts = require("ts")
local image = require("tsimg")



function duociGet(base64,timestamp,ltype,page,min,max)
	duociGetStr = "";
	local subString = string.sub(base64,min,max)
	if(string.len(subString) == 5000)
		then
			nextMin = page*5000 + 1
			nextMax = nextMin + 5000 - 1
			page = page+1
			
			header_send = {
			["Content-Type"] = "application/x-www-form-urlencoded",
			}
			body_send = {["image"] = subString,["timestamp"] = timestamp,["number"] = string.len(base64)/5000,["type"] = ltype}

			local code,header_resp, body_resp = ts.httpsGet("http://192.168.40.67:8080/discern/ocrSub", header_send,body_send)
			
			duociGet(base64,timestamp,ltype,page,nextMin,nextMax)
		else
			header_send = {
			["Content-Type"] = "application/x-www-form-urlencoded",
			}
			body_send = {["image"] = subString,["timestamp"] = timestamp,["number"] = string.len(base64)/5000,["type"] = ltype}

			local code,header_resp, body_resp = ts.httpsGet("http://192.168.40.67:8080/discern/ocrSub", header_send,body_send)
			duociGetStr = body_resp
	end
	return duociGetStr
end

--截图并且旋转270°
function cutImage(x1,y1,x2,y2,ltype)
	path = userPath();
	path = path.."/res/1.png"
	snapshot(path, x1, y1, x2, y2)


	local newImage1,msg = image.loadFile(userPath() .. "/res/1.png")
	if image.is(newImage1) then
		--将图片对象顺时针旋转 270 度
		local newImage2,msg = image.setRotation270(newImage1);
		if image.is(newImage2) then
			--将图片对象转换为图片
			local boo,msg = image.saveToPngFile(newImage2,userPath() .. "/res/1.png")
		else
			dialog(msg,3)
		end
	else
		dialog(msg,3)
	end
	
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
	
	if(string.len(base64) > 5000)
		then
			duociGet(base64,timestamp,ltype,1,1,5000)
		else
			header_send = {
			["Content-Type"] = "application/x-www-form-urlencoded",
			}
			body_send = {["image"] = base64,["type"] = ltype}

			local code,header_resp, body_resp = ts.httpsGet("http://192.168.40.67:8080/discern/ocr", header_send,body_send)
			toast(body_resp,2)
	end
	
	return body_resp
end

str = "1234567890q1234567890"
resultStr = "";

function stepString(min,max,page,step)
	my = "1"
	-- body
	length = string.len(str);

	local subString = string.sub(str,min,max)
	if(string.len(subString) == 5)
		then
			nextMin = page*step + 1
			nextMax = nextMin + step - 1
			page = page+1
			stepString(nextMin,nextMax,page,step)
		else
			my ="2"
			dialog(my)
	end
	return my
end




--dialog(stepString(1,5,1,5))
str = cutImage(477,1057,502,1084)
--dialog(str)


