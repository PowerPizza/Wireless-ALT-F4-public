# Deployment Guide

This guide explains how to deploy the project on Render and how to build and host the payload file. No advanced programming knowledge is required, but you should be comfortable following step-by-step instructions.

---

# Requirements

Before starting, make sure you have:

* A computer with Windows installed
* A GitHub account
* A Render account
* Python installed
* Pip installed and working

To verify Python and Pip are installed:

1. Open **Command Prompt**.
2. Run:

```bash
python --version
```

You should see a Python version number.

3. Run:

```bash
pip --version
```

You should see a Pip version number.

If either command fails, install Python from https://python.org and ensure the **"Add Python to PATH"** option is enabled during installation.

---

# Deploy WAF4-Web Server (admin panel)
**Step 1:** Sigin in to your render account at render.com  
**Step 2:** On dashboard select **Web Service**  
**Step 3:** Select *Existing Image*.  
**Step 4:** In image URL enter `scihack/waf4:v1.0.0` or whatever the current latest version available at the time of deployment. (Check [waf4-versions](https://hub.docker.com/repository/docker/scihack/waf4/tags))  
**Step 5:** Click connect
**Step 6:** In `Name` field fill any name of your server just note that the name will become part of your web-server's URL.  
**Step 7:** Select `Free Instance` type.  
**Step 8:** Under environment variables set the following:-
```
APP_USERNAME=USER_NAME
APP_PASSWORD=PASSWORD
APP_SECRET_KEY=ANY_UUID
```
* Replace USER_NAME with a username of your choice.
* Replace PASSWORD with any strong password.
* Replace ANY_UUID with a uuid that can be obtained from [uuid generator](https://www.uuidgenerator.net/)

**Step 9:** Click Deploy web service.

It can take 5-10min for deployment. Try visiting your render web-server URL to check if admin panel is deployed.

---

# Build the Payload

# Payload Deployment
It's not necessory to use github for payload deployment. You can use any cloud storage which allow to upload file and give permanent download url to the files.  
Github public repository is not best for this but it's enough for basic setup.

### To deploy payload using github follow along:-  
**Step 1:** Login into your github account.  
**Step 2:** Create a new public repository.  
**Step 2:** Upload `payload.txt`, `updator.txt` and `servers.json` into the repository.  
