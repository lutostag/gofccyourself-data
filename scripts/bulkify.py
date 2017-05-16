#!/usr/bin/env python3

import sys

counter = int(sys.argv[1])
for number, line in enumerate(sys.stdin.readlines()):
    print('{"create": {"_id":%d}}' % (counter + number))
    print(line.strip())
