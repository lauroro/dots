return {
  'sainnhe/gruvbox-material',
	priority = 1000,
  config = function()
    vim.g.gruvbox_material_transparent_background = 1
    vim.cmd.colorscheme "gruvbox-material"
  end
}
