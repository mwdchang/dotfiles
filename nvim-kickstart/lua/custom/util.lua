M = {}

function M.concat_paths(a, b)
  if a and b then
    return a .. ":" .. b
  elseif a then
    return a
  elseif b then
    return b
  else
    return ""
  end
end

return M
