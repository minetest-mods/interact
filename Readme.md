##Interact: A mod for minetest.

This mod is designed to automatically grant new players on a server interact. A formspec will be show when the player joins, and there is a command to bring the formspec up later in the game.
There are 3 screens that they go through. The first one is a check if they like griefing (One for really stupid griefers!), the next checks if the player just wants to look round the server, and the final one shows the rules, and asks the player to accept them. 

####Configuring the mod:
By default, the rules are blank. Thus, you will need to open up init.lua, and add your rules on line 3. If you grant fast by default on your server, you may want to replace shout with fast on line 86. You can also edit the various lines to suit your server. Lines that contain things that control the messages are these:

- 9 & 10
- 19 & 20
- 43
- 57
- 69 & 70
- 78

####Notes:
1. This mod is based on the (old) [rules](https://github.com/CraigyDavi/Craig-Server_game/blob/df8beb15e6b02ab6dd22f94349453c51819238c4/mods/_misc/rules.lua) on [Craig's Server.](https://forum.minetest.net/viewtopic.php?f=10&t=7010) 
2. That mod was, in turn based on this [mod.](https://github.com/ChaosWormz/mt_terms_of_use) 
3. It is quite likely that I will make what is said to the user configurable without having to edit init.lua, at some point.