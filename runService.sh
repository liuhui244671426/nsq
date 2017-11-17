#!/bin/bash
cd /Users/liuhui/go/src/github.com/nsqio/nsq/build
pwd
./nsqlookupd &
./nsqd --lookupd-tcp-address=127.0.0.1:4160 &
./nsqadmin --lookupd-http-address=127.0.0.1:4161 &
curl -d 'hello world 1' 'http://127.0.0.1:4151/pub?topic=test'
./nsq_to_file --topic=test --output-dir=/tmp --lookupd-http-address=127.0.0.1:4161 &
curl -d 'hello world 2' 'http://127.0.0.1:4151/pub?topic=test'
curl -d 'hello world 3' 'http://127.0.0.1:4151/pub?topic=test'

