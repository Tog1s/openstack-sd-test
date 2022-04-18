#!/bin/bash
cd ../terraform/workers
/usr/local/bin/terraform output -raw inventory > ../../ansible/inventory.ini
