# Appointment (HTB, Starting Point)

## Enumeration
### Checking Connecting

### Ping

![img01](screenshots/img01.png)

- The connectivity is fine, let's dig into the NMAP

### NMAP

![img02](screenshots/img03.png)

- Found that **Apache httpd 2.4.38** service is running on Port **80**.

### On Browser

![img03](screenshots/img04.png)

- We get a login page and also we've tried bunch of common username and passwords there! Nothing works.

### Gobuster

![img04](screenshots/img02.png)

- From the above output we've found that this is a PHP Website.

- Let's try to check if the website is vulnerable to SQL Injection.

### Entering Malicious Input.

```
username: admin'#
password: AnythingUwant
```

![img05](screenshots/img05.png)

- Looks like the Web is Vulnerable to SQL Injection.

**DONE**
