function countCangKuEmpty()
	
	keepScreen(true)
	local count=0
	
	for x=0,3 do
		for y=0,4 do
			
			local flag = true
			for j=349,448,1 do
				color = getColor(j+x*183, 365+y*183)
				if color ~=12103896 then
					flag = false
				end
			end
			if flag == true then
				count = count+1
			end
		end
	end
	
	keepScreen(false)
	return count
end


function countBeiBaoEmpty()
	
	keepScreen(true)
	local count=0
	
	for x=0,3 do
		for y=0,4 do
			
			local flag = true
			for j=349,448,1 do
				color = getColor(j+x*183, 1340+y*183)
				if color ~=12103896 then
					flag = false
				end
			end
			if flag == true then
				count = count+1
			end
		end
	end
	keepScreen(false)
	return count
end


function findCangkuNoEmptyMap()
	
	keepScreen(true)
	local mapArray = {}
	local row = 1
	for x=0,3 do
		for y=0,4 do
			local flag = true
			for j=349,448,1 do
				color = getColor(j+x*183, 365+y*183)
				if color ~=12103896 then
					flag = false
					break
				end
			end
			if flag == false then
				mapArray[row] = (365+y*183).."@"..(1440-(356+x*183))
				row = row+1
			end
		end
	end
	keepScreen(false)
	return mapArray
end


function findBeiBaoNoEmptyMap()
	
	keepScreen(true)
	local mapArray = {}
	local row = 1
	for x=1,3 do
		for y=0,4 do
			local flag = true
			for j=349,448,1 do
				color = getColor(j+x*183, 1340+y*183)
				if color ~=12103896 then
					flag = false
					break
				end
			end
			if flag == false then
				mapArray[row] = (1340+y*183).."@"..(1440-(387+x*183))
				row = row+1
			end
		end
	end
	keepScreen(false)
	return mapArray
end