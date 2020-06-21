*** Settings ***
Resource  NSM.robot
Metadata  Author  Adam Przybyla  <adam.przybyla@gmail.com>

*** Test Cases ***
Sprowdź 1
	Teroz je tak: jo widza webpage
	Jo ni widza słowa logged na webpage
	Potym jo użyja słów credentials na webpage
	Z tego powodu jo widza słowa logged na webpage
	Terozki uż jo ni widza webpage

Sprowdź 2
	Teroz je tak: jo widza webpage
	Jo ni widza słowa logged na webpage
	Potym jo użyja słów bad credentials na webpage
	Z tego powodu jo ni widza słowa logged na webpage
	Terozki uż jo ni widza webpage

Sprowdź 3
	Teroz je tak: jo widza webpage
	Jo ni widza słowa logged na webpage
	Terozki uż jo ni widza webpage
