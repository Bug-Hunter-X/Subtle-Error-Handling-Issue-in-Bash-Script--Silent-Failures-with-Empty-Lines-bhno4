#!/bin/bash

#Improved script with robust error handling

file_to_process="my_file.txt"

# Check if the file exists
if [ ! -f "$file_to_process" ]; then
  echo "Error: File '$file_to_process' not found."
  exit 1
fi

# Process the file with error handling for empty lines and other potential issues
while IFS= read -r line; do
  #Checking for empty line before processing
  if [[ -z "$line" ]]; then
    echo "Warning: Empty line encountered."
    continue # Skip empty lines
  fi
  processed_line=$(echo "$line" | awk '{print tolower($0)}')
  echo "$processed_line"
done < "$file_to_process" || {
  echo "Error: An error occurred during file processing."
  exit 1
}

exit 0