-- Archivo: health_mana_boost.lua

local HEALTH_BOOST_AMOUNT = 200 -- Cantidad de aumento de salud
local MANA_BOOST_AMOUNT = 200 -- Cantidad de aumento de maná

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local cid = player:getId() -- Obtiene el ID del jugador

    local currentHealth = getCreatureHealth(cid)
    local currentMana = getCreatureMana(cid)

    -- Aumenta la salud y el maná del jugador
    setCreatureMaxHealth(cid, currentHealth + HEALTH_BOOST_AMOUNT)
    setCreatureMaxMana(cid, currentMana + MANA_BOOST_AMOUNT)

    doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "¡Has obtenido un aumento permanente de 200 HP y 200 MP!")

    doRemoveItem(item.uid, 1) -- Elimina 1 unidad del item del inventario
    return true
end
