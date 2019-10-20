#!/bin/bash
#
# AWS/Computing Node Set-up for REvolution
#
# Ubuntu 18.04 LTS Server Instance
# Base AMI: ami-06d51e91cea0dac8d
# Instance: T2.large
# Storage: 20 Gb
#
# ssh -i <key.pem> ubuntu@DNS4

# Install software ----------------------------------------
sudo apt-get update

# Install R version 3.4.4 (2018-03-15)
sudo apt-get install r-base
sudo apt-get install r-cran-xml2
sudo apt-get install libssl-dev
sudo apt-get install libcurl4-openssl-dev

R
## in R install packages needed
# install.packages("devtools")
# install.packages("roxygen2")
# install.packages("ggplot2")
# install.packages("plotly")

# Install golly/bgolly (2.8)
# and dependencies
sudo apt-get install golly

# Install dependencies for compiling golly
sudo apt-get install libwxgtk3.0-dev
sudo apt-get install python2.7-dev

# Test compile the most recent version of golly
git clone https://git.code.sf.net/p/golly/code golly-code
cd golly-code/gui-wx/
make -f makefile-gtk
#   .golly-code/bgolly
#   This is bgolly 3.3

# Return Homenst
cd ~/

