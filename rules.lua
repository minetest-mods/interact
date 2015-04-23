--The actual rules.
interact.rules = [[
Rules:

1. No griefing.
2. No hacked clients.
3. No swearing or insults towards other players.
4. No family roleplay.
5. No dating.
6. Do not ask for more privs, or to be an admin. Also do not ask for items.
7. PVP is not allowed.
]]

--The questions on the rules, if the quiz is used.
--The checkboxes for the first 4 questions are in config.lua
interact.s4_question1 = "Is PVP is allowed?"
interact.s4_question2 = "Is family roleplay allowed?"
interact.s4_question3 = "Should you be nice to all players?"
interact.s4_question4 = "Should you ask for all the privs you can?"
interact.s4_multi_question = "Which of these is a rule?"

--The answers to the multiple choice questions. Only one of these should be true.
interact.s4_multi1 = "No griefing!"
interact.s4_multi2 = "PVP is allowed."
interact.s4_multi3 = "Be rude to other players."

--Which answer is needed for the quiz questions. interact.quiz1-4 takes true or false.
--True is left, false is right.
--Please, please spell true and false right!!! If you spell it wrong it won't work!
--interact.quiz can be 1, 2 or 3.
--1 is the top one by the question, 2 is the bottom left one, 3 is the bottom right one.
--Make sure these agree with your answers!
interact.quiz1 = false
interact.quiz2 = false
interact.quiz3 = true
interact.quiz4 = false
interact.quiz_multi = 1
