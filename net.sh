#!/bin/bash

echo "Network Interfaces:"
ip -br addr
echo ""

echo "Ping Test to Google:"
ping -c 4 8.8.8.8
