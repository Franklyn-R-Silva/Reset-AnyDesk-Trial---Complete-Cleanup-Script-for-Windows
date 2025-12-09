# Reset AnyDesk Trial - Complete Cleanup Script for Windows

This batch script is designed to **completely remove AnyDesk from your Windows system**, including:

- Forced termination of AnyDesk processes (`AnyDesk.exe` and `ad.exe`)
- Deletion of AnyDesk data folders for all system users (`AppData\Roaming\AnyDesk`)
- Removal of the AnyDesk folder in `C:\ProgramData`
- Deletion of registry keys related to AnyDesk
- Removal of uninstall entries to attempt **renewal of the trial period**

### ⚠️ Warning

This script must be run with **administrator privileges** as it modifies system registry and protected files.

### 📌 Usage

1. Save the script content to a `.bat` file, for example: `reset_anydesk.bat`
2. **Right-click the file and select "Run as administrator"**
3. Wait for the script to finish and press any key to exit

### ❗ Important Notes

- Use responsibly. This script will permanently delete AnyDesk data and settings.
- Not recommended for production environments or without proper authorization.
- Some traces or licensing information may remain depending on AnyDesk updates or system configuration.
- Always back up important data before running cleanup scripts.

### 💡 Additional Information

- This script is intended for educational and recovery purposes only.
- For complete removal, ensure AnyDesk is not running before executing the script.
- If you encounter permission errors, verify you are running as an administrator.
