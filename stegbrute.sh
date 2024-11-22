#!/bin/bash

# Function to display help instructions
show_help() {
  echo "Usage: ./stegbrute.sh -f <file> -w <wordlist> -o <output>"
  echo ""
  echo "Options:"
  echo "  -f    Specify the file to brute-force (image, gif, etc.)"
  echo "  -w    Specify the wordlist to use"
  echo "  -o    Specify the output file for extracted data"
  echo "  -h    Display this help message"
  echo ""
  echo "Example:"
  echo "  ./stegbrute.sh -f hidden_file.jpg -w wordlist.txt -o extracted_data.txt"
}

# Parse command-line arguments
while getopts ":f:w:o:h" option; do
  case $option in
    f) file=$OPTARG ;;
    w) wordlist=$OPTARG ;;
    o) output=$OPTARG ;;
    h) show_help; exit 0 ;;
    *) echo "Invalid option. Use -h for help."; exit 1 ;;
  esac
done

# Ensure all required arguments are provided
if [[ -z "$file" || -z "$wordlist" || -z "$output" ]]; then
  echo "Error: Missing required arguments."
  echo "Use -h for help."
  exit 1
fi

# Check if the specified files exist
if [[ ! -f "$file" ]]; then
  echo "Error: File '$file' does not exist."
  exit 1
fi

if [[ ! -f "$wordlist" ]]; then
  echo "Error: Wordlist '$wordlist' does not exist."
  exit 1
fi

# Start timer
start_time=$(date +%s)

# Perform the brute-force attack
echo "Starting brute-force attack on $file with wordlist $wordlist..."
while read -r password; do
  echo "Trying password: $password"
  steghide extract -sf "$file" -p "$password" -xf "$output" > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    end_time=$(date +%s)
    elapsed_time=$((end_time - start_time))
    echo "Password found: $password"
    echo "Extracted data saved to $output."
    echo "Time taken: $elapsed_time seconds."
    exit 0
  fi
done < "$wordlist"

# If no password is found
echo "Password not found in the wordlist."
exit 1
