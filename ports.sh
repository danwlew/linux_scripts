#!/bin/bash

echo "Listening Ports:"
ss -tuln | awk 'NR>1 {print $1, $4}'
