#!/bin/bash
for a in `lpstat -p |awk '{print $2}' | grep '@'`
	do lpadmin -x $a
done