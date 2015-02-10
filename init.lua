local RULES = [[
Rules:

]]

local function make_formspec(player)
	local name = player:get_player_name()
	local size = { "size[10,4]" }
	table.insert(size, "label[0.5,0.5;Hello, " ..name..  ", welcome to this server!]")
	table.insert(size, "label[0.5,1.5;Could you please tell me if you like to grief or not?]")
	table.insert(size, "button_exit[5.5,3.4;2,0.5;no;No, I don't.]")
	table.insert(size, "button[7.5,3.4;2,0.5;yes;Yes, I do!]")
	return table.concat(size)
end

local function make_formspec2(player)
	local name = player:get_player_name()
	local size = { "size[10,4]" }
	table.insert(size, "label[0.5,0.5;So " ..name.. ", do you want interact, or do you just want to look around]")
	table.insert(size, "label[0.5,1;the server?]")
	table.insert(size, "button_exit[2.5,3.4;3.5,0.5;interact;Yes, I want interact!]")
	table.insert(size, "button_exit[6.4,3.4;3.6,0.5;visit;I just want to look round.]")
	return table.concat(size)
end

local function make_formspec3(player)
	local size = { "size[10,8]" }
	table.insert(size, "textarea[0.5,0.5;9.5,7.5;TOS;Here are the rules:;"..RULES.."]")
	table.insert(size, "button[5.5,7.4;2,0.5;decline;I Disagree]")
	table.insert(size, "button_exit[7.5,7.4;2,0.5;accept;I Agree]")
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
			minetest.kick_player(name, "Try out singleplayer if you like griefing, because then you'll only destroy your own stuff!")
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
			minetest.chat_send_player(name, "Have a nice time looking round! If you want interact just type /rules, and you can go through the process again!")
			minetest.log("action", name.. " is just visiting.")
		return
	end
end)


minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "rules" then return end
	local name = player:get_player_name()
		if fields.accept then
			if minetest.check_player_privs(name, {shout=true}) then
				minetest.chat_send_player(name, "Thanks for accepting the rules, you now are able to interact with things.")
				minetest.chat_send_player(name, "Happy building!")
				local privs = minetest.get_player_privs(name)
				privs.interact = true
				minetest.set_player_privs(name, privs)
				minetest.log("action", "Granted " ..name.. " interact.")
			end
		return
			elseif fields.decline then
				minetest.kick_player(name, "Bye then! You have to agree to the rules to play on the server.")
		return
	end
end)

minetest.register_chatcommand("rules",{
	params = "",
	description = "Shows the server rules",
	privs = {shout=true},
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

