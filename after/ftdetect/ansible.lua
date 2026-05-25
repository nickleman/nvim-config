vim.filetype.add({
  pattern = {
    [".*/[Aa]nsible/.*%.ya?ml"] = "yaml.ansible",
    [".*/tasks/.*%.ya?ml"] = "yaml.ansible",
    [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
    ["inventory.%.ya?ml"] = "yaml.ansible",
  },
})
