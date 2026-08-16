
# Wireless-ALT-F4
Checkout deployment [docs](DEPLOYMENT-DOCS.md)

# Developer Notes
## 1
Admin panel (backend of WAF4) uses:  
```
gunicorn : 24.1.1
eventlet : 0.41.1
greenlet : <3.4.0
```
As production WSGI server since these are most compatable with server version.

## 2
To run backend server (admin panel) docker image locally checkout:
[WAF4-Backend-Docker-Image](https://hub.docker.com/r/scihack/waf4)

# License
This project is licensed under the [MIT License](LICENSE).

Copyright (c) 2025 Scihack/PowerPizza