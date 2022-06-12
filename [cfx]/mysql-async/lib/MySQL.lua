MySQL = {
    Async = {},
    Sync = {},
}

local function safeParameters(params)
    if nil == params then
        return {[''] = ''}
    end

    assert(type(params) == "table", "A table is expected")
    assert(params[1] == nil, "Parameters should not be an array, but a map (key / value pair) instead")

    if next(params) == nil then
        return {[''] = ''}
    end

    return params
end

function MySQL.Sync.execute(query, params)
    assert(type(query) == "string", "The SQL Query must be a string")

    local res = 0
    local finishedQuery = false
    exports['mysql-async']:mysql_execute(query, safeParameters(params), function (result)
        res = result
        finishedQuery = true
    end)
    repeat Citizen.Wait(0) until finishedQuery == true
    return res
end

function MySQL.Sync.fetchAll(query, params)
    assert(type(query) == "string", "The SQL Query must be a string")

    local res = {}
    local finishedQuery = false
    exports['mysql-async']:mysql_fetch_all(query, safeParameters(params), function (result)
        res = result
        finishedQuery = true
    end)
    repeat Citizen.Wait(0) until finishedQuery == true
    return res
end

function MySQL.Sync.fetchScalar(query, params)
    assert(type(query) == "string", "The SQL Query must be a string")

    local res = ''
    local finishedQuery = false
    exports['mysql-async']:mysql_fetch_scalar(query, safeParameters(params), function (result)
        res = result
        finishedQuery = true
    end)
    repeat Citizen.Wait(0) until finishedQuery == true
    return res
end

function MySQL.Sync.insert(query, params)
    assert(type(query) == "string", "The SQL Query must be a string")

    local res = 0
    local finishedQuery = false
    exports['mysql-async']:mysql_insert(query, safeParameters(params), function (result)
        res = result
        finishedQuery = true
    end)
    repeat Citizen.Wait(0) until finishedQuery == true
    return res
end

function MySQL.Sync.transaction(querys, params)
    local res = 0
    local finishedQuery = false
    exports['mysql-async']:mysql_transaction(querys, params, function (result)
        res = result
        finishedQuery = true
    end)
    repeat Citizen.Wait(0) until finishedQuery == true
    return res
end

function MySQL.Async.execute(query, params, func)
    assert(type(query) == "string", "The SQL Query must be a string")

    exports['mysql-async']:mysql_execute(query, safeParameters(params), func)
end

function MySQL.Async.fetchAll(query, params, func)
    assert(type(query) == "string", "The SQL Query must be a string")

    exports['mysql-async']:mysql_fetch_all(query, safeParameters(params), func)
end

function MySQL.Async.fetchScalar(query, params, func)
    assert(type(query) == "string", "The SQL Query must be a string")

    exports['mysql-async']:mysql_fetch_scalar(query, safeParameters(params), func)
end

function MySQL.Async.insert(query, params, func)
    assert(type(query) == "string", "The SQL Query must be a string")

    exports['mysql-async']:mysql_insert(query, safeParameters(params), func)
end

function MySQL.Async.transaction(querys, params, func)
    return exports['mysql-async']:mysql_transaction(querys, params, func)
end

function MySQL.ready (callback)
    Citizen.CreateThread(function ()
        -- add some more error handling
        while GetResourceState('mysql-async') ~= 'started' do
            Citizen.Wait(0)
        end
        while not exports['mysql-async']:is_ready() do
            Citizen.Wait(0)
        end
        callback()
    end)
end
