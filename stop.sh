#!/bin/bash

for d in $(docker ps -q ); do docker kill $d; done
