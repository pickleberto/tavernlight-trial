-- Q1 - Fix or improve the implementation of the below methods

local function releaseStorage(player)
	player:setStorageValue(1000, -1)
end

function onLogout(player)
	if player:getStorageValue(1000) == 1 then
		addEvent(releaseStorage, 1000, player)
	end
	return true
end

-- Answer

-- to improve readability, lets add some variables
local KEY = 1000
local CLEAR_VALUE = -1
local DELAY_MS = 1000
local VALUE_TO_CHECK = 1

-- the functions will stay the same, just adding meaning to the values
local function releaseStorage(player)
	player:setStorageValue(KEY, CLEAR_VALUE)
end

function onLogout(player)
	if player:getStorageValue(KEY) == VALUE_TO_CHECK then
		addEvent(releaseStorage, DELAY_MS, player)
	end
	return true
end
