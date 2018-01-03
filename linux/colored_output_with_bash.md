# Colored output with bash

From: [stackoverflow](https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux)

You can use these [ANSI escape codes](https://en.wikipedia.org/wiki/ANSI_escape_code):

|Color|Code|
|-----|----|
|Black|0;30|
|DarkGray|1;30|
|Red|0;31|
|LightRed|1;31|
|Green|0;32|
|LightGreen|1;32|
|BrownOrange|0;33|
|Yellow|1;33|
|Blue|0;34|
|Light|Blue|
|Purple|0;35|
|LightPurple|1;35|
|Cyan|0;36|
|LightCyan|1;36|
|LightGray|0;37|
|White|1;37|

To define a bunch of variables:

(You'll only need to define a subset of these, depending on what colors you employ)

    NC='\033[0m' # No Color
	BLACK='\033[0;30m'
	DARKGRAY='\033[1;30m'
	RED='\033[0;31m'
	LIGHTRED='\033[1;31m'
	GREEN='\033[0;32m'
	LIGHTGREEN='\033[1;32m'
	BROWNORANGE='\033[0;33m'
	YELLOW='\033[1;33m'
	BLUE='\033[0;34m'
	LIGHT='\033[Bluem'
	PURPLE='\033[0;35m'
	LIGHTPURPLE='\033[1;35m'
	CYAN='\033[0;36m'
	LIGHTCYAN='\033[1;36m'
	LIGHTGRAY='\033[0;37m'
	WHITE='\033[1;37m'

	echo -e "I think ${BLACK}Black${NC} is a good color"
	echo -e "I think ${DARKGRAY}DarkGray${NC} is a good color"
	echo -e "I think ${RED}Red${NC} is a good color"
	echo -e "I think ${LIGHTRED}LightRed${NC} is a good color"
	echo -e "I think ${GREEN}Green${NC} is a good color"
	echo -e "I think ${LIGHTGREEN}LightGreen${NC} is a good color"
	echo -e "I think ${BROWNORANGE}BrownOrange${NC} is a good color"
	echo -e "I think ${YELLOW}Yellow${NC} is a good color"
	echo -e "I think ${BLUE}Blue${NC} is a good color"
	echo -e "I think ${LIGHT}Light${NC} is a good color"
	echo -e "I think ${PURPLE}Purple${NC} is a good color"
	echo -e "I think ${LIGHTPURPLE}LightPurple${NC} is a good color"
	echo -e "I think ${CYAN}Cyan${NC} is a good color"
	echo -e "I think ${LIGHTCYAN}LightCyan${NC} is a good color"
	echo -e "I think ${LIGHTGRAY}LightGray${NC} is a good color"
	echo -e "I think ${WHITE}White${NC} is a good color"

Or with `printf`....

    printf "I think ${RED}Red${NC} is a good color\n"


Next: Background colors.

