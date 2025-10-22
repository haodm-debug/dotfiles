vim.opt.guicursor = {
  "n-v-c-sm:block", -- block in Normal, Visual, Cmd, Showmatch
  "i-ci-ve:ver25",  -- vertical bar (25% width) in Insert & Cmd‑line insert
  "r-cr-o:hor20",   -- horizontal bar (20% height) in Replace & Operator‑pending
}

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false
vim.opt.backup = false
vim.opt.swapfile = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.cmdheight = 1

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

vim.g.mousescroll = "ver:1,hor:2"

-- vim.opt.rtp:append("/opt/homebrew/opt/fzf")

local notify_original = vim.notify
vim.notify = function(msg, ...)
	if
		msg
		and (
			msg:match("position_encoding param is required")
			or msg:match("Defaulting to position encoding of the first client")
			or msg:match("multiple different client offset_encodings")
		)
	then
		return
	end
	return notify_original(msg, ...)
end
