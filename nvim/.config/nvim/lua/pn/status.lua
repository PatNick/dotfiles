local M = { }


M.line = function()
    local function git_branch()
        local branch = vim.fn.system("git rev-parse --abbrev-ref @ 2>/dev/null | tr -d '\n'")
        if string.len(branch) > 0 then
            return branch
        else
            return ""
        end
    end

    local branch = git_branch()
	local file_name = " %f"
	local modified = " %m"
	local align_right = "%="
    local file_encoding = " %{&fileencoding?&fileencoding:&encoding}"
    local file_format = " [%{&fileformat}]"
	local cursor = " %l:%c"
	local percentage = " %P"

	return string.format("%s %s%s%s%s%s%s%s", branch, file_name, modified, align_right, file_encoding, file_format, cursor, percentage)
end

return M
