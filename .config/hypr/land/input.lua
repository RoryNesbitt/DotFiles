-------------
--- INPUT ---
-------------

hl.config({
  input = {
    kb_layout    = "gb",
    kb_variant   = "",
    kb_model     = "",
    kb_options   = "",
    kb_rules     = "",

    follow_mouse = 1,
    sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification

    touchpad     = {
      natural_scroll = false,
    },
  },
})

-- 3-finger horizontal swipe to change workspace
hl.gesture({
  fingers   = 3,
  direction = "horizontal",
  action    = "workspace",
})

-- Per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/
hl.device({
  name        = "epic-mouse-v1",
  sensitivity = -0.5,
})
