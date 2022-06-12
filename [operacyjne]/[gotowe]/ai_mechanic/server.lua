Config = {}
Config.FixReward = 50
Config.MechanicOnline = 1

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function howmanymechanic(cb)
	local xPlayers = ESX.GetPlayers()
	local MechanicConnected = 0
	for i=1, #xPlayers, 1 do
	local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'mechanic' then
			MechanicConnected = MechanicConnected + 1
		end
	end
	cb(MechanicConnected)
end

RegisterServerEvent('ai_mechanic:carfix')
AddEventHandler('ai_mechanic:carfix', function(source)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local playerMoney = 0
    local societyAccount
    playerMoney = xPlayer.getAccount('bank').money

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mechanic',function(account)
        societyAccount = account
    end)

    if societyAccount  then
        local societyMoney
        howmanymechanic(function(MechanicConnected)
            if MechanicConnected < Config.MechanicOnline then
                if playerMoney >= Config.FixReward then
                    xPlayer.removeAccountMoney('bank', Config.FixReward)
                    societyAccount.addMoney(Config.FixReward)
                    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Pagaste 50€ pelo arranjo.' })
                    TriggerClientEvent('knb:mech', source)
                else
                    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Lamentamos mas como não tens dinheiro para pagar, não vamos ao local' })
                end
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Não podemos ir ao local, porque há mecânicos de serviço!'})
            end
        end)
    end

end)

TriggerEvent('es:addCommand', 'mechanic', function(source)
    TriggerEvent('ai_mechanic:carfix', source)
end)