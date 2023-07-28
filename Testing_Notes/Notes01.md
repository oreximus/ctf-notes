# Methodologies Notes from CTFs!

## From OnlyForYou HTB Machine

## Difficulty Level: Medium

## Notes:

- Using curl to view the data into the terminal at the moment! We can send our modified request through it's present options.

**Example**:

- for checking the nginx.conf file through this LFI vulnerability:

```
curl -s -X POST http://beta.only4you.htb/download -d "image=/etc/nginx/nginx.conf"
```

### Enumeration Tips

- Check for the locally running services, learn about them and also make a good grasp on port forwarding like concepts.

**take look at** ***chisel*** a good tool can be used for port forwarding stuffs:
    - https://exploit-notes.hdks.org/exploit/network/port-forwarding/port-forwarding-with-chisel/
    - https://github.com/jpillora/chisel


