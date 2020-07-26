#!/usr/bin/env python
# -*- coding: utf-8 -*-

import subprocess
import os
import openpyxl
import xattr

from openpyxl import load_workbook

clearMetadataCommand = 'ls -l; xattr -rc .;'
tagMetadataName = 'com.apple.metadata:_kMDItemUserTags'
tagXmlTemplate = r"""'<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"><plist version="1.0"><array>{taglist}</array></plist>'""" 


clearMetadataOutput = subprocess.check_output(command, shell=True, cwd = os.path.dirname(os.path.realpath(__file__)))

print('Clearing metadata')
print(output)


workbook = load_workbook('mactag.xlsx')
sheet = workbook.active

for row in sheet.values:
	tags = ''
	xmlTags = ''
	fileName = str(row[0])
	for value in row[1:]:
		if value != None:
			tags += str(value) + ', '
			xmlTags += '<string>' + str(value) + '</string>'
	newMetadataValue = tagXmlTemplate.format(taglist = xmlTags)
	print(fileName + ': ' + tags)
	print(newMetadataValue)
	xattr.set(fileName, tagMetadataName, newMetadataValue)


print('Finished')