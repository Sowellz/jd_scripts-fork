#!/bin/sh
git clone https://github.com.cnpmjs.org/smiek2221/scripts.git
cd scripts
ls |grep -v "md"|xargs -I {} cp -rf {} ../