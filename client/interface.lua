function OpenNui(arg, data)
  SendNUIMessage({
      action = 'openGameMenu',
      data = 'money'
    })
  SetNuiFocus(false, false)
  SendNUIMessage({
    action = 'setVisible',
    data = arg
  })
end

function CloseNui(arg)
  SetNuiFocus(arg, arg)
  SendNUIMessage({
    action = 'setVisible',
    data = arg
  })
end

RegisterNUICallback('hideFrame', function(_, cb)
  CloseNui(false)
  cb({})
end)

RegisterNetEvent('updateRewardNui', function(time, rewardname, itemname)  
    local countdown = {
      time = time,
      rewardname = rewardname,
      collectionable = Config.Translation["receive_reward"],
      cantcollect = Config.Translation["cant_collect"],
      itemname = itemname
    }
    SetNuiFocus(false, false)
    SendNUIMessage({
      action = 'updateTime',
      data = countdown
    })
end)

RegisterNetEvent("deluxe-handle-ox-notifications-reward", function(title, msg, duration)
	lib.notify({
		title = title,
		description = msg,
		position = Config.OxAlignNotifications,
		duration = duration,
		style = {
			backgroundColor = '#141517',
			color = '#C1C2C5',
			['.description'] = {
			  color = '#909296'
			}
		},
		icon = 'circle-check',
		iconColor = '#51CF66'
	})
end)
