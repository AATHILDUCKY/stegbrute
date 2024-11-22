# Stegbrute 

StegBrute is a simple Bash script designed to brute-force passwords for files encrypted using Steghide. It uses a wordlist to try potential passwords and extracts hidden data if the correct password is found. The script also tracks and displays the time taken to find the password.

## Features

- ### Supports wordlist-based password brute-forcing.
- ### Extracts hidden data from Steghide files.
- ### Easy-to-use command-line interface with helpful options.

## Requirements

```bash
sudo apt-get install steghide
```

## Usage
Change mode executable 
```bash
chmod +x stegbrute.sh
```
Help
```bash
./stegbrute.sh -h
```

How to use tool
```bash
./stegbrute.sh -f <file> -w <wordlist> -o <output>
```

## Output

- ### Password Found:
```bash
Password found: mysecretpassword
Extracted data saved to extracted_data.txt.
Time taken: 12 seconds.
```
- ### Password Not Found:
```bash
Password not found in the wordlist.
```

