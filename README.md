# 📦 Lightroom Classic Settings Backup & Restore Script

**Author**: [BeforeMyCompileFails](https://github.com/BeforeMyCompileFails)

This is a simple Windows `.bat` script to **backup and restore Lightroom Classic settings** — including presets, profiles, and preferences — using **WinRAR**.

---

## 🧰 Features

- ✅ One-click backup of Lightroom Classic settings to `.rar`
- ✅ Easy restore on a new PC
- ✅ Stores the archive in the same folder as the script
- ✅ Clean output and full compatibility with folder names that include spaces
- ✅ No need to include catalogs — keep those separate

---

## 📂 What Gets Backed Up

- `Lightroom` presets and preferences:  
  `C:\Users\<YourName>\AppData\Roaming\Adobe\Lightroom`
- `CameraRaw` presets and profiles:  
  `C:\Users\<YourName>\AppData\Roaming\Adobe\CameraRaw`

*Catalogs are not included by design (handle them manually if needed).*

---

## 🚀 Usage

### 1. 🖱️ Run the Script

Double-click the `LightroomTransfer.bat` file. You'll see this menu:

```
What do you want to do?
[1] Backup Lightroom Classic settings (create .rar)
[2] Restore to new PC (extract .rar)
```

Choose:

- `1` to create a `.rar` backup
- `2` to restore from an existing `.rar`

### 2. 📍 Backup Location

The backup `.rar` file will be created **in the same folder where the `.bat` script is run** (e.g., next to the script itself).

---

## 📦 Requirements

- 🪟 Windows
- ✅ [WinRAR installed](https://www.win-rar.com/download.html)
- 🔒 If WinRAR is not in your system `PATH`, the script uses the default path:
  ```
  C:\Program Files\WinRAR\WinRAR.exe
  ```

If you have WinRAR installed in a different location, update this line in the script:
```bat
"C:\Program Files\WinRAR\WinRAR.exe"
```

---

## 🛠️ Customization Ideas

- Add timestamped filenames for versioned backups
- Automatically open the backup folder after creation
- Include other Adobe apps (e.g., Photoshop, Bridge)
- Zip support instead of RAR if desired

---

## 🧑‍💻 License

Feel free to use, modify, or redistribute. A credit or star is always appreciated 😊
