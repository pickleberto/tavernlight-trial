-- Q2 - Fix or improve the implementation of the below method

function printSmallGuildNames(memberCount)
	-- this method is supposed to print names of all guilds that have less than memberCount max members
	local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
	local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
	local guildName = result.getString("name")
	print(guildName)
end


-- Answer

function printSmallGuildNames(memberCount)
    -- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
	local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
	-- first we validate  the query
    if resultId ~= false then
		-- then we iterate over the results
		repeat
			-- to get the correct result, we need to pass the  query id
			local guildName = result.getString(resultId, "name")
            print(guildName)
		until not result.next(resultId)
		-- finally we free the resources used
		result.free(resultId)
	end
end