# OnlyForYou 
## Difficulty: Medium

## Enumeration

### NMAP SCAN

```
# Nmap 7.93 scan initiated Tue May 16 22:24:28 2023 as: nmap -vvv -p 22,80,4444,11111 -sC -sV -oN nmap/onlyforyou 10.10.11.210
Nmap scan report for 10.10.11.210
Host is up, received syn-ack (0.43s latency).
Scanned at 2023-05-16 22:24:29 IST for 27s

PORT      STATE SERVICE    REASON  VERSION
22/tcp    open  ssh        syn-ack OpenSSH 8.2p1 Ubuntu 4ubuntu0.5 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey:
|   3072 e883e0a9fd43df38198aaa35438411ec (RSA)
| ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDX7r34pmJ6U9KrHg0/WDdrofcOXqTr13Iix+3D5ChuYwY2fmqIBlfuDo0Cz0xLnb/jaT3ODuDtmAih6unQluWw3RAf03l/tHxXfvXlWBE3I7uDu+roHQM7+hyShn+559JweJlofiYKHjaErMp33DI22BjviMrCGabALgWALCwjqaV7Dt6ogSllj+09trFFwr2xzzrqhQVMdUdljle99R41Hzle7QTl4maonlUAdd2Ok41ACIu/N2G/iE61snOmAzYXGE8X6/7eqynhkC4AaWgV8h0CwLeCCMj4giBgOo6EvyJCBgoMp/wH/90U477WiJQZrjO9vgrh2/cjLDDowpKJDrDIcDWdh0aE42JVAWuu7IDrv0oKBLGlyznE1eZsX2u1FH8EGYXkl58GrmFbyIT83HsXjF1+rapAUtG0Zi9JskF/DPy5+1HDWJShfwhLsfqMuuyEdotL4Vzw8ZWCIQ4TVXMUwFfVkvf410tIFYEUaVk5f9pVVfYvQsCULQb+/uc=
|   256 83f235229b03860c16cfb3fa9f5acd08 (ECDSA)
| ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBAz/tMC3s/5jKIZRgBD078k7/6DY8NBXEE8ytGQd9DjIIvZdSpwyOzeLABxydMR79kDrMyX+vTP0VY5132jMo5w=
|   256 445f7aa377690a77789b04e09f11db80 (ED25519)
|_ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOqatISwZi/EOVbwqfFbhx22EEv6f+8YgmQFknTvg0wr
80/tcp    open  http       syn-ack nginx 1.18.0 (Ubuntu)
| http-methods:
|_  Supported Methods: GET HEAD POST OPTIONS
|_http-server-header: nginx/1.18.0 (Ubuntu)
|_http-title: Did not follow redirect to http://only4you.htb/
4444/tcp  open  tcpwrapped syn-ack
11111/tcp open  tcpwrapped syn-ack
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
# Nmap done at Tue May 16 22:24:56 2023 -- 1 IP address (1 host up) scanned in 27.30 seconds
```

- A website is running on the target which is redirecting to **only4you.htb**.

### Directory Fuzzing:


**Using Feroxbuster**:

**command**:

`feroxbuster -w /usr/share/seclists/Discovery/Web-Content/common.txt -u http://only4you.htb/ -k -x php,txt,html -o feroxbuster/feroxbuster_big.txt`

**output**:

```
200      GET        7l       27w     3309c http://only4you.htb/static/img/apple-touch-icon.png
200      GET        9l       23w      847c http://only4you.htb/static/img/favicon.png
200      GET      274l      604w     6492c http://only4you.htb/static/js/main.js
200      GET       13l      171w    16466c http://only4you.htb/static/vendor/swiper/swiper-bundle.min.css
200      GET        9l      155w     5417c http://only4you.htb/static/vendor/purecounter/purecounter_vanilla.js
200      GET        1l      313w    14690c http://only4you.htb/static/vendor/aos/aos.js
200      GET      112l      805w    65527c http://only4you.htb/static/img/team/team-3.jpg
200      GET        1l      218w    26053c http://only4you.htb/static/vendor/aos/aos.css
200      GET     1936l     3839w    34056c http://only4you.htb/static/css/style.css
200      GET       12l      557w    35445c http://only4you.htb/static/vendor/isotope-layout/isotope.pkgd.min.js
200      GET       96l      598w    48920c http://only4you.htb/static/img/team/team-4.jpg
200      GET       88l      408w    36465c http://only4you.htb/static/img/testimonials/testimonials-4.jpg
200      GET       90l      527w    40608c http://only4you.htb/static/img/testimonials/testimonials-5.jpg
200      GET      172l     1093w    87221c http://only4you.htb/static/img/team/team-2.jpg
200      GET       71l      380w    30729c http://only4you.htb/static/img/testimonials/testimonials-3.jpg
200      GET        1l      233w    13749c http://only4you.htb/static/vendor/glightbox/css/glightbox.min.css
200      GET      159l      946w    71778c http://only4you.htb/static/img/team/team-1.jpg
200      GET      244l     1332w   103224c http://only4you.htb/static/img/testimonials/testimonials-2.jpg
200      GET        1l      625w    55880c http://only4you.htb/static/vendor/glightbox/js/glightbox.min.js
200      GET      160l      818w    71959c http://only4you.htb/static/img/testimonials/testimonials-1.jpg
200      GET     1876l     9310w    88585c http://only4you.htb/static/vendor/bootstrap-icons/bootstrap-icons.css
200      GET        1l      133w    66571c http://only4you.htb/static/vendor/boxicons/css/boxicons.min.css
200      GET        7l     1225w    80457c http://only4you.htb/static/vendor/bootstrap/js/bootstrap.bundle.min.js
200      GET       14l     1683w   143281c http://only4you.htb/static/vendor/swiper/swiper-bundle.min.js
200      GET     2317l    11522w   110438c http://only4you.htb/static/vendor/remixicon/remixicon.css
200      GET        7l     2208w   195498c http://only4you.htb/static/vendor/bootstrap/css/bootstrap.min.css
200      GET      673l     2150w    34125c http://only4you.htb/
```

- Nothing Interesting from Directory Scans.

**Trying Subdomain Scanning using ffuf**:

**command**:

`ffuf -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt -u http://FUZZ.only4you.htb/ -mc all -o ffuf/ffuf.txt`

**output**

```
        /'___\  /'___\           /'___\
       /\ \__/ /\ \__/  __  __  /\ \__/
       \ \ ,__\\ \ ,__\/\ \/\ \ \ \ ,__\
        \ \ \_/ \ \ \_/\ \ \_\ \ \ \ \_/
         \ \_\   \ \_\  \ \____/  \ \_\
          \/_/    \/_/   \/___/    \/_/

       v2.0.0
________________________________________________

 :: Method           : GET
 :: URL              : http://FUZZ.only4you.htb/
 :: Wordlist         : FUZZ: /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt
 :: Output file      : ffuf/ffuf.txt
 :: File format      : json
 :: Follow redirects : false
 :: Calibration      : false
 :: Timeout          : 10
 :: Threads          : 40
 :: Matcher          : Response status: all
________________________________________________

[Status: 200, Size: 2191, Words: 370, Lines: 52, Duration: 827ms]
    * FUZZ: beta
```

- Found a subdomain **beta**, also we need to add it to our **/etc/hosts** first! and let's check it!


