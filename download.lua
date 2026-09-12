local base = "https://raw.githubusercontent.com/norinorinoriri123-crypto/aiueo2/main/"

local function download(remoteName, localName)
  local url = base .. remoteName:gsub(" ", "%%20")
  local resp = http.get(url, nil, true)
  if resp then
    local f = fs.open(localName, "wb")
    f.write(resp.readAll())
    f.close()
    resp.close()
    print("OK: " .. localName)
    return true
  else
    print("FAILED: " .. localName)
    return false
  end
end

print("Downloading master file...")
download("anim_Bad Apple.mcanim", "anim_Bad Apple.mcanim")

print("Downloading 188 chunk files...")
for i = 0, 187 do
  local name = "anim_Bad Apple_" .. i .. ".canim"
  download(name, name)
end

print("Done!")