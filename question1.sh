 #!/bin/bash
 
 #This function searches for the files with .txt extension and copy them to modified directory
 
 searchAndCopy(){
    local dir="$1"
    local modifiedDir="$2"
    
    # for loop which check each file present in the directory
    for file in "$dir"/*; do
        if [[ -d "$file" ]]; then
           # if the file is a directory ,recursively search within it
           searchAndCopy "$file" "$modifiedDir"
        elif [[ -f "$file" && "${file##*.}" == "txt" ]]; then
           # if the file is a normal file and has .txt extension,copy it to the modified directory
           cp "$file" "$modifiedDir/$(basename "${file%.*}").bak"
        fi
        
     done
           
}

#read the current working directory
  read -p "Enter the Current Working Directory: " cwd

# creating modified directory
  modifiedDir="${cwd}/modified"
  mkdir -p "$modifiedDir"

# call the function copyAndSearch funcntion with the current directory as the input
  searchAndCopy "$cwd" "$modifiedDir"
 
  echo "Files having .txt extension have been successfully copied to the modified directory with .bak extension"           
     
