#!/bin/bash
#Script para realizar un sort unico a un archivo index, se debe cambiar el dominio
grep -o '[A-Za-z0-9_\.-]*\.*cisco.com' index.html |sort -u
