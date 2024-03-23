#!/bin/bash

echo "This script will install the flutterfire CLI and configure it for your flutter project."

echo "Enter the flutter project path:"
read directory_path

# Check if the entered directory exists
if [ -d "$directory_path" ]; then
    echo "The directory '$directory_path' exists."

    cd $directory_path
else
    echo "The directory '$directory_path' does not exist."
fi

echo "Enter the path to the Flutter installed bin directory:"
read flutter_bin_path

# Check if the entered directory exists
if [ -d "$flutter_bin_path" ]; then
    echo "The directory '$flutter_bin_path' exists."

    # Update the PATH environment variable to include the Flutter bin directory
    export PATH="$flutter_bin_path/bin:$PATH"
    echo "Flutter bin directory added to PATH."
else
    echo "The directory '$flutter_bin_path' does not exist."
fi

curl -sL https://firebase.tools | bash

firebase login

export PATH="$PATH":"$HOME/.pub-cache/bin"

dart pub global activate flutterfire_cli  

flutterfire configure


