# ALX Web Server Project

This project configures a web server with Nginx on Ubuntu, using automated Bash scripts as required by ALX.

## Tasks

### 0. Transfer a file to your server
- Bash script `0-transfer_file` transfers a file to a remote server's home directory using `scp`
- Disables strict host key checking
- Accepts 4 parameters: `PATH_TO_FILE`, `IP`, `USERNAME`, `PATH_TO_SSH_KEY`

### 1. Install nginx web server
- Bash script `1-install_nginx_web_server` installs Nginx on Ubuntu
- Nginx listens on port 80
- Configures root `/` to serve a page containing `Hello World!`

### 2. Setup a domain name
- Provided a `.tech` domain name
- Configured DNS A record to point the domain to the web server IP

### 3. Redirection
- Bash script `3-redirection` sets up a 301 permanent redirect
- Configures `/redirect_me` to redirect to `https://www.youtube.com/watch?v=QH2-TGUlwu4`

### 4. Not found page 404
- Bash script `4-not_found_page_404` sets up a custom 404 error page
- The page contains the string `Ceci n'est pas une page`
