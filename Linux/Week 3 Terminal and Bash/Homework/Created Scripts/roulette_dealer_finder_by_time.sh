#!/bin/bash

awk '/^0X:00:00 XM/ {print $1,$2,$5,$6}' XXXX_Dealer_schedule
