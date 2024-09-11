#!/usr/bin/env bash 

file_name=../students.txt

# Create a file
rm "${file_name}"
touch "${file_name}"

# Loop until the user write cancel
while [[ $? -eq "0" ]]; do
    student_name=$(dialog --title "Important input" --inputbox "Please enter your message" 0 0 2>&1 >/dev/tty)
    
    if [[ $? -eq "1"  ]]; then
        exit;
    else
        echo "${student_name}" >> "${file_name}"
        # Display a yes/no dialog
        if ! dialog --yesno "Do you want to continue?" 0 0;then
            exit;
        fi
    fi

done