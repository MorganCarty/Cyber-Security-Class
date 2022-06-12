#!/bin/bash

awk '/^05:00:00 AM/ {print $1,$2,$5,$6}' 0315_Dealer_schedule
awk '/^08:00:00 AM/ {print $1,$2,$5,$6}' 0315_Dealer_schedule
awk '/^02:00:00 PM/ {print $1,$2,$5,$6}' 0315_Dealer_schedule

