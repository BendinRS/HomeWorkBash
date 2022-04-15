#!/bin/bash
sh ./scriptXip.sh > parse.txt
sh ./scriptYurl.sh >> parse.txt
sh ./error.sh >> parse.txt