#!/bin/sh
export GI_TYPELIB_PATH=/usr/local/lib/girepository-1.0:$GI_TYPELIB_PATH
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
exec hyprpanel

