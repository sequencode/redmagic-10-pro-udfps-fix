# RedMagic 10 Pro GSI — UDFPS Fix

APatch / KernelSU / Magisk module for the **RedMagic 10 Pro (NX789J)**.

Makes the Goodix optical under-display fingerprint sensor work on phh-treble GSIs,
where it is otherwise completely non-functional. Supports both enroll and unlock,
including at low brightness.

## What it does

- Sets `virtual_sensors_are_real` early at boot so the framework uses the native
  capture trigger instead of a virtual sensor path.
- Runs a root daemon (`ZteFodDaemon`) that handles the ZTE cmd10 wake-capture
  handshake with HAL-death recovery and auto-restart.
- Applies a local brightness overlay during scanning: full-screen alpha mask with
  the background dimmed to match display brightness and a white circle over the sensor.
- Enables Panel HBM (`lcd_hbm`) under the mask only, with a suppressor to prevent
  flash on finger-down / finger-up and an anti-stuck guard.
- Marks the brightness mask as a trusted overlay so it doesn't obscure the
  keyguard — the rest of the lockscreen stays fully touchable while scanning.

## Requirements

| | |
|---|---|
| Device | RedMagic 10 Pro (NX789J) |
| Root | APatch · KernelSU · Magisk |
| Tested on | Android 16 GSI (phh-treble) |

Flash via APatch / KernelSU / Magisk and reboot.

**[Download latest release](https://github.com/sequencode/redmagic-10-pro-udfps-fix/releases/latest)**

## Related

Other RedMagic 10 Pro GSI fixes:

- [Bluetooth A2DP Fix](https://github.com/sequencode/redmagic-10-pro-bt-fix) — gets media routing to a wireless headset
- [In-Call Audio Fix](https://github.com/sequencode/redmagic-10-pro-call-fix) — restores mic and earpiece during phone calls
