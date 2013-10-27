#!/bin/bash

# Purpose: Generate Object and run Automated test
# Author: Lek
# Created Date: 2013-10-09
# Updated Date: 2013-10-25: Refactor, add option 3,4, help


# Print out Menu Function
Menu(){
echo "----------------[`basename ${0}`]-------------------"
echo " USAGE $./Run.sh <option>          "
echo " <option> = "
echo " DEFAULT | VOID | ANY :: GENERATE -> CHECK -> RUN"
echo " 1:: RUN ONLY"
echo " 2:: GENERATE ONLY"
echo " 3:: CHECKELEMENT ONLY"
echo " 4:: GENERATE -> RUN"
echo ""
echo " h:: SHOW MENU"
echo "-------------------------------------------"
}

# Generate Object Function
Generate(){
    cd pageobjectdefinition
    ./GenAllPageObject.sh
    cd ../
    echo "GENERATE OBJECT(S): END"
}

# Run behave Function
Run(){
    #echo "ENTER RUN FUNCTION"
    behave --logging-level INFO --color --no-source --no-skipped    
}

# Check Element Function
Check(){
    python CheckElements.py 
}


# Main Command
Menu
OPTION="$1"

case "$OPTION" in

    1) Run
    ;;
    2) Generate
    ;;
    3) Check
    ;;
    4) Generate; Run
    ;;
    [hH] | help | HELP ) Menu
    ;;
    *) Generate; Check; Run
    ;;
esac




