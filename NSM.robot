*** Settings ***
Resource  mykeywords.robot

*** Keywords ***
# english
It is like this now: ${state}
	Run keyword  ${state}

I not see words ${logged} on the ${page}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should not be equal   OK   ${result}

I use the words ${cred} on ${page}
	${user}   ${pass}=   Run Keyword  ${cred}
	Enter Credentials    ${user}  ${pass}

because of this: ${state}
	Run keyword  ${state}

I see words ${logged} on the ${page}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should be equal   OK   ${result}

after this ${state}
	Run keyword  ${state}

i see the ${page:[^ ]+} ${no more}
	Run keyword  ${page} teardown

i see the ${page:[^ ]+}
	Run keyword  ${page} setup

# polski
Teraz jest tak: ${state}
	Run keyword  ${state}

Ja nie widzę słowa ${logged} na ${page}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should not be equal   OK   ${result}

Potem ja użyję słów ${cred} na ${page}
	${user}   ${pass}=   Run Keyword  ${cred}
	Enter Credentials    ${user}  ${pass}

Z tego powodu ${state}
	Run keyword  ${state}

ja widzę słowa ${logged} na ${page}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should be equal   OK   ${result}

Niedługo potem ${state}
	Run keyword  ${state}

ja nie widzę ${page:[^ ]+}
	Run keyword  ${page} teardown

ja widzę ${page:[^ ]+}
	Run keyword  ${page} setup

# deutsche
Es ist jetzt so: ${state}
	Run keyword  ${state}

Ich sehe keine wörter ${logged} auf der ${page}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should not be equal   OK   ${result}

dann benutze ich die worte ${cred} auf der ${page}
	${user}   ${pass}=   Run Keyword  ${cred}
	Enter Credentials    ${user}  ${pass}

Aus diesem grund: ${state}
	Run keyword  ${state}

sehe ich wörter ${logged} auf der ${page}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should be equal   OK   ${result}

Danach ${state}
	Run keyword  ${state}

sehe ich die ${page:[^ ]+} ${no more}
	Run keyword  ${page} teardown

Ich sehe die ${page:[^ ]+}
	Run keyword  ${page} setup

# russian
Теперь это так: ${state}
	Run keyword  ${state}

Я не вижу слов ${logged} на ${page}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should not be equal   OK   ${result}

тогда я использую слова ${cred} на ${page}
	${user}   ${pass}=   Run Keyword  ${cred}
	Enter Credentials    ${user}  ${pass}

из-за этого ${state}
	Run keyword  ${state}

я вижу слова ${logged} на ${page}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should be equal   OK   ${result}

после этого ${state}
	Run keyword  ${state}

я больше не вижу ${page:[^ ]+}
	Run keyword  ${page} teardown

я вижу ${page:[^ ]+}
	Run keyword  ${page} setup

# czech
Teď je to takto: ${state}
	Run keyword  ${state}

Na ${page} nevidím slova ${logged}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should not be equal   OK   ${result}

pak používám slova ${cred} na ${page}
	${user}   ${pass}=   Run Keyword  ${cred}
	Enter Credentials    ${user}  ${pass}

z tohoto důvodu: ${state}
	Run keyword  ${state}

Na ${page} vidím slova ${logged}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should be equal   OK   ${result}

po tom už ${state}
	Run keyword  ${state}

nevidím ${page}
	Run keyword  ${page} teardown

Vidím ${page}
	Run keyword  ${page} setup

# french
C'est comme ça maintenant: ${state}
	Run keyword  ${state}

Je ne vois pas les mots ${logged} sur le ${page}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should not be equal   OK   ${result}

alors j'utilise les mots ${cred} sur ${page}
	${user}   ${pass}=   Run Keyword  ${cred}
	Enter Credentials    ${user}  ${pass}

à cause de cela: ${state}
	Run keyword  ${state}

je vois les mots ${logged} sur le ${page}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should be equal   OK   ${result}

après cela ${state}
	Run keyword  ${state}

je ne vois plus le ${page}
	Run keyword  ${page} teardown

je vois le ${page}
	Run keyword  ${page} setup

# spanish

Es así ahora: ${state}
	Run keyword  ${state}

No veo palabras ${logged} en el ${page}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should not be equal   OK   ${result}

entonces uso las palabras ${cred} en ${page}
	${user}   ${pass}=   Run Keyword  ${cred}
	Enter Credentials    ${user}  ${pass}

por esto: ${state}
	Run keyword  ${state}

veo palabras ${logged} en ${page}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should be equal   OK   ${result}

después de esto ya ${state}
	Run keyword  ${state}

no veo el ${page}
	Run keyword  ${page} teardown

veo el ${page}
	Run keyword  ${page} setup

