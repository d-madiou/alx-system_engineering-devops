# Task 0: Simple Web Stack - Answer File

## Infrastructure Design Summary
Designed a one-server web infrastructure for `www.foobar.com` with the following components:
- 1 Server (IP: 8.8.8.8)
- 1 Web Server (Nginx): Handles HTTP requests, serves static content, proxies dynamic requests.
- 1 Application Server: Processes dynamic content using the codebase.
- 1 Database (MySQL): Stores website data.
- 1 Set of Application Files: The codebase for the website.
- 1 Domain Name: `foobar.com` with `www` as an `A` record pointing to `8.8.8.8`.

## Specifics Explained
- **Server**: A system providing services over a network, hosting the website.
- **Domain Name Role**: Translates `www.foobar.com` to IP `8.8.8.8` for user access.
- **DNS Record Type**: `www` is an `A` record mapping to the server IP.
- **Web Server Role**: Manages HTTP traffic and serves content.
- **Application Server Role**: Executes application logic for dynamic content.
- **Database Role**: Manages data storage and retrieval.
- **Communication**: Uses HTTP/HTTPS over TCP/IP to interact with the user’s browser.

## Issues with Infrastructure
- **SPOF**: Single server failure results in complete downtime.
- **Maintenance Downtime**: Restarting services or deploying code causes unavailability.
- **Scaling Limitation**: Cannot handle high traffic without additional resources.

## Screenshot of Diagram
- https://imgur.com/a/KBGAQTr




## =========================================================================

# Task 1: Distributed Web Infrastructure - Answer File

## Infrastructure Design Summary
Designed a three-server web infrastructure for `www.foobar.com` with:
- 3 Servers: Server 1 and 2 (Web/App), Server 3 (Database).
- Web Servers (Nginx): On Server 1 and 2 for HTTP handling.
- Application Servers: On Server 1 and 2 for dynamic content.
- Load Balancer (HAproxy): Distributes traffic to Server 1 and 2.
- Application Files: On Server 1 and 2 for independent processing.
- Database (MySQL): Primary-Replica cluster on Server 3 for data reliability.

## Specifics Explained
- **Reasons for Additions**: Additional servers for redundancy; Nginx and Application Servers for distributed processing; HAproxy for traffic balancing; MySQL cluster for data scalability.
- **Load Balancer Algorithm**: Round Robin, distributing requests alternately to Server 1 and 2.
- **Active-Active Setup**: Both servers handle traffic simultaneously (vs. Active-Passive where one is idle).
- **Database Cluster**: Primary handles writes, Replica handles reads with data synced via replication.
- **Primary vs. Replica**: Application writes to Primary for consistency, reads from Replica for scalability.

## Issues with Infrastructure
- **SPOF**: Load balancer and Primary database node are critical failure points.
- **Security Issues**: No firewall or HTTPS, risking unauthorized access and data interception.
- **No Monitoring**: Lack of tools to detect performance or security issues.

## Screenshot of Diagram
- https://imgur.com/a/KBGAQTr


## ============================================================
# Task 2: Secured and Monitored Web Infrastructure - Answer File

## Infrastructure Design Summary
Designed a three-server infrastructure for `www.foobar.com` with:
- 3 Servers: 2 Web/App, 1 Database.
- Added: 3 Firewalls (1/server), 1 SSL Certificate (HTTPS via HAproxy), 3 Monitoring Clients (1/server).

## Specifics Explained
- **Reasons for Additions**: Firewalls for security, SSL for encryption, Monitoring Clients for performance tracking.
- **Firewalls**: Filter traffic to block unauthorized access.
- **HTTPS**: Encrypts data for privacy and trust.
- **Monitoring Purpose**: Detects issues via metrics/logs.
- **Data Collection**: Clients send logs/metrics to a central tool (e.g., Sumo Logic).
- **Monitor QPS**: Parse Nginx logs via monitoring client, set alerts for thresholds.

## Issues with Infrastructure
- **SSL Termination at Load Balancer**: Unencrypted internal traffic risks data exposure.
- **Single MySQL Write Server**: Primary node failure stops writes, needs failover.
- **Same Components on Servers**: Resource contention, harder to scale independently.

## Screenshot of Diagram
- https://imgur.com/a/KBGAQTr
