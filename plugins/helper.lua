local function get_table_keys(t)
    local arr = {}
    for key, _ in pairs(t) do
    	-- arr:insert(key)
        table.insert(arr, key)
    end
    return arr
end

return {
	get_table_keys = get_table_keys
}
