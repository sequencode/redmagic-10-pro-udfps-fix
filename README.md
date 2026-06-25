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

## Requirements

| | |
|---|---|
| Device | RedMagic 10 Pro (NX789J) |
| Root | APatch · KernelSU · Magisk |
| Tested on | Android 16 GSI (phh-treble) |

Flash via APatch / KernelSU / Magisk and reboot.
