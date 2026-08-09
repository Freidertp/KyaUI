# KyaUI

A complete interface setup for **Ascension / Conquest of Azeroth** (3.3.5a), built on ElvUI.

KyaUI is an **ElvUI plugin**. It does not draw a UI of its own — it adds a wizard that applies a
full ElvUI profile plus matching profiles for the other addons, so a fresh install goes from the
default UI to a finished layout without opening a single settings panel.

---

## Requirements

**ElvUI is a hard dependency and is not bundled here.** Install it from the *Addons* tab of the
Ascension Launcher — it ships version 7.x and keeps it updated. Without it KyaUI will not load at
all; the character screen will show it as a missing dependency.

The launcher installs `ElvUI_OptionsUI`, `ElvUI_AddOnSkins`, `ElvUI_Enhanced` and
`ElvUI_EnhancedFriendsList` alongside ElvUI, so those are not bundled either.

Optional, configured by the wizard if present: **DBM** and **WeakAuras** (both in the Ascension
catalog).

## What is in this repository

| Folder | Why it is here |
| --- | --- |
| `KyaUI` | The addon itself: the wizard, the profiles and the extras below. |
| `ElvUI_ProjectZidras` | Absorb prediction, role icons, heal prediction, chat icons. **Patched** for ElvUI 7.x. |
| `ElvUI_MicrobarEnhancement` | Symbols on the micro bar. **Patched** for ElvUI 7.x. |
| `ElvUI_DTBars2` | Extra datatext bars used by the layout. |
| `ElvUI_CustomTweaks` | Bag buttons and assorted tweaks the profile relies on. |
| `ElvUI_CustomTags` | Extra unitframe tags used by the profile. |
| `ElvUI_DataTextColors` | Per-datatext colouring. |
| `Skada`, `SkadaImprovement`, `SkadaStorage` | Damage meter. The wizard applies a profile to it. |
| `xCT+` | Combat text. The wizard applies a profile based on your role. |
| `BugSack`, `!BugGrabber` | Lua error viewer, so problems are visible instead of silent. |

The six `ElvUI_*` plugins are not in the Ascension catalog and the profile depends on them, which
is why they travel with KyaUI. Two of them carry patches for ElvUI 7.x — see the notes at the
bottom.

## The wizard

Type **`/kyaui`** (or `/kui`) at any time to open it. On a first install it opens on its own, and
KyaUI makes ElvUI skip its own installer so you do not have to click *Skip Process*.

Walk the pages in order and press **Finished** on the last one to apply everything and reload:

1. **CVars** — recommended client variables (nameplates, camera, autoloot).
2. **Apply KyaUI** — the ElvUI profile: unitframes, action bars, fonts, textures, and a custom
   defensive-cooldown aura filter.
3. **Theme** — *Class Colors* or *Dark Mode*.
4. **Chat** — arranges the chat windows by channel.
5. **xCT+** — pick **Healer** or **DPS/Tank**; healing and numbers are laid out differently.
6. **Skada** — applies the damage meter profile.
7. **DBM** — applies the boss mod profile, if DBM is installed.
8. **WeakAuras** — opens the WeakAuras import window so you can review before applying.

## Extras beyond the profile

These are small fixes for this client specifically, all inside the `KyaUI` addon:

**Nameplates.** `Ascension_NamePlates` draws its own HD nameplates that clash with ElvUI. KyaUI
turns the `useNewNameplates` CVar off on login and silences the *"Couldn't load
Ascension_NamePlates"* popup. The launcher re-enables the addon on every start, so this runs each
time you log in.

**Auction house — cancel several auctions at once.** The Blizzard *Auctions* tab gets a checkbox
on each row. Click them, or **Ctrl+click** a row to toggle one, or **Shift+click** for a range.
The existing *Cancel Auction* button then reads *Cancel Selected (N)*.
Note that the server only accepts **one cancellation per click**, so the button cancels one and
counts down — the selection survives in between.

**Auctionator dialogs.** Auctionator's confirmation windows do not capture the keyboard, so Enter
used to open the chat instead of confirming. KyaUI binds Enter and Escape to them while they are
on screen and releases the keys as soon as they close.

## Commands

| Command | What it does |
| --- | --- |
| `/kyaui` | Open the install wizard |
| `/kyaui reset` | Re-apply the ElvUI profile (restores the layout) |
| `/kyaui config` | Open the ElvUI config (`/ec`) |
| `/kyaui atr` | Diagnostics for Enter/Esc in Auctionator dialogs |
| `/kyaui atr auctions` | Diagnostics for the Auctions tab checkboxes |
| `/kyaui help` | List the commands |

## Notes

- **No class content.** No HoT bars, no personal WeakAuras — this is a clean base to build on.
- **Keybinds are per character** and are not part of the profile. Set your own.
- Designed for **1080p**. It works at other resolutions but positions were tuned at that size.
- Lua errors show up in **BugSack** (the icon on the minimap).
- The bundled plugins are patched for ElvUI 7.x and for this client. Do not replace them with
  upstream copies without checking: `ElvUI_MicrobarEnhancement` breaks on 7.x because the micro
  button list changed, and `ElvUI_ProjectZidras` ships without its nameplate module, which was
  written against ElvUI 6.09 and is native in 7.x.
