return function()
	vim.g["conjure#filetype#rust"] = vim.v["false"]
	vim.g["conjure#filetype#python"] = vim.v["false"]
	vim.g["conjure#filetype#lua"] = vim.v["false"]
	vim.g["conjure#filetype#sql"] = vim.v["false"]
	-- Using CHICKEN scheme as my implementation
	vim.g["conjure#client#scheme#stdio#command"] = "csi -quiet -no-init -:c"
	vim.g["conjure#client#scheme#stdio#prompt_pattern"] = "\n-#;%d-> "
end
