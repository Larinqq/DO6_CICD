#!/bin/bash

if ! scp src/build/s21_cat ganisrum@192.168.1.201:/usr/local/bin; then
    echo "Failed to copy s21_cat"
    exit 1
fi


if ! scp src/build/s21_grep ganisrum@192.168.1.201:/usr/local/bin; then
    echo "Failed to copy s21_grep"
    exit 1
fi

echo "Deploy completed successfully"