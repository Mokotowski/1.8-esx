ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('cmg2_animations:sync')
AddEventHandler('cmg2_animations:sync', function(target, animationLib,animationLib2, animation, animation2, distans, distans2, height,targetSrc,length,spin,controlFlagSrc,controlFlagTarget,animFlagTarget)
	TriggerClientEvent('cmg2_animations:syncTarget', targetSrc, source, animationLib2, animation2, distans, distans2, height, length,spin,controlFlagTarget,animFlagTarget)
	TriggerClientEvent('cmg2_animations:syncMe', source, animationLib, animation,length,controlFlagSrc,animFlagTarget)
end)

RegisterServerEvent('cmg2_animations:stop')
AddEventHandler('cmg2_animations:stop', function(targetSrc)
	TriggerClientEvent('cmg2_animations:cl_stop', targetSrc)
end)

RegisterServerEvent('arp_animacje:requestlift')
AddEventHandler('arp_animacje:requestlift', function(target)
	TriggerClientEvent('arp_animacje:requestlift', target, source)
end)

RegisterServerEvent('arp_animacje:answerlift')
AddEventHandler('arp_animacje:answerlift', function(sender, answer)
	TriggerClientEvent('arp_animacje:answerlift', sender, answer, source)
end)

RegisterServerEvent('arp_animacje:syncAccepted')
AddEventHandler('arp_animacje:syncAccepted', function(target, anim, anim2)
	local xPlayer = ESX.GetPlayerFromId(target)
	local xTarget = ESX.GetPlayerFromId(source)

	TriggerClientEvent('arp_animacje:playSynced', xPlayer.source, xTarget.source, anim, 'Requester')
	TriggerClientEvent('arp_animacje:playSynced', xTarget.source, xPlayer.source, anim, 'Accepter')
end)

RegisterServerEvent('arp_animacje:requestSynced')
AddEventHandler('arp_animacje:requestSynced', function(target, anim, anim2)
	print(anim, anim2)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xTarget = ESX.GetPlayerFromId(target)

	TriggerClientEvent('arp_animacje:syncAccepted', xTarget.source, xPlayer.source, anim, anim2)
	TriggerClientEvent('arp_animacje:syncRequest', xTarget.source, xPlayer.source, anim, anim2)
end)