#!/bin/sh

echo "Table: Topology"
echo "       MAC 1             MAC2       FINTO FINTO Costo"
/usr/sbin/batctl vd dot -TT -n -2 | grep label |tr -d \" | tr -d \] | tr -d \[ | tr -d \\-\> | tr -s = " " | sed -e 's/^[ \t]*//' | sed 's/label/1.000 1.000/' | sed 's/TT/1.000/' | sed 's/HNA/1.000/'
echo ""
echo ""
