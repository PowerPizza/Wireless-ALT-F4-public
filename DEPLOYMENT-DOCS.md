# Deployment Guide

This guide explains how to deploy the project on Render and how to build and host the payload file. No advanced programming knowledge is required, but you should be comfortable following step-by-step instructions.

---

# Requirements

Before starting, make sure you have:

* A computer with Windows installed
* A GitHub account
* A Render account

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
> **Note:** Make sure to copy or save your admin panel URL as it will be needed later.

---

# CDN-Repository Setup
It's not necessory to use github for payload deployment. You can use any cloud storage which allow to upload file and give permanent download url to the files.  
Github public repository is not best for this but it's enough for basic setup.

**Step 1:** Login into your github account.  
**Step 2:** Create a new public repository with anyname you like.  
**Step 3:** Note down the following information:-
* Github username  
* Repository name  
* Branch name (generally main)  

---

# Build the Payload & Deploy
**Step 1:** Download the latest *WAF4-Builder* from [here](https://github.com/PowerPizza/WAF4-Builder-Public/releases)  
**Step 2:** Follow WAF4-Builder [docs](https://github.com/PowerPizza/WAF4-Builder-Public/tree/main#waf4-builder)  
**Step 3:** Upload the files you just got in `output` directory from WAF4-Builder into the git repository created earlier.
