/* Himanshu Koyalkar    CS-524-02   04-13-2016 This program converts text or digits to ICAO Code and Morse Code */
/*	and  converts morse code back to normal text*/

/*icao codes for various lowercase letters*/

icaofor(a,alpha).
icaofor(b, bravo).
icaofor(c,charlie).
icaofor(d, delta).
icaofor(e, echo).
icaofor(f, foxtrot).
icaofor(g, golf).
icaofor(h, hotel).
icaofor(i, india).
icaofor(j, juliett).
icaofor(k,kilo).
icaofor(l, lima).
icaofor(m, mike).
icaofor(n, november).
icaofor(o, oscar).
icaofor(p, papa).
icaofor(q, quebec).
icaofor(r, romeo).
icaofor(s, sierra).
icaofor(t, tango).
icaofor(u, uniform).
icaofor(v, victor).
icaofor(w, whiskey).
icaofor(x, xray).
icaofor(y, yankee).
icaofor(z, zulu).
icaofor(' ',' ').
/*morse codes for various lowercase letters*/
morsefor(a, .-).
morsefor(b, -...).
morsefor(c, -.-.).
morsefor(d, -..).
morsefor(e, .).
morsefor(f, ..-.).
morsefor(g, --.).
morsefor(h, ....).
morsefor(i, ..).
morsefor(j, .---).
morsefor(k, -.-).
morsefor(l, .-..).
morsefor(m, --).
morsefor(n, -.).
morsefor(o, ---).
morsefor(p, .--.).
morsefor(q, --.-).
morsefor(r, .-.).
morsefor(s, ...).
morsefor(t, -).
morsefor(u, ..-).
morsefor(v, ...-).
morsefor(w, .--).
morsefor(x, -..-).
morsefor(y, -.--).
morsefor(z, --..).
morsefor(' ',/).

/*icao codes for various Uppercase letters and digits */
icaofor('A', alpha).
icaofor('B', bravo).
icaofor('C',charlie).
icaofor('D', delta).
icaofor('E', echo).
icaofor('F', foxtrot).
icaofor('G', golf).
icaofor('H', hotel).
icaofor('I', india).
icaofor('J', juliett).
icaofor('K', kilo).
icaofor('L', lima).
icaofor('M', mike).
icaofor('N', november).
icaofor('O', oscar).
icaofor('P', papa).
icaofor('Q', quebec).
icaofor('R', romeo).
icaofor('S', sierra).
icaofor('T', tango).
icaofor('U', uniform).
icaofor('V', victor).
icaofor('W', whiskey).
icaofor('X', xray).
icaofor('Y', yankee).
icaofor('Z', zulu).
icaofor('1', 'one').
icaofor('2', 'two').
icaofor('3', 'three').
icaofor('4', 'four').
icaofor('5', 'five').
icaofor('6', 'six').
icaofor('7', 'seven').
icaofor('8', 'eight').
icaofor('9', 'nine').
icaofor('0', 'zero').

/* morse code for various Uppercase letters and digits*/
morsefor('A', .-).
morsefor('B', -...).
morsefor('C', -.-.).
morsefor('D', -..).
morsefor('E', .).
morsefor('F', ..-.).
morsefor('G', --.).
morsefor('H', ....).
morsefor('I', ..).
morsefor('J', .---).
morsefor('K', -.-).
morsefor('L', .-..).
morsefor('M', --).
morsefor('N', -.).
morsefor('O', ---).
morsefor('P', .--.).
morsefor('Q', --.-).
morsefor('R', .-.).
morsefor('S', ...).
morsefor('T', -).
morsefor('U', ..-).
morsefor('V', ...-).
morsefor('W', .--).
morsefor('X', -..-).
morsefor('Y', -.--).
morsefor('Z', --..).

morsefor('0', -----).
morsefor('1', .----).
morsefor('2', ..---).
morsefor('3', ...--).
morsefor('4', ....-).
morsefor('5', .....).
morsefor('6', -....).
morsefor('7', --...).
morsefor('8', ---..).
morsefor('9', ----.).

/* Morse code to Letters and digits conversion facts */
morsefor1(".-",'A').
morsefor1("-...",'B').
morsefor1("-.-.",'C').
morsefor1("-..",'D').
morsefor1(".",'E').
morsefor1("..-.",'F').
morsefor1("--.",'G').
morsefor1("....",'H').
morsefor1("..",'I').
morsefor1(".---",'J').
morsefor1("-.-",'K').
morsefor1(".-..",'L').
morsefor1("--",'M').
morsefor1("-.",'N').
morsefor1("---",'O').
morsefor1(".--.",'P').
morsefor1("--.-",'Q').
morsefor1(".-.",'R').
morsefor1("...",'S').
morsefor1("-",'T').
morsefor1("..-",'U').
morsefor1("...-",'V').
morsefor1(".--",'W').
morsefor1("-..-",'X').
morsefor1("-.--",'Y').
morsefor1("--..",'Z').
morsefor1("/",' ').
morsefor1("-----",'0').
morsefor1(".----",'1').
morsefor1("..---",'2').
morsefor1("...--",'3').
morsefor1("....-",'4').
morsefor1(".....",'5').
morsefor1("-....",'6').
morsefor1("--...",'7').
morsefor1("---..",'8').
morsefor1("----.",'9').



/* rules for icao codes generation */
write_list1([]).		/* using reucrsion to generate icao code*/
write_list1([Head|Tail]):-	char_code(V,Head),
							icaofor(V,B),
							nl,
							write(B),
							write_list1(Tail).
							
							
/* rules for morse code generation */							
write_list2([]).
write_list2([Head|Tail]):-	char_code(V,Head), /* using recursion to generate latters or letters */
							morsefor(V,B),
							write(B),
							write(' '),
							write_list2(Tail).
							
						
/* rules for generation of letters or digits for the corresponding morse code */						
write_list3([]).
write_list3([Head|Tail]):-	morsefor1(Head, X),   /* using reucrsion to generate letters or digits from morse code*/
							write(X),
							write_list3(Tail).
		
/* convert into ICAO by taking user input */		
convertToIcao(X):-write('String is '),
			write(X),
			string_to_list(X,Y),   /* converting to list to send to apply the above stated rule */
			write_list1(Y).
			
			
/* convert into Morse code by taking user input */			
convertToMorse(X):-write('String is '),
			write(X),
			nl,
			string_to_list(X,Y), /* converting to list to send to apply the above stated rule */
			 write_list2(Y).
			 
/* Comvert from morse to letters or digits by taking user input */			 
			 
convertFromMorse(X):-write('String is '),
			write(X),
			split_string(X, " ","",L), /* dividing the constituent elements of string by taking space as separator */
			nl,
			write_list3(L).