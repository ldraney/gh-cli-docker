#!/bin/bash

# Function to process each file
process_file() {
    local file="$1"
    local indent="$2"
    
    # Skip if file is binary or not readable
    if [ ! -r "$file" ] || [ -d "$file" ] || file "$file" | grep -q "binary"; then
        return
    fi
    
    echo -e "\n${indent}=== Contents of: $file ==="
    echo "----------------------------------------"
    cat "$file"
    echo -e "----------------------------------------\n"
}

# Function to recursively explore directory
explore_directory() {
    local dir="$1"
    local indent="$2"
    
    # First show the tree structure
    tree "$dir"
    
    echo -e "\nFile Contents:"
    echo "=================="
    
    # Now process each file
    while IFS= read -r -d '' file; do
        process_file "$file" "$indent"
    done < <(find "$dir" -type f -print0)
}

# Check if directory argument is provided
DIR="${1:-.}"

# Check if tree command exists
if ! command -v tree &> /dev/null; then
    echo "Error: 'tree' command not found. Please install it first."
    exit 1
fi

# Execute the exploration
explore_directory "$DIR" ""
