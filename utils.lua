function normalize_cwd(cwd_uri)
    if not cwd_uri then
        return wezterm.home_dir
    end
    local path = cwd_uri.file_path
    -- Windows: if path starts with '/' remove it
    if path:match("^/%a:") then
        path = path:sub(2)
    end
    return path
end
