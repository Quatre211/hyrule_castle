#!/bin/bash
#----------------------------PLAYERS DATA FUNCTION-----------------------------------
pars_players1()
{
#Récupération de la ligne dans le fichier csv
  link_player=`sed -n 2p players.csv`
#Récupération des variables
    name=$(echo $link_player | cut -d"," -f2)
    hp=$(echo $link_player | cut -d"," -f3)
    str=$(echo $link_player | cut -d"," -f5)
    def=$(echo $link_player | cut -d"," -f7)
}

#----------------------------ENEMIES DATA FUNCTION-----------------------------
pars_enemies1()
{
#Récupération de la ligne dans le fichier csv
    enemies=`sed -n $((2 + $RANDOM % 13))p enemies.csv`
#Récupération des variables
    name_enemies=$(echo $enemies | cut -d"," -f2)
    hp_enemies=$(echo $enemies | cut -d"," -f3)
    str_enemies=$(echo $enemies | cut -d"," -f5)
    def_enemies=$(echo $enemies | cut -d"," -f7)
}
#---------------------------BOSSES DATA FUNCTION---------------------------------
pars_bosses1()
{
#Récupération de la ligne dans le fichier csv
    ganon_boss=`sed -n $((2 + $RANDOM % 7))p bosses.csv`
#Récupération des variables
    name_boss=$(echo $ganon_boss | cut -d"," -f2)
    hp_boss=$(echo $ganon_boss | cut -d"," -f3)
    str_boss=$(echo $ganon_boss | cut -d"," -f5)
    def_boss=$(echo $ganon_boss | cut -d"," -f4)
}
#-----------------------CALL PARS FUNCTION--------------------------------
pars_players1
pars_bosses1

#-----------------------------TAKE OF VARIABLE PLAYER DATA FUNCTION-------------------
nb_fight=1
player_name=$name
player_hp=$hp
player_hp_left=$hp
player_str=$str
player_def=$def

#-----------------------------TAKE OF VARIABLE BOSSE DATA FUNCTION-------------------
boss_name=$name_boss
boss_hp=$hp_boss
boss_hp_left=$hp_boss
boss_str=$str_boss
boss_def=$def_boss

m_loop=0
#-----------------------------WIN/LOSE NARRATION-----------------------
DEFILE() {
    sleep 1
}
DEFILE2() {
    sleep 0.5
}

PROPRE() {
        echo "
---------------------
"
}

START() {
echo "
------ START --------
"
}

WAIT(){
        echo "
                    
"
}

YOU_WIN() {
    DEFILE
    PROPRE
    echo -e "\e[32mYou finally defeated" $boss_name"\e[39m"
    PROPRE
    DEFILE2
    WAIT
    DEFILE2
    WAIT
    DEFILE2
    WAIT
    DEFILE
    PROPRE
    echo "But deep inside you, you know that your adventure is not finished yet."
    PROPRE
}

YOU_LOSE() {
    DEFILE
    PROPRE
    echo -e "\e[31mYou lost...\e[39m"
    PROPRE
    DEFILE2
    WAIT
    DEFILE2
    WAIT
    DEFILE2
    WAIT
    DEFILE
    PROPRE
    DEFILE
    echo -e "\e[36mAre you dead ? Or just not breathing ?\e[39m"
    DEFILE
    PROPRE
}

THE_END() {
    DEFILE
    PROPRE
    echo "   THE END !!"
    DEFILE2
    WAIT
    DEFILE2
    WAIT
    DEFILE
    PROPRE
    echo -e "\e[36mSee you next time !\e[39m"
    PROPRE
}

