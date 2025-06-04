
<h1 align="center">🛡️ U Think AFK System</h1>
<p align="center">
  💤 Simple & configurable AFK detection system for FiveM servers
</p>

---

## 🚀 Features

- ⏳ Detects inactive (AFK) players
- ⚠️ Sends warning messages before kick
- ❌ Kicks players after configurable delay
- 🐞 Debug mode with manual AFK simulation
- 📡 Discord webhook logging support

---

## 🛠️ Installation

Follow these steps to install and set up the AFK system on your FiveM server:

### 1️⃣ Download the Script

Clone the repository into your `resources` folder:

```bash
cd resources
git clone https://github.com/uthinkeD/uthink_afk
```

> Or [download the ZIP](https://github.com/uthinkeD/uthink_afk/archive/refs/heads/main.zip) and extract it manually into the `resources` folder.

---

### 2️⃣ Add to `server.cfg`

In your `server.cfg`, add the following line:

```cfg
ensure uthink_afk
```

Make sure the folder name matches the name used in `ensure`.

---

### 3️⃣ Configure the Script

Open the `config.lua` file and edit the values as needed:

```lua
Config = {}

Config.AFKWarningMinutes = 3 -- ⏱ Time (in minutes) before showing AFK warning
 
Config.KickDelaySeconds = 2 -- ⌛ Time (in seconds) after warning before kicking the player
 
Config.DebugAFK = true -- 🐞 Debug mode (true = enables console debug info and allows manual AFK test command)
Config.AFKCommand = "forceafk" -- 💬 Command used to manually trigger AFK test (only works when DebugAFK is set to true)
Config.Webhook = "https://discord.com/api/webhooks/..." -- Your Discord webhook URL for sending AFK log messages (enter, leave, kick, afkcommand)
Config.WarningMessage = "You have been marked as AFK. If you don't move, you will be kicked." -- ⚠️ Message shown to player when AFK warning is triggered

Config.KickReason = "You were AFK for too long." -- ❌ Reason shown to player when they are kicked





```

> ⚠️ `AFKCommand` only works when `DebugAFK` is set to `true`. It's intended for testing and development purposes.

---

## 🧪 Debug Mode

Set `Config.DebugAFK = true` in `config.lua` to enable:

- 🖥️ Debug logs in the console  
- 💬 Ability to run a manual AFK test using the `/forceafk` command (or your custom `AFKCommand`)

---



## 📄 License

This script is open source and free to use. Modification is allowed.

❌ Reselling is strictly prohibited.

---

## 🆘 Support & Help
If you need help setting up or customizing the stash system, feel free to:

💬 Open an [issue](https://github.com/uthinkeD/uthink_afk/issues) on GitHub

📩 Contact me directly on Discord: u_think.

I'll try to respond as soon as possible!"
