interact = {}

--The first screen--
--The text at the top.
interact.s1_header = "Hello, welcome to this server!"
--Lines one and two. Make sure each line is less than 70 characters, or they will run off the screen.
interact.s1_l2 = "Could you please tell me if you like to grief or not?"
interact.s1_l3 = ""
--The buttons. Each can have 15 characters, max.
interact.s1_b1 = "No, I don't."
interact.s1_b2 = "Yes, I do!"

--The message to send kicked griefers.
interact.msg_grief = "Try out singleplayer if you like griefing, because then you'll only destroy your own stuff!"

--Ban or kick griefers? Default is kick, set to true for ban.
interact.grief_ban = false

--The second screen--
--Lines one and two. Make sure each line is less than 70 characters, or they will run off the screen.
interact.s2_l1 = "So, do you want interact, or do you just want to look around"
interact.s2_l2 = "the server?"
--The buttons. These ones can have a maximum of 26 characters.
interact.s2_b1 = "Yes, I want interact!"
interact.s2_b2 = "I just want to look round."

--The message the player is sent if s/he is just visting.
interact.vist_msg = "Have a nice time looking round! If you want interact just type /rules, and you can go through the process again!"

--The third screen--
--The header for the rules box, this can have 60 characters, max.
interact.s3_header = "Here are the rules:"

--The buttons. Each can have 15 characters, max.
interact.s3_b1 = "I agree"
interact.s3_b2 = "I disagree"

--The message to send players who disagree when they are kicked.
interact.disagree_msg = "Bye then! You have to agree to the rules to play on the server."

--Kick or ban players who disagree. False will just kick.
interact.disagree_ban = false

--The messages send to the player after interact is granted.
interact.interact_msg1 = "Thanks for accepting the rules, you now are able to interact with things."
interact.interact_msg2 = "Happy building!"

--The priv required to use the /rules command.
interact.priv = {fast = true}
