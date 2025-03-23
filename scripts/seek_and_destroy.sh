#!/bin/bash

#===============================================================================
# Name:        seek_and_destroy.sh
# Description: A script that finds files with specific extensions and deletes them
#              based on user confirmation if certain conditions are met.
# Author:      zolegus <zolegus@gmail.com>
# Created:     2025-03-23
# License:     MIT
#
# Usage:       ./seek_and_destroy.sh <search_extension> <delete_extension>
#
# This script searches for pairs of files where one has the search_extension
# and the other has the delete_extension. If the file with delete_extension is
# not empty, the script asks for confirmation before deleting it.
#===============================================================================

# Check if two arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <search_extension> <delete_extension>"
    exit 1
fi

ext1=$1
ext2=$2

delete_all=0
found_count=0
deleted_count=0
total_size_freed=0

# Check if any matching files exist
file_count=$(ls -1 *.$ext2 2>/dev/null | wc -l)
if [ $file_count -eq 0 ]; then
    echo "No files with extension .$ext2 found"
    exit 0
fi

# Function to format file size in human-readable format
format_size() {
    local size=$1
    if [ $size -ge 1048576 ]; then
        echo "$(( size / 1048576 )) MB"
    elif [ $size -ge 1024 ]; then
        echo "$(( size / 1024 )) KB"
    else
        echo "$size bytes"
    fi
}

# Process each file with specified extension
for file in *.$ext2; do
    # Check if file exists and is not empty
    if [ -f "$file" ] && [ -s "$file" ]; then
        base=${file%.$ext2}
        # Check if corresponding file with first extension exists
        if [ -f "${base}.$ext1" ]; then
            # Get file sizes
            file_size=$(stat -f "%z" "$file")
            search_file_size=$(stat -f "%z" "${base}.$ext1")
            formatted_file_size=$(format_size $file_size)
            formatted_search_file_size=$(format_size $search_file_size)
            
            found_count=$((found_count + 1))
            
            echo "Found pair:"
            echo "- ${base}.$ext1 (size: $formatted_search_file_size)"
            echo "- $file (size: $formatted_file_size)"
            
            if [ $delete_all -eq 0 ]; then
                echo "Seek! Destroy?"
                echo "1) Skip"
                echo "2) Delete"
                echo "3) Delete all found"
                read -p "Your choice (1-3): " choice
                
                case $choice in
                    1)
                        continue
                        ;;
                    2)
                        rm -f "$file"
                        echo "File $file deleted (freed $formatted_file_size)"
                        deleted_count=$((deleted_count + 1))
                        total_size_freed=$((total_size_freed + file_size))
                        ;;
                    3)
                        delete_all=1
                        rm -f "$file"
                        echo "File $file deleted (freed $formatted_file_size)"
                        deleted_count=$((deleted_count + 1))
                        total_size_freed=$((total_size_freed + file_size))
                        ;;
                    *)
                        echo "Invalid choice. Skipping file."
                        continue
                        ;;
                esac
            else
                rm -f "$file"
                echo "File $file deleted (freed $formatted_file_size)"
                deleted_count=$((deleted_count + 1))
                total_size_freed=$((total_size_freed + file_size))
            fi
        fi
    fi
done

# Display statistics
if [ $found_count -eq 0 ]; then
    echo "No matching files found"
else
    formatted_total_freed=$(format_size $total_size_freed)
    echo ""
    echo "========================================"
    echo "              STATISTICS                "
    echo "========================================"
    echo "  Files found:    $found_count"
    echo "  Files deleted:  $deleted_count"
    echo "  Space freed:    $formatted_total_freed"
    echo "========================================"
fi

exit 0 