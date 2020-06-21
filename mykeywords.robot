*** Settings ***
Resource  requirements.robot
Library   SeleniumLibrary



*** Variables ***
${adres_strony}     https://profil.wp.pl/login.html?zaloguj=poczta
${przegladarka}     Firefox
${loginWP}    testerwsb_t1
${hasloWP}    adam1234
${bledne_hasloWP}    ADAM1234
${xpath_loginWP}    //*[@id="login"]
${xpath_hasloWP}    //*[@id="password"]
${xpath_zaloguj}    //*[@id="btnSubmit"]
${tekst}     Odebrane


*** Keywords ***
${page} setup
	Log to console  Wchodze na strone ${page}
	open browser    ${adres_strony}    ${przegladarka}


${page} teardown
	Log to console  Wychodze ze strony ${page}
	close all browsers

credentials
	Log to console  wyslalem dobre cred
	[Return]    ${loginWP}    ${hasloWP}


bad credentials
	Log to console  wyslalem zle cred
	[Return]   ${loginWP}    ${bledne_hasloWP}

logged
	Log to console  szukaj Odebrane
	[Return]  Odebrane


Enter Credentials
	[Arguments]  ${user}  ${pass}
	sleep    5
	input text     ${xpath_loginWP}     ${user}
	input text     ${xpath_hasloWP}     ${pass}
	click button    ${xpath_zaloguj}
	Log to console  uzylem cred ${user} ${pass}
	sleep    5

webpage check
	[Arguments]  ${slowo}
	${wynik}=    Run Keyword and return status   Page should contain    ${slowo}
	${wynik}=    set variable if    ${wynik}     OK    NOTOK
	Log to console  szukalem slowa ${slowo}
	[Return]  ${wynik}
