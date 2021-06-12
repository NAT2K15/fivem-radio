-- DO NOT TOUCH ANYTHING IN HERE. DOING SO CAN BREAK THE SCRIPT -- 

RegisterCommand('+RadioTalk', function()
	local ped = PlayerPedId()
	if DoesEntityExist(ped) and not IsEntityDead(ped) then
		if not IsPauseMenuActive() then 
			loadAnimDict("random@arrests")
			if not IsPlayerFreeAiming(PlayerId()) then 
				TaskPlayAnim(ped, "random@arrests", "generic_radio_enter", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0)
				SetEnableHandcuffs(ped, true)
			elseif IsPlayerFreeAiming(PlayerId()) then 
				TaskPlayAnim(ped, "random@arrests", "radio_chatter", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0)
				SetEnableHandcuffs(ped, true)
			end 
			if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests", "generic_radio_enter", 3) then
				DisableActions(ped)
			elseif IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests", "radio_chatter", 3) then
				DisableActions(ped)
			end
		end 
	end 
end)

RegisterCommand('-RadioTalk', function()	
	Citizen.Wait(10)
	local ped = PlayerPedId()
	if DoesEntityExist(ped) and not IsEntityDead(ped) then
		if not IsPauseMenuActive() then 
			ClearPedTasks(ped)
			SetEnableHandcuffs(ped, false)
		end
	end 
end)

RegisterKeyMapping('+RadioTalk', 'Radio Animation', 'keyboard', 'LMENU')

-- MAIN FUNCTIONS -- 
function DisableActions(ped)
	DisableControlAction(1, 140, true)
	DisableControlAction(1, 141, true)
	DisableControlAction(1, 142, true)
	DisableControlAction(1, 37, true)
	DisablePlayerFiring(ped, true) 
end

function loadAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		Citizen.Wait(0)
	end
end
