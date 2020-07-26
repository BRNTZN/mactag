#!/usr/bin/env python
# -*- coding: utf-8 -*-

import subprocess
import os
import openpyxl

from openpyxl import load_workbook

currentPath = os.path.dirname(os.path.realpath(__file__))
clearMetadataCommand = 'ls -l; xattr -rc .;'
tagMetadataName = 'com.apple.metadata:_kMDItemUserTags'
tagXmlTemplate = r"""'<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"><plist version="1.0"><array>{taglist}</array></plist>'""" 


clearMetadataOutput = subprocess.check_output(clearMetadataCommand, shell=True, cwd = currentPath)

print('Clearing metadata... \r'+ clearMetadataOutput)


workbook = load_workbook(currentPath + '/tags.xlsx')
sheet = workbook.active

for row in sheet.values:
	tags = ''
	xmlTags = ''
	fileName = str(row[0])
	if fileName != 'name file':
		for value in row[1:]:
			if value != None:
				tags += str(value) + ', '
				xmlTags += '<string>' + str(value) + '</string>'
		newMetadataValue = tagXmlTemplate.format(taglist = xmlTags)
		print(fileName + ': ' + tags)
		print(newMetadataValue)
		subprocess.check_output('xattr -w ' + tagMetadataName + ' ' + newMetadataValue + ' ' + fileName, shell=True, cwd = currentPath)


print('Finished')