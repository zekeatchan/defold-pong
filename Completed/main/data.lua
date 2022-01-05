local M = {}

M.STATE_MENU = 1
M.STATE_CONTROLS = 2
M.STATE_READY = 3
M.STATE_PLAY = 4
M.STATE_PAUSE = 5
M.STATE_GAMEOVER = 6

M.state = M.STATE_MENU
M.score_player1 = 0
M.score_player2 = 0
M.speed = M.STARTING_SPEED
M.distance = 0
M.sections = {0, 0, 0}
M.state = M.STATE_WAIT
M.time_elapsed = 0
M.has_touch_screen = false
M.players = 1

function M.updateScore(score, player)
	M.score = M.score + math.floor(score)
end

function M.getScore()
	return M.score
end

function M.startGame()
	M.level = M.STARTING_LEVEL
	M.score = 0
	M.time_elapsed = 0
	M.speed = M.STARTING_SPEED
	M.sections = {'', '', ''}
	M.distance = 0
	M.state = M.STATE_WAIT
end

function M.update_time_elapsed(time)
	M.time_elapsed = M.time_elapsed + time
	return M.time_elapsed
end

function M.reset_level_duration()
	M.time_elapsed = M.time_elapsed - M.get_level_duration()
end

function M.get_level_duration()
	return M.LEVEL_DURATION[M.level]
end

function M.next_level()
	if M.level < M.MAX_LEVELS then
		M.level = M.level + 1
		M.speed = M.speed + M.SPEED_INCREMENT
	end

	return M.current_level()
end

function M.current_level()
	return M.level
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