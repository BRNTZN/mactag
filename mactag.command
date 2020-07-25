#!/usr/bin/env python
# -*- coding: utf-8 -*-

import subprocess
import os
import openpyxl
import xattr

command = 'ls -l; xattr -l; xattr -rc .;'\
'xattr -w com.apple.metadata:_kMDItemUserTags '\
r"""'<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"><plist version="1.0"><array><string>tag1</string><string>Red</string></array></plist>' eiffel.jpg""" 

print(command)

output = subprocess.check_output(command, shell=True, cwd = os.path.dirname(os.path.realpath(__file__)))

print(output)
