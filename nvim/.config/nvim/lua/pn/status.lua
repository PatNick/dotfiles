local M = { }

M.line = function()
    local file_name = " %f"
    local modified = " %m"
    local align_right = "%="
    local file_encoding = " %{&fileencoding?&fileencoding:&encoding}"
    local file_format = " [%{&fileformat}]"
    local cursor = " %l:%c"
    local percentage = " %P"

    return string.format("%s%s%s%s%s%s%s", file_name, modified, align_right, file_encoding, file_format, cursor, percentage)
end

return M
