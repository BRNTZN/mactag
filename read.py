#!/usr/bin/env python
# -*- coding: utf-8 -*-

import subprocess
import os
import openpyxl

from openpyxl import load_workbook

currentPath = os.path.dirname(os.path.realpath(__file__))
workbook = load_workbook(currentPath + '\mactag.xlsx')
sheet = workbook.active

for row in sheet.values:
	tags = ''
	xmlTags = ''
	for value in row[1:]:
		if value != None:
			tags += str(value) + ', '
			xmlTags += '<string>' + str(value) + '</string>'
			
	print(str(row[0]) + ': ' + tags)
	print(xmlTags)