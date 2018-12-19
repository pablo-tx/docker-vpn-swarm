#!/bin/sh

sleep 100
ping -c 1 8.8.8.8 -w 10 -q || halt -f

