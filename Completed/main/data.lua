local M = {}

M.STATE_COUNTDOWN = 1
M.STATE_PLAY = 2
M.STATE_PAUSE = 3
M.STATE_GAMEOVER = 4

M.state = M.STATE_COUNTDOWN
M.score_player1 = 0
M.score_player2 = 0
M.has_touch_screen = false
M.players = 1

function M.updateScore(score, player)
	M.score = M.score + math.floor(score)
end

function M.getScore()
	return M.score
end

function M.newGame()
	M.state = M.STATE_COUNTDOWN
	M.score_player1 = 0
	M.score_player2 = 0
	M.state = M.STATE_WAIT
	M.has_touch_screen = false
	M.players = 1
end

function M.playGame()
	M.state = M.STATE_PLAY
end

function M.player_scored(player)
	print(player)
	M.state = M.STATE_PAUSE

	if player == 1 then M.score_player1 = M.score_player1 + 1
	elseif player == 2 then M.score_player2 = M.score_player2 + 1
	end
end

function M.get_state()
	return M.state
end

function M.set_state(state)
	M.state = state
end

function M.set_touch_enabled(enabled)
	M.has_touch_screen = enabled
end

function M.get_touch_enabled()
	return M.has_touch_screen
end

function M.set_players(number)
	M.players = number
end

function M.get_players()
	return M.players
end

function M.round(n)
	return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end

return M