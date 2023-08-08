-- Archivo: speed_boost.lua

local SPEED_BOOST_PERCENTAGE = 0.20 -- 20% de aumento en la velocidad
local SPEED_BOOST_STORAGE_KEY = 1001 -- Clave de almacenamiento para el beneficio

-- Función para aplicar el aumento de velocidad
local function applySpeedBoost(cid)
    local currentSpeed = getPlayerSpeed(cid)
    local speedBoost = currentSpeed * SPEED_BOOST_PERCENTAGE
    doChangeSpeed(cid, speedBoost)
end

-- Función para quitar el aumento de velocidad
local function removeSpeedBoost(cid)
    local currentSpeed = getPlayerSpeed(cid)
    local speedReduction = currentSpeed * SPEED_BOOST_PERCENTAGE
    doChangeSpeed(cid, -speedReduction)
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local cid = player:getId() -- Obtiene el ID del jugador
    applySpeedBoost(cid) -- Aplica el aumento de velocidad

    -- Marca que el jugador tiene el beneficio usando doSetStorage
    doSetStorage(cid, SPEED_BOOST_STORAGE_KEY, 1)

    doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "¡Has obtenido un aumento permanente del 20% en la velocidad!")

    doRemoveItem(item.uid, 1) -- Elimina 1 unidad del item del inventario
    return true
end

function onDeath(player, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
    local cid = player:getId()
    local hasSpeedBoost = doGetStorage(cid, SPEED_BOOST_STORAGE_KEY)
    if hasSpeedBoost == 1 then
        removeSpeedBoost(cid) -- Reduce la velocidad si tenía el beneficio
        doSetStorage(cid, SPEED_BOOST_STORAGE_KEY, 0) -- Marca que el jugador ya no tiene el beneficio
    end
end
