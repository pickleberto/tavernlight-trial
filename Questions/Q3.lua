-- Q3 - Fix or improve the name and the implementation of the below method

function do_sth_with_PlayerParty(playerId, membername)
	player = Player(playerId)
	local party = player:getParty()

	for k,v in pairs(party:getMembers()) do
		if v == Player(membername) then
			party:removeMember(Player(membername))
		end
	end
end

-- Answer

-- we are removing a member with name 'membername' from the party of the player with id 'playerId'
function removeMemberFromPlayerParty(playerId, membername)
	-- get the player, to avoid messing with any global, lets make it local
	local player = Player(playerId)
	-- get the party
	local party = player:getParty()
	-- store the member's player to be removed in a variable
	local memberPlayer = Player(membername)

	-- check if the member is in the party
	for k,v in pairs(party:getMembers()) do
		if v == memberPlayer then
			party:removeMember(memberPlayer) -- now remove 
		end
	end
end