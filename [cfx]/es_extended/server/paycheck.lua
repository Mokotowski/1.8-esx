function StartPayCheck()
	CreateThread(function()
		while true do
			Wait(Config.PaycheckInterval)
			local xPlayers = ESX.GetExtendedPlayers()
			for _, xPlayer in pairs(xPlayers) do
				local job     = xPlayer.job.grade_name
                local onDuty  = xPlayer.job.onDuty
				local salary  = xPlayer.job.grade_salary
				local label = xPlayer.job.grade_label
				if salary > 0 then
					if job == 'unemployed' then -- unemployed
						xPlayer.addAccountMoney('bank', salary)
						TriggerClientEvent('dopeNotify2:Alert',  xPlayer.source, "Bank", 'Otrzymales wyplate z '.. label ..': '.. salary..'$ ', 10000, 'info')
					elseif Config.EnableSocietyPayouts then -- possibly a society
						TriggerEvent('esx_society:getSociety', xPlayer.job.name, function (society)
							if society ~= nil then -- verified society
								TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function (account)
									if account.money >= salary then -- does the society money to pay its employees?
										xPlayer.addAccountMoney('bank', salary)
										account.removeMoney(salary)
		
										TriggerClientEvent('dopeNotify2:Alert',  xPlayer.source, "Bank", 'Otrzymales wyplate z '.. label ..': '.. salary..'$ ', 5000, 'info')
									else
										TriggerClientEvent('dopeNotify2:Alert',  xPlayer.source, "Bank", 'Otrzymales wyplate z '.. label ..': '.. salary..'$ ', 5000, 'info')
									end
								end)
							else -- not a society
								xPlayer.addAccountMoney('bank', salary)
								TriggerClientEvent('dopeNotify2:Alert',  xPlayer.source, "Bank", 'Otrzymales wyplate z '.. label ..': '.. salary..'$ ', 5000, 'info')
							end
						end)
					else -- generic job
						xPlayer.addAccountMoney('bank', salary)
						TriggerClientEvent('dopeNotify2:Alert',  xPlayer.source, "Bank", 'Otrzymales wyplate z '.. label ..': '.. salary..'$ ', 5000, 'info')
	
					end
				end
			end
		end
	end)
end
