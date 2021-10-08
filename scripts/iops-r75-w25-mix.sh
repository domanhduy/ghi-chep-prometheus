#!/bin/bash

for i in 1
do
    fio --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=duy --filename=duy${i} --bs=4k --iodepth=64 --size=100G --readwrite=randrw --rwmixread=75
    echo 1 > /proc/sys/vm/drop_caches
    echo 2 > /proc/sys/vm/drop_caches
    echo 3 > /proc/sys/vm/drop_caches
    rm -rf duy${i}
done