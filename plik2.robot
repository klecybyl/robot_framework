*** Settings ***
Library   funkcja.py
Library   SSHLibrary
Library   Impansible
Library   Collections
Library   SeleniumLibrary


*** Variables ***
${moja_zmienna}   Hello Swiecie
${moj_host}   127.0.0.1
${username}   vdi-student
${haslo}   Pa$$w0rd
${ansible_become_password}    ${haslo}
${ansible_user}    ${username}

${adres_strony}     https://profil.wp.pl/login.html?zaloguj=poczta
${przegladarka}     Firefox
${loginWP}    testerwsb_t1
${hasloWP}    adam1234
${bledne_hasloWP}    ADAM1234
${xpath_loginWP}    //*[@id="login"]
${xpath_hasloWP}    //*[@id="password"]
${xpath_zaloguj}    //*[@id="btnSubmit"]
${tekst}     Odebrane


*** Test Cases ***
LOGOWANIE DO WP
    [tags]    logWP
    otworz przegladarke
#    wejdz na strone
    wprowadz login
    wprowadz haslo
    kliknij w zaloguj
    sprawdz tekst wyswietlany
    zamknij strone

BLEDNE LOGOWANIE DO WP
    [tags]    nologWP
    otworz przegladarke
    wprowadz login
    wprowadz bledne haslo
    kliknij w zaloguj
    sprawdz tekst wyswietlany przy bledzie
    zamknij strone


Test1
   log to console   ala ma kota

Test2
   log to console   ${moja_zmienna}

Test3
    Wypisz na konsole   Hello Swiecie 2

Test4
   ${wynik}=   fun   ala   kota
   Should be equal   ${wynik}   ala ma kota

LOGOWANIE DO ZDALNEGO SRODOWISKA
   [tags]    ssh
   nawiazanie polaczenia
   zaloguj sie
   wydaj komende i sprawdz czy wszystko jest ok
   wyloguj sie

SPRAWDZ CZY DZIALA INTERNET
   [tags]    ping
   nawiazanie polaczenia
   zaloguj sie
   wydaj komende ping
   wyloguj sie

POBRANIE DANYCH
    pobierz dane

*** Keywords ***
otworz przegladarke
    #open browser   about:blank   ${przegladarka}
    open browser   ${adres_strony}    ${przegladarka}
    #open browser    https://profil.wp.pl/login.html?zaloguj=poczta    Firefox

#wejdz na strone
#    Go To    ${adres_strony}

wprowadz login
    input text     ${xpath_loginWP}     ${loginWP}

wprowadz haslo
    input text     ${xpath_hasloWP}     ${hasloWP}
wprowadz bledne haslo
    input text     ${xpath_hasloWP}     ${bledne_hasloWP}

kliknij w zaloguj
    click element    ${xpath_zaloguj}

sprawdz tekst wyswietlany
    Sleep    5
    Page Should Contain      ${tekst}

sprawdz tekst wyswietlany przy bledzie
    Sleep    5
    Page Should not Contain      ${tekst}

zamknij strone
     Capture page screenshot
     Close All Browsers

pobierz dane
    ${wyn}=   Setup   localhost
    log   ${wyn}   formatter=repr
    ${wyn2}=   get from dictionary    ${wyn}    ansible_facts
    ${wyn3}=   get from dictionary    ${wyn2}    ansible_distribution
    should be equal    ${wyn3}    Ubuntu

Wypisz na konsole
   [Arguments]   ${message}
   log to console   ${message}

nawiazanie polaczenia
   open connection   ${moj_host}

zaloguj sie
   login   ${username}   ${haslo}

wydaj komende i sprawdz czy wszystko jest ok
   ${zm}=   execute command   uname -a
   should contain   ${zm}   GNU/Linux

wyloguj sie
   close connection

wydaj komende ping
   ${wer}=   execute command   ping -c1 8.8.8.8
   should not contain   ${wer}   100% packet loss
