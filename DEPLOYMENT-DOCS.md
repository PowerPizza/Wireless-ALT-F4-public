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

# Create URLs
Since using github for payload hosting so there need to create raw github urls pointing to payload and other files that will be uploaded in this directory in next section.

Why are these URLs needed? [checkout here](https://github.com/PowerPizza/WAF4-Builder-Public/tree/main#waf4-builder) 

Template : `https://raw.githubusercontent.com/<USERNAME>/<REPOSITORY>/<BRANCH>/<FILE_NAME>`

## Creating PAYLOAD_HOST_URL
Replace the placeholders of above template URL with appropite values as defiend in table below:
| Placeholder | Replace with |
| ----------- | ------------ |
| USERNAME | Your github username |
| REPOSITORY | Name of repository created in above section. |
| BRANCH | Name of branch of that repository (generally main) |
| FILE_NAME | payload.txt |

## Creating UPDATOR_HOST_URL
Replace the placeholders of above template URL with appropite values as defiend in table below:
| Placeholder | Replace with |
| ----------- | ------------ |
| USERNAME | Your github username |
| REPOSITORY | Name of repository created in above section. |
| BRANCH | Name of branch of that repository (generally main) |
| FILE_NAME | updator.txt |

> Note : As current latest version of WAF4-Builder is v1.1.0 which outputs payload.txt and updator.txt files that's why using payload.txt, updator.txt file names - In feature it may output files with different names so then we have to use those file names here, please check the release notes of WAF4-Builder.

## Creating Redirector File & REDIRECTOR_FILE_URL
**Note:** If you are certain that your admin panel URL will never change in feature or you have linked custom domain to your admin panel then you can skip this step.

**Step 1:** Create a new file in repository with the following content:  
```json
{
    "url": "<URL_OF_ADMIN_PANEL>"
}
```
**Step 2:** Save/Commit file in repository with name `servers.json`  
**Step 3:** Replace the placeholders of above template URL with appropite values as defiend in table below:
| Placeholder | Replace with |
| ----------- | ------------ |
| USERNAME | Your github username |
| REPOSITORY | Name of repository created in above section. |
| BRANCH | Name of branch of that repository (generally main) |
| FILE_NAME | servers.json |

### Now you will have 2 or 3 URLs as follows:
| Type | URL |
| ----- | ---- |
| PAYLOAD_HOST_URL | `https://raw.githubusercontent.com/<USERNAME>/<REPOSITORY>/<BRANCH>/payload.txt` |  
|UPDATOR_HOST_URL | `https://raw.githubusercontent.com/<USERNAME>/<REPOSITORY>/<BRANCH>/updator.txt` |
| (Optionally) REDIRECTOR_FILE_URL | `https://raw.githubusercontent.com/<USERNAME>/<REPOSITORY>/<BRANCH>/servers.json` |  

# Build the Payload & Deploy
**Step 1:** Download the latest *WAF4-Builder* from [here](https://github.com/PowerPizza/WAF4-Builder-Public/releases)  
**Step 2:** Follow WAF4-Builder [docs](https://github.com/PowerPizza/WAF4-Builder-Public/tree/main#waf4-builder)  
**Step 3:** Upload the files you just got in `output` directory from WAF4-Builder into the git repository created earlier.

# Test the payload
**Setp 1:** Go into output directory.  
**Step 2:** Rename `payload.txt` to `payload.exe`  
**Step 3:** Double click and run the payload.  
**Step 4:** Check at your deployed admin panel, your system should be available under target list.  
**Step 5:** To stop open task manager and end the payload.exe ask & optionally you can delete output directory.  

> Note: Recommended to turn of windows defender while testing your payload.