# japan

次のようになります。 ${state}
	Run keyword  ${state}

${page:[^ ]+} は ${logged:[^ ]+} という単語を表示しません
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should not be equal   OK   ${result}

次に、 ${page} で ${cred} という言葉を使用します
	${user}   ${pass}=   Run Keyword  ${cred}
	Enter Credentials    ${user}  ${pass}

このため： ${state}
	Run keyword  ${state}

${page:[^ ]+} に ${logged:[^ ]+} という言葉が表示されます
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should be equal   OK   ${result}

この後 ${state}
	Run keyword  ${state}

この後もう ${page} が見えない
	Run keyword  ${page} teardown

${page:[^ ]+} を見る
	Run keyword  ${page} setup

# china

#It is like this now: ${state}
现在是这样的：${state}
	Run keyword  ${state}

#I not see words ${logged} on the ${page}
我在 ${page} 上看不到 ${logged} 单词
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should not be equal   OK   ${result}

#I use the words ${cred} on ${page}
然后我在 ${page} 上使用 ${cred} 单词
	${user}   ${pass}=   Run Keyword  ${cred}
	Enter Credentials    ${user}  ${pass}


#because of this: ${state}
因此${state}
	Run keyword  ${state}

#I see words ${logged} on the ${page}
我在 ${page}上看到 ${logged} 单词
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should be equal   OK   ${result}

#after this ${state}
在此之后，${state}
	Run keyword  ${state}


#i see the ${page:[^ ]+} ${no more}
我${no more:[^ ]+}看到${page}
	Run keyword  ${page} teardown

#i see the ${page:[^ ]+}
我看到 ${page:[^ ]+}
	Run keyword  ${page} setup

# portugese

#It is like this now: ${state}
É assim agora: ${state}
	Run keyword  ${state}

#I not see words ${logged} on the ${page}
Não vejo as palavras ${logged} na ${page}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should not be equal   OK   ${result}

#I use the words ${cred} on ${page}
então eu uso as palavras ${cred} em ${page}
	${user}   ${pass}=   Run Keyword  ${cred}
	Enter Credentials    ${user}  ${pass}

#because of this: ${state}
por causa disso: ${state}
	Run keyword  ${state}

#I see words ${logged} on the ${page}
vejo as palavras ${logged} na ${page}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should be equal   OK   ${result}

#after this ${state}
Depois disso, ${state}
	Run keyword  ${state}

#i see the ${page:[^ ]+} ${no more}
não vejo mais a ${page}
	Run keyword  ${page} teardown

#i see the ${page:[^ ]+}
eu vejo o ${page}
	Run keyword  ${page} setup

# romanian
#It is like this now: ${state}
Acum este așa: ${state}
	Run keyword  ${state}

#I not see words ${logged} on the ${page}
eu nu văd cuvintele ${logged} pe ${page}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should not be equal   OK   ${result}

#I use the words ${cred} on ${page}
Apoi eu voi folosi cuvintele ${cred} pe ${page}
	${user}   ${pass}=   Run Keyword  ${cred}
	Enter Credentials    ${user}  ${pass}

#because of this: ${state}
Din acest motiv ${state}
	Run keyword  ${state}

#I see words ${logged} on the ${page}
eu văd cuvintele ${logged} pe ${page}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should be equal   OK   ${result}

#after this ${state}
La scurt timp după ${state}
	Run keyword  ${state}

#i see the ${page:[^ ]+} ${no more}
eu nu mai văd ${page}
	Run keyword  ${page} teardown

#i see the ${page:[^ ]+}
eu văd ${page:[^ ]+}
	Run keyword  ${page} setup

# urdu
#It is like this now: ${state}
${state} ںیم ۔ےہ اسیا با
	run keyword      ${state}

#I not see words ${logged} on the ${page}
۔ںیہ ےتآ ںیہن رظن ظافلا ${logged} ںیم ${page} ےھجم
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should not be equal   OK   ${result}

#I use the words ${cred} on ${page}
ںوہ اترک لامعتسا ظافلا ${cred} رپ ${page} ںیم رھپ	
	${user}   ${pass}=   Run Keyword  ${cred}
	Enter Credentials    ${user}  ${pass}

#because of this: ${state}
${state} :ےس ہجو یک سا
	run keyword      ${state}

#I see words ${logged} on the ${page}
ںوہ اتکس ھکید ظافلا ${logged} رپ ${page} ںیم -
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should be equal   OK   ${result}

#after this ${state}
${state} ںیم دعب ےک سا
	Run keyword  ${state}

#i see the ${page:[^ ]+} ${no more}
اتھکید ںیہن وک ${page:[^ ]+} با 
	Run keyword  ${page} teardown

