dofile(minetest.get_modpath("interact") .. "/config.lua")
dofile(minetest.get_modpath("interact") .. "/rules.lua") --I put the rules in their own file so that they don't get lost/overlooked!

local function make_formspec(player)
	local name = player:get_player_name()
	local size = { "size[10,4]" }
	table.insert(size, "label[0.5,0.5;" ..interact.s1_header.. "]")
	table.insert(size, "label[0.5,1.5;" ..interact.s1_l2.. "]")
	table.insert(size, "label[0.5,2;" ..interact.s1_l3.. "]")
	table.insert(size, "button_exit[5.5,3.4;2,0.5;no;" ..interact.s1_b1.. "]")
	table.insert(size, "button[7.5,3.4;2,0.5;yes;" ..interact.s1_b2.. "]")
	return table.concat(size)
end

local function make_formspec2(player)
	local name = player:get_player_name()
	local size = { "size[10,4]" }
	table.insert(size, "label[0.5,0.5;" ..interact.s2_l1.. "]")
	table.insert(size, "label[0.5,1;" ..interact.s2_l2.. "]")
	table.insert(size, "button_exit[2.5,3.4;3.5,0.5;interact;" ..interact.s2_b1.. "]")
	table.insert(size, "button_exit[6.4,3.4;3.6,0.5;visit;" ..interact.s2_b2.. "]")
	return table.concat(size)
end

local function make_formspec3(player)
	local size = { "size[10,8]" }
	table.insert(size, "textarea[0.5,0.5;9.5,7.5;TOS;" ..interact.s3_header.. ";" ..interact.rules.. "]")
	table.insert(size, "button[5.5,7.4;2,0.5;decline;" ..interact.s3_b2.. "]")
	table.insert(size, "button_exit[7.5,7.4;2,0.5;accept;" ..interact.s3_b1.. "]")
	return table.concat(size)
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "welcome" then return end
		local name = player:get_player_name()
		if fields.no then
			minetest.after(1, function()
				minetest.show_formspec(name, "visit", make_formspec2(player))
			end)
			return
		elseif fields.yes then
			if interact.grief_ban ~= true then
				minetest.kick_player(name, interact.msg_grief)
			else
				minetest.ban_player(name)
			end
		return
	end
end)

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "visit" then return end
		local name = player:get_player_name()
		if fields.interact then
			minetest.after(1, function()
				minetest.show_formspec(name, "rules", make_formspec3(player))
			end)
			return
		elseif fields.visit then
			minetest.chat_send_player(name, interact.vist_msg)
			minetest.log("action", name.. " is just visiting.")
		return
	end
end)


minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "rules" then return end
	local name = player:get_player_name()
		if fields.accept then
			if minetest.check_player_privs(name, interact.priv) then
				minetest.chat_send_player(name, interact.interact_msg1)
				minetest.chat_send_player(name, interact.interact_msg2)
				local privs = minetest.get_player_privs(name)
				privs.interact = true
				minetest.set_player_privs(name, privs)
				minetest.log("action", "Granted " ..name.. " interact.")
			end
		return
			elseif fields.decline then
				if interact.disagree_ban ~= true then
					minetest.kick_player(name, interact.disagree_msg)
				else
					minetest.ban_player(name)
				end
		return
	end
end)

minetest.register_chatcommand("rules",{
	params = "",
	description = "Shows the server rules",
	privs = interact.priv,
	func = function (name,params)
	local player = minetest.get_player_by_name(name)
		minetest.after(1, function()
			minetest.show_formspec(name, "welcome", make_formspec(player))
		end)
	end
})

minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	if not minetest.get_player_privs(name).interact then
		minetest.show_formspec(name, "welcome", make_formspec(player))
	else
		end
	end
)
