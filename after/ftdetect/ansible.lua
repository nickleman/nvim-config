vim.filetype.add({
  pattern = {
    [".*/[Aa]nsible/.*%.ya?ml"] = "yaml.ansible",
    [".*/tasks/.*%.ya?ml"] = "yaml.ansible",
    [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
    -- NOTE: the '.' between 'inventory' and the extension must be escaped as '%.';
    --  a bare '.' is a Lua any-char class, which matched 'inventoryX.yaml' but not
    --  'inventory.yaml'.
    [".*/inventory%.ya?ml"] = "yaml.ansible",
  },
})