LOGO() {
    echo -e "\e[93m
                                     /@
                     __        __   /\/
                    /==\      /  \_/\/
                  /======\    \/\__ \__
                /==/\  /\==\    /\_|__ \

             /==/    ||    \=\ / / / /_/
           /=/    /\ || /\   \=\/ /
        /===/   /   \||/   \   \===\

      /===/   /_________________ \===\

   /====/   /  |                /  \====\

 /====/   /    |  _________    /  \   \===\    THE HYRULE
 /==/   /      | /   /  \ / / /  __________\_____      ______       ___
|===| /        |/   /____/ / /   \   _____ |\   /      \   _ \      \  \\
 \==\              /\   / / /     | |  /= \| | |        | | \ \     / _ \\
 \===\__     \    /  \ / / /   /  | | /===/  | |        | |  \ \   / / \ \\
   \==\ \      \\ /____/   /_\ //  | |_____/| | |        | |   | | / /___\ \\
   \===\ \         \\\\\\\/   /////// /|  _____ | | |        | |   | | |  ___  |
     \==\/         \\\\/ / //////   \| |/==/ \| | |        | |   | | | /   \ |
       \==\     _ \\/ / /////    _ | |==/     | |        | |  / /  | |   | |
       \==\   / \ / / ///      /|\| |_____/| | |_____/| | |_/ /   | |   | |
         \==\/   / / /________/ |/_________|/_________|/_____/   /___\ /___\\
         \==\   /               | /==/
           \=\ /________________|/=/             CASTLE
           \==\      _____     /==/
          /  \===\  \   /   /===/
         / / /\===\  \_/  /===/
        / / /   \====\ /====/
       / / /      \===|===/
       |/_/         \===/
                      =\e[39m"
}
NATHAN(){
DEFILE2
echo "
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&&%&%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&&&&&&%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&&&&&&%%%%%%%%%%%%%%%%%%&%%%&%&%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&&&%%%%%#(/////**,,,,*/(##%&&%%%%%%%%&%%%&%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&%%#(***,,,,,,,,,,,,,,,,,,,,,,,,.,,*//(#%&&&%%%%%%&%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&&#/,..,,,.....................,,,.,,,,..,**,.,*(%&&&%%%%&&%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&%#*,...,,,,,,.,,..........,,,,,*,,,,,,,***,,,..,,*,,,,*/#%&&%%&%&&&&&&%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&%(,....,,,,,,..  .  .....  ..,,.......,,,....,**,....,,,,..,,*/#&%%&%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%(*,..,,,............ .. .......,,.....,,.....,.....,,,,,...,*,..,,*#%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&(,,..,................,,.............,.,.,,,,,,,,,,,,,,,,,,,,,.,**,.,,,*,*/%&%&&&%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&%,....,.....  .    .    .,,......,,,.,,,,**,,*,*********,,*,,,,*,,..,,,,,,,*,/&%&%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%&%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*........  ....... .......,,,,,,,*****/((((((((((((///////////**,..,,,,,...../##%&&&%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%%&%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&(,.  ,........ ...,,,.,,,,**///((((((((((((((((((((((((((((((((((////**,..,,,,,,,/#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&#... ,..,....  . .,.,*,,*///((((((((((((((##(#((((((((((((((((((((((((/***,,.  .*/*/%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&(... ...,,,,.......,*,,*/((((((((((#((((#############((#########((((((((((((*,,..,..,,,/#%%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&/...  ..,,,,..,.,,,**,/(((((((((((#(####((###################################/*,,..,..,,.,/&&%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%/.... ..***,....,****(((((((((######((########################################(**,.,....,,,,*%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&#.  .. .***,,**//**(((((((((((###(##############################################/*,,,.....*,,//%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&%,.  . .,*/////////(((((((((((((((((((###########################################(**,.,,. .,,,*#%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&#...   ..,*////////(((((((((((((((((((((##((#######((#(((########################((/*,,..  .*,.,*&&%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&#...    ..,**/////////((((((((((((((((((((###########((##(########################((/*,,.......,,,#&%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%/... .  ..,**//////////((((((((((((((#######################(##((#((##(#((########((/**........,.,(&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&#...     .,,*///////********/////((##(#################/*,,,,....,,,,,,,*//((######(/*,,....,..,,.*%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&#...     ..,///**,....... .......,,*(###############%#//**,,,,,,....,,,,,*,,,,*/(##((*...... . .,.,#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#...      .,,,.,,,,,,,,,,...........,*////((((((((/**.......,,,,*******,,,,,,,,,*/(((/..........,,,#&%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&%,  ,..,*,,,*,.,**//(((((((((/////(///*..(%/  *&*./######((((/(((((((####(((****/*/#.,/. .,..  .,.,(%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&(..., .*. ..*,,*/////*,*******//*****//,.,*((##(,,##(((((//******,*****//////(##(###,.#/....,....,,(&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#,,*.,..*...,*****/(#&%(/* ,..,.*/,,****..,//((((/.,(#(((//**(%*.*.,* *#*.,/((%@@%##(/, /(*...,,.,.,#%%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&%((/**.  *,..***//*/(#&#((/,....,**,,,**..,*//((((#/,/**((//***/(/,,,,(#(//////&@@%##/((, ,, ....*///#%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&(.,,.,. ,*.*////**((#%#/***////**,,,***,,**////(((#(/(((//**////((((((/(///((#&&&%#####(,..,,*/(((/*#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&(,***,,. *,*///**/((%%#/*////**,,,,****,****//(((####((((((/////(((((((((((((#%%%%######*.*(((((////%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&#******,..////*/*/((%%#/*/*****************//((((((##((((((((((((((((((############%####/.*/(((((((/#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&%*******,.*/**/////(((/////////************/(((((((((((((##(((((((((((((((########%#####(*/((((((((/#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&&/,******,******////(((((////**/**********///((((((((((#####((((###(((((################(*/*/#(((#(/#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&(,*****,,***/**//(((((((///////*********///(##########((#####((######################(#/*%(//(#((*(&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&%*,*//**,*/**////((((((((///////****//////(((#########(################################**##////(/(&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%&&&&&&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&&/******,/***///////(((((((//////**/(/*.,*/((###/,,*(((##############################(,(#(/**/(#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&/*,.,*,*/**/////(/((((((((((((//*/(#(**////(((((((((((#############################/,*,/(#(((%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%&%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&#**//*.*/**/////(/((((((((((((///***,,,///((((////(((((((((####################((#(,,(####(/#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&/,*//,,/**//////((((((((((/////****,,,*/(/(*/(/**//(((((((((#################((##/,*(#####%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%&&&&&&
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&#***../****/////(((((((/////***,,,,,**,///*,*//((////((((((((###############((((,,/(###(%&&&&&&&&&&&&%&&&&&&%%&&&&&&&&&&&&&&&&&&&&&&&%&&%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&#**,.*/***///////(((//****,,***,///(((((###(((#####(((/(((/((############((#((/,*/(((%&&&&&%%&&&&&&&&&&&&%%%%&&&&%&&&&&&&&&&&&&&%&&%&&&%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&#*,******////(((///**//////////////////////////////(((((///(((###((#((((((///,*%&&&&&%%&&&&&%&&%%&&&&&&&&&%%&&%%%%%%%&&&&&&&&%%%%&%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%(*****/*/////(/////((//*,,,,,,,,,****//////////***,,,/(/((((#####(((#(//(/,,#&%%%%%&&%%&&%%%%%&%%%%%%%%%%&&%%%%&%&%&%%%&%&&&&&%%%%%%%%%
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&/,**,,***////////(#((**,,,,,**////////(((((((((((((((((#########(((((#(/*,(&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#####%#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&#,,*,***/////((((((((//*/////(/((/(((((/(((((##################(((((#(//,*#&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#############%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&(.,,******//((((((/////////////((/,,,///##(((#########((####((//(((((/,*%&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#############%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&#.,*****////((((///////((((((#(((*,(##############(#(###(##((//(*/(*.*&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#####################%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&#.,*****///////(//////((((((((#(((((###############(((((##(((//***,,#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
########################%##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&/.*,****//**///////((((((((//(#(/(#%##########(((((#(((((((///,.*(%&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#############################%###%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&%/..,,,***//////////((((((//(///*/((((###(###(#(/((((/((///*,..,/(%&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
####################################%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%(,..*,,**,********/////**/**,*///**////(((((///*//*//**,,..,,/(#&&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
########################################%%#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&/,,  ..,,,,,*,,,,**,***,*,,,*/*,.,**///**//(*****,,**,..,**/((#&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##############################################%%%%%%%%%%%%%%%%%%%%%%%%%%%&/***,..    .......,,,,,,**,,**,,,/*,*,,*,**,,,,.*,...,**/(((((#&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
###################################################%%%%%%%%%%%%%%%%%%%%%%%/*****,,.       . ...,,.,,,,,,**,**,..,.,*, .......,,*//((((((#&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
####################################################%%%%%%%%%%%%%%%%%%%%%&/,*******,,,..      ......,.....,,.,.....  ...,,,*//((((((((((#&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
######################################################%%%%%%%%%%%%%%%%%&%#***********,***,,.........................,,***///((((((((((((#&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
########################################################%%%%%%%(/*/((/*,******/////*/****///*,,,,.,*,,*,,,,,,,,*/**/(//((((((((((((((((((#%&&&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
((((((############################################%%%######/, .,*/***********/////*//*****///////(////*/////((((((((((((((((((((##(##((((((((/,*(%&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
(((((((((((#(#############################%%#(/*,........  .  .*/************/////////****////((((((##(((((((####(((((((((((#(###(##(((((((((((*...,,.,*/#&&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
(((((((((((((((((((###################(*,..................... .*/***********//////////**/////((((((##########(((((((((((((####(##((((((((((((#*............,(%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
((((((((((((((((((((((###########(*. ............  ............ .*///********///(//(((///*////////((((((###(#(((((((((((((((#####((((((((((((#(,...........,. ...*#&&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
(((((((((((((((((((((###(((/,...................... ..............*///********//((((((((/////////(((((((((##((((((((((((#(##(##(##((((((((((##,............,.. .,,...,/#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
(((((((((((((((((###/,.  ................. ........................,////******//(((((((((/////////(((((((##((#((((((((((((#####(#(((((((((((#* ...,.... ...,.....,,..,......*#%&%%%%%%%%%%%%%%%%%%%%%%%%
(((((((((((((((/,...................................................,*/*******///(((((((((///////(((((######(((#((((((((((#####((((((((((((#*......... ....,................,,. .*(%%%%%%%%%%%%%%%%%%%%%
((((((((#(*.  .............................. ...................... ..*/******///(((((((((((/////((((((#######(((((((((######(((((((((((((#,........  .....,...................,*,.. ,/#%&%%%%%%%%%%%%%%
(((((/,. ..............................................................,*/****////((((((((((//////(((((((((((((((((((((##(((((((((((((((#/.........  .......,.....................,,,.....,*(#%%%%%%%%%%
((,  ......................................... ........................ .,*/**//////(((((((((((/((((((((((((((((((((((##((((((((((((((#(...........  ...,...,.......................,,,......,,,*#&%%%%%
 ............................................. ............................,*///////(((((((((((((/(((((((((((((((((((((((((((((((((((*.............  ...,....,...................................,,,*(%%
..............................................  ...........................  .,/(////((((((((((((((((((((((((((((((((((((((((((((#(................   ..,............................................,,,
.............................................   ..............................  .,*/(((((((((((((((((((((((((((((((((((((((((#(/,.................   ...,...............................................
........  ... ...............................  ....................... ..........   .,,/((##(((((((((((((((((((((((##(####(/,............. .......   ...,...............................................
.............. ..............................  .......................... ..................,**//((((((((((((((((((//*,,..........................    ..,...............................................
..............  ............................   .............................  .......................  ....... ...................... ............    ..,...............................................
..............  ............................   ...................................................................................................    ..,...............................................
...............  ......... ................    ....................................... ...........................................................    ..................................................
 ..............  ..........................   .................................. ..................................................................    .................................................
  .............  ............  ............   ...................................  ................................................................    .................................................
    ...........   ............   ..........    ....................................  ...............................................................   .....  ..........................................
.    ..........   ...............  ........    ......................................  .............................................................    ....  .........................  .......,......
..    .........   .................  ......   ......................................... ............................................................    .....  ........................ .............  .
. .    .........   ..... ...........  .....   .......................................................................................................   .....  .......................  .....,...... ...
.. .   .........  ....................  ...   .......................................................................................................    ....   ......................  ....,...... ....
 .. .   ........  ........ ............  .    ........................................................................................................   ....   .....................  ........... ....,
  ..     .......  ..... ...............   .    ........................................................................................................  .....  .....................   ......... .....
.  ..     ......   ....  ..................    ........................................................................................................   ....  ...................... ......... ...,. .
..  ..     ......  ....  .................     ..................... *%*,,..*,,,...................   ..................................................  ....  ...................... ........ ........
...  ..    ....... ....  ..................    .................  **#(%&(%@@#/%(//(.............  (&&&%. ..............................................,. ....  ......................  ...... .........
.....  ..  ....... ...   ...................   ............... *%&&/,%*(((/*,*,/#/............,(%%##%%%&, ............................................. .(, ... ...................... ...... ........
....... ..  ...........   ..................   .............. (#**&%%%%&%#&&%&#/, ......  ,#&%#%%%%%%%&( ......... ,(((/(/ ..............       ........ ,#....  ..........................  ........ ..
........  .  ..........   ..................   ............. ,(##%%%%&#((%%(/%&&&#.  .*(#%%&&&&&&%&%#*. ... .#, . (&%%,,%#* ...............,*/#%##(*.... ,#, ... .........................  .......  ...
.......... .  .........   .................   ............ *@&%%&%##(#@%,#@@&*/%%&&&(,*&@@&@&&#%%/  ....... #@*  ,&@&&&%**/ .......  .*#&@&&&&&&&&&&&&&* /( .... ........................  ......  .....
............  .........    ................   ...............,..,/*(@&%%#(//%%*/%&%&%*,,*****,. .......... /&&/ . *(**#&&/ ...,/(#%&&&&&&&&&&&&&&&&&&&%((......................................  .......
.............  ........    ...............   ................. *(%&&##&(,#(*.,@@%((#%(/(. ............... ,&(&( ... ,//, .....  .(%&&&&&&&&&&&&&&&&&&&@(,(/ .................................  .........
.............   ........     ............    .................. *((/(/*/*%%&#/(&&&&&&&&(**/* ............ ##/&( ..............*/((//%&#((##&&&&&&&&&&#/(/(&, .... .........................  ........  "
}


#-------------------------GAME---------------------------
monster_fight()
{
pars_enemies1
#-----------------------------TAKE OF VARIABLE ENEMIE DATA FUNCTION-------------------
monster_name=$name_enemies
monster_hp=$hp_enemies
monster_hp_left=$hp_enemies
monster_str=$str_enemies
monster_def=$def_enemies
#---------------------------------------START WHILE-------------------------------------
    while [[ $m_loop -eq 0 ]]; do
        echo -e "\e[91m$monster_name\e[39m"
        echo HP: "$monster_hp_left"/"$monster_hp"
        echo ""
        echo -e "\e[32m$player_name\e[39m"
        echo HP: "$player_hp_left"/"$player_hp"
        echo ""

   #----ATTAQUE OPTION--------#

        echo ---- Options ----
        echo 1. Attack    2. Heal
        if [[ $round -eq 0 ]]; then
            echo ""
            echo You encontered a $monster_name
            echo ""
        fi
        read -s choice
        round=1

 #------------FIGHT MMONSTERS---------------#
          #--------ATTACKS CHOICE-------#

        if [[ $choice -eq 1 ]]; then
            monster_hp_left=$(echo $monster_hp_left-$player_str+$monster_def | bc)
            echo ""
            echo -e "\e[33mYou attacked and dealt "$(echo $player_str-$monster_def | bc)"\e[39m"

         #---------HEAL CHOICE-------------#

        elif [[ $choice -eq 2 ]]; then
            player_hp_left=$(echo $player_hp/2+$player_hp_left | bc)
            if [[ $player_hp_left -gt 60 ]]; then
                hp_d=$(echo $player_hp_left-60 | bc)
                player_hp_left=$(echo $player_hp_left-$hp_d | bc)
            fi
        fi
        echo ""

       #-------------FIGHT CONDITIONS--------------#

        if [[ $monster_hp_left -gt 0 ]]; then
            player_hp_left=$(echo $player_hp_left-$monster_str+$player_def | bc)
		if [[ $player_hp_left -gt 60 ]]; then
			player_hp_left=60
		fi
		damage=$(echo $monster_str-$player_def | bc)
		if [[ $damage -lt 0 ]]; then
			damage=0
		fi
            echo "$monster_name" attacked and dealt $damage
            echo ""
        elif [[ $player_hp_left -gt 0 ]]; then
            player_hp_left=$player_hp
            echo -e "\e[91m$monster_name died\e[39m"
            echo ""
            monster_hp_left=$monster_hp
            m_loop=1
        fi
        if [[ $player_hp_left -le 0 ]]; then
            m_loop=1
        fi
    done
}
    round=0

#------------------------------BOSS FIGHT-------------------#
boss_fight()
{
#------------------WHILE-------------#

    while [[ $m_loop -eq 0 ]]; do
        echo -e "\e[31m$boss_name\e[39m"
        echo HP: "$boss_hp_left"/"$boss_hp"
        echo ""
        echo -e "\e[32m$player_name\e[39m"
        echo HP: "$player_hp_left"/"$player_hp"
        echo ""

   #----ATTAQUE OPTION--------#

        echo ---- Options ----
        echo 1. Attack    2. Heal
        read choice

 #------------FIGHT BOSS---------------#
    #--------ATTACKS CHOICE-------#

        if [[ $choice -eq 1 ]]; then
            boss_hp_left=$(echo $boss_hp_left-$player_str+$boss_def | bc)
            echo -e "\e[33mYou attacked and dealt "$(echo $player_str-$boss_def | bc)"\e[39m"

 #---------HEAL CHOICE-------------#

        elif [[ $choice -eq 2 ]]; then
            player_hp_left=$(echo $player_hp/2+$player_hp_left | bc)
              if [[ $player_hp_left -gt 60 ]]; then
                hp_d=$(echo $player_hp_left-60 | bc)
                player_hp_left=$(echo $player_hp_left-$hp_d | bc)
            fi
        fi
        echo ""

#-------------FIGHT CONDITIONS--------------#

        if [[ $boss_hp_left -gt 0 ]]; then
            player_hp_left=$(echo $player_hp_left-$boss_str+$player_def | bc)
		if [[ $player_hp_left -gt 60 ]]; then
			player_hp_left=60
                fi
            echo "$boss_name" attacked and dealt $(echo $boss_str | bc)
            echo ""
        elif [[ $player_hp_left -gt 0 ]]; then
            player_hp_left=$player_hp
            echo -e "\e[91m$boss_name died\e[39m"
            echo ""
            boss_hp_left=$boss_hp
            m_loop=1
        fi
        if [[ $player_hp_left -le 0 ]]; then
            m_loop=1
        fi
    done
}

#----------------------GAME LOOP----------------------#
game_loop()
{
while [[ "$game_loop" -eq 0 ]]; do
    echo ========== FIGHT "$nb_fight" ==========
    if [[ "$nb_fight" == 10 ]]; then
	player_str=$((player_str*10))
        boss_fight
    else
        monster_fight
    fi
    nb_fight=$((nb_fight+1))
    if [[ "$nb_fight" -gt 10 && "$player_hp_left" -gt 0 ]]; then
        YOU_WIN
        game_loop=1
    elif [[ "$player_hp_left" -le 0 ]]; then
        YOU_LOSE
        game_loop=1
    else
        echo === Press any key to continue ===
        echo ""
        read -s key_press
        m_loop=0
    fi
done
}

#---------------------------------------------------------------------#
#----------------------NARATION LINE----------------------------------#
#---------------------------------------------------------------------#
DEFILE2
LOGO
DEFILE
PROPRE
echo -e "\e[36m   HEY ! LISTEN !\e[39m"
PROPRE
read -p "Press enter to begin"
DEFILE
PROPRE
echo -e "\e[39mIt is time !"
DEFILE
echo "
After many adventures, you finally reach the Hyrule Castle."
DEFILE
echo "
Right in front of the gigantic tower..."
DEFILE
PROPRE
DEFILE
echo "In each level of the tower, you will encounter a monster."
DEFILE
echo "
Until the final boss, on the 10th level."
DEFILE
echo -e "
The terrible \e[91m$boss_name \e[39m!"
DEFILE
PROPRE
DEFILE
echo -e "\e[36mDo you accept your quest, Link ?\e[39m"
DEFILE
echo -e "\e[39m
1. YES     2.NO !"
DEFILE
PROPRE
read -s choice

if [[ $choice -eq 1 ]]; then

    DEFILE
    START
    monster_fight
    DEFILE
    boss_fight
    game_loop
    THE_END
elif [[ $choice == "nathan" ]]; then
	boss_name_n="Nathan"
	boss_str_n=999
	boss_def_n=999
	boss_hp_n=999
        DEFILE
	NATHAN
	DEFILE
	echo ========== SECRET BOSS ==========
	echo $boss_name_n
	echo HP: $boss_hp_n/$boss_hp_n
	echo ""
	echo Link
	echo HP: 60/60
	echo ""
	echo Link: Oh fuck... I have no chance of survival...
        DEFILE
	echo Nathan: D... I... E...
	PROPRE
        echo "Nathan destroyed every life in the world"
else
    DEFILE
    PROPRE
    echo "ARE YOU SURE ?"
    DEFILE
    PROPRE
    echo "1. YES YES YES !  2. YES YES YES !"
    DEFILE
    PROPRE
    read -s choice2
    if [[ $choice2 -eq 1 ]] && [[ $choice2 -eq 2 ]]; then
       echo -e "\e[36mYou do not have a choice anyways, you play !\e[39m"
    fi
    DEFILE
    PROPRE
    echo -e "\e[36mYou do not have a choice anyways, you play !\e[39m"
    DEFILE
    PROPRE
    DEFILE
    START
    monster_fight
    DEFILE
    boss_fight
    game_loop
    THE_END

fi