#i see the ${page:[^ ]+}
ںوہ اتکس ھکید ${page:[^ ]+}
	Run keyword  ${page} setup

# bengali
এটি এখন এই মত: ${state}
#It is like this now: ${state}
	Run keyword  ${state}

আমি শব্দগুলি ${logged:[^ ]+} ${page:[^ ]+} তে দেখতে পাচ্ছি না
#I not see words ${logged} on the ${page}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should not be equal   OK   ${result}

তাহলে আমি শব্দগুলি ${cred} ব্যবহার করি ${page:[^ ]+} তে
#I use the words ${cred} on ${page}
	${user}   ${pass}=   Run Keyword  ${cred}
	Enter Credentials    ${user}  ${pass}

এর জন্য: ${state}
#because of this: ${state}
	Run keyword  ${state}

আমি ${page} - তে ${logged} শব্দগুলি দেখতে পাচ্ছি
#I see words ${logged} on the ${page}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should be equal   OK   ${result}

এর পরে ${state}
#after this ${state}
	Run keyword  ${state}

আমি আর ওয়েবসাইট ${page:[^ ]+} দেখতে পাচ্ছি না
#i see the ${page:[^ ]+} ${no more}
	Run keyword  ${page} teardown

আমি ${page:[^ ]+} দেখতে পাচ্ছি
#i see the ${page:[^ ]+}
	Run keyword  ${page} setup

# silesian
Teroz je tak: ${state}
#It is like this now: ${state}
	Run keyword  ${state}

#I not see words ${logged} on the ${page}
Jo ni widza słowa ${logged} na ${page}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should not be equal   OK   ${result}

Potym jo użyja słów ${cred} na ${page}
#I use the words ${cred} on ${page}
	${user}   ${pass}=   Run Keyword  ${cred}
	Enter Credentials    ${user}  ${pass}

#Z tego powodu ${state}
##because of this: ${state}
#	Run keyword  ${state}

#I see words ${logged} on the ${page}
jo widza słowa ${logged} na ${page}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should be equal   OK   ${result}

#after this ${state}
Terozki uż ${state}
	Run keyword  ${state}

#i see the ${page:[^ ]+} ${no more}
jo ni widza ${page:[^ ]+}
	Run keyword  ${page} teardown

#i see the ${page:[^ ]+}
jo widza ${page:[^ ]+}
	Run keyword  ${page} setup

# bielorusian
Зараз гэта так: ${state}
#It is like this now: ${state}
	Run keyword  ${state}

Я не бачу слоў ${logged} на ${page}
#I not see words ${logged} on the ${page}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should not be equal   OK   ${result}

тады я выкарыстаю словы ${cred} на ${page}
#I use the words ${cred} on ${page}
	${user}   ${pass}=   Run Keyword  ${cred}
	Enter Credentials    ${user}  ${pass}

з-за гэтага ${state}
#because of this: ${state}
	Run keyword  ${state}

я бачу словы ${logged} на ${page}
#I see words ${logged} on the ${page}
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should be equal   OK   ${result}

пасля гэтага ${state}
#after this ${state}
	Run keyword  ${state}

я больш не бачу ${page:[^ ]+}
#i see the ${page:[^ ]+} ${no more}
	Run keyword  ${page} teardown

Я бачу ${page:[^ ]+}
#i see the ${page:[^ ]+}
	Run keyword  ${page} setup

# tamil
இப்போது இது போன்றது: ${state}
#It is like this now: ${state}
	Run keyword  ${state}

#I not see words ${logged} on the ${page}
${page:[^ ]+} இல் ${logged} சொற்களை நான் காணவில்லை
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should not be equal   OK   ${result}

நான் ${page:[^ ]+} இல் ${cred} என்ற சொற்களைப் பயன்படுத்துகிறேன்
#I use the words ${cred} on ${page}
	${user}   ${pass}=   Run Keyword  ${cred}
	Enter Credentials    ${user}  ${pass}

இதன் காரணமாக ${state}
#because of this: ${state}
	Run keyword  ${state}

#I see words ${logged} on the ${page}
${page:[^ ]+} இல் ${logged} சொற்களைக் காண்கிறேன்
	${words}=   Run keyword  ${logged}
	${result}=  Run keyword  ${page} check  ${words}
	Should be equal   OK   ${result}

#after this ${state}
இதற்கு பிறகு ${state}
	Run keyword  ${state}

#i see the ${page:[^ ]+} ${no more}
நான் இனி ${page:[^ ]+} ஐப் பார்க்கவில்லை
	Run keyword  ${page} teardown

#i see the ${page:[^ ]+}
நான் ${page:[^ ]+} ஐப் பார்க்கிறேன்
	Run keyword  ${page} setup




