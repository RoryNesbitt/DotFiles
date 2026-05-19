------------------------
--- Monitor Settings ---
------------------------

-- Fallback: any unspecified monitor gets preferred mode, auto position
hl.monitor({
  output   = "",
  mode     = "preferred",
  position = "auto",
  scale    = "auto",
})

hl.monitor({
  output   = "DP-1",
  mode     = "preferred",
  position = "1920x0",
  scale    = "auto",
})

hl.monitor({
  output   = "HDMI-A-1",
  mode     = "preferred",
  position = "0x0",
  scale    = "auto",
})

hl.monitor({
  output    = "HDMI-A-2",
  mode      = "preferred",
  position  = "4480x-450",
  scale     = "auto",
  transform = 3,
})

hl.config({
  xwayland = {
    force_zero_scaling = true,
  },
})
