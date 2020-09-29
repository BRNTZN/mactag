#!/usr/bin/env python
# -*- coding: utf-8 -*-

import subprocess
import os
import openpyxl
import xattr
import biplist

from openpyxl import load_workbook

currentPath = os.path.dirname(os.path.realpath(__file__))
clearMetadataCommand = 'ls -l; xattr -rc .;'
tagXmlTemplate = r"""'<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"><plist version="1.0"><array>{taglist}</array></plist>'""" 


clearMetadataOutput = subprocess.check_output(clearMetadataCommand, shell=True, cwd = currentPath)

print('Clearing metadata... \r'+ clearMetadataOutput)


workbook = load_workbook(currentPath + '/tags.xlsx')
sheet = workbook.active


print os.path.abspath(__file__)

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
		for metadataName in ['com.apple.metadata:_kMDItemUserTags', 'com.apple.metadata:kMDItemOMUserTags', 'com.apple.metadata:kMDItemFinderComment']:
			bpl_tags = biplist.writePlistToString(row[1:])
			xattr.setxattr(os.path.dirname(os.path.realpath(__file__)) + '/' + fileName, metadataName, bpl_tags)

print('Finished')