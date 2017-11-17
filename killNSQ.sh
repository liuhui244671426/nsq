#!/bin/bash
ps aux|grep nsq|grep -v grep|awk '{print $2}'|xargs kill -9
