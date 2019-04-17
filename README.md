# SaaSiOS
SaaS iOS App (Version 5.0)

# Release Notes

## New Software Features

1. 'Connect Fitbit' button on the Settings Tab pulls Fitbit data for weight, activity, nutrition, heart rate, and sleep, into Firebase.

2. JSON Heart Rate data and Sleep Data buttons on the Data Tab (responsible for printing the respective data to console) were removed, as they are no longer necessary features.

3. 'Welcome [name]' message exists on the Studies screen, in place of the former 'My Studies' label.

## Bug Fixes

N/A

## Known Bugs

1. Double segue for Studies Tab exists when study participants log in (or are already logged in and simply start up the app) when they have already registered for studies.

## Known Defects

1. Data visualization on the Data Tab is missing.

2. A shortcut does not exist to log out of Fitbit; study participants must go to Safari web browser and log out through the Fitbit website.


# Install Guide

## Pre-requisites

Hardware: Mac
Software: Xcode 10 IDE

## Dependent Libraries

N/A

## Download Instructions

1. Run the following command in the terminal, in any directory: git clone https://github.com/amukund1/SaaSiOS.git.

2. Inside the repository, open up the SaaSiOS.xcworkspace file with Xcode.

3. Press the button with the triangle in it, which is located in the upper left hand corner of Xcode. The app will open up and run in another program called 'Simulator'.