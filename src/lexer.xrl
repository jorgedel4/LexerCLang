% AUTORES:
% ANGEL RUBEN VÁZQUEZ RIVERA  A01735407
% JORGE ANGEL DELGADO MORALES A01551955



%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~DEFINITIONS~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Definitions.

% Numbers
No       = [0-9]

%Punctuators
Pt       = [\%:%:|\%:|\%>|\%|\<%|\:>|\<:|\##|\#|\,|\|=|\^=|\&=|\>>=|\<<=|\-=|\+=|\%=|\/=|\*=|\...|\:|\=|\;|\:|\?|\|\||\&&|\||\^|\!=|\==|\>=|\<=|\>|\<|\>>|\<<|\%|\/|\!|\~|\-|\+|\*|\&|\--|\++|\->|\.|\\]

% Keywords
Kw       = [auto|break|case|const|continue|default|do|double|else|enum|extern|for|goto|if|inline|long|register|restrict|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|volatile|while|\_Alignas|Alignof|\_Atomic|\_Bool|\_Complex|\_Generic|\_Imaginary|\_Noreturn|\_Static_assert|\_Thread_local\_Packed]

% Alfabeto
Alpha    = [A-Z|a-z]

%Keys
Keys     = [\(|\)|\{|\}|\[|\]]

%comillas
Cm       = [\'|\"]

%Initialization
Init     = {(\#include)}

% Data types
Dt       = [int|float|char|void|long]

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~RULES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Rules.

%Char_lists
\"[^"]*\"|\'[^']*\'                                          : {token, {string, TokenLine, TokenChars}}.

%comentario_simple  // blablabla  \
(\/\/)(.)+(\\)                                               : {token, {comment, TokenLine, TokenChars}}.

%comentario_raro // sgdgdfgdf
(\/\/)(.)+[^\\]                                              : {token, {comment, TokenLine, TokenChars}}.

%comentario_multi /* dasfsaf \nefgegergeg\n*/
(\/\*)(.*\n?)*(\*\/)                                         : {token, {commentm, TokenLine, TokenChars}}.

%Positive and negative Integer number
\-{No}+|\-{No}+\.{No}+|{No}+                                 : {token, {integer, TokenLine, TokenChars}}.

%Number float
{No}+\.{No}+                                                 : {token, {float, TokenLine, TokenChars}}.

%Hexa
{No}+[x|X]{No}+                                               : {token, {hex, TokenLine, TokenChars}}.

%Binario
((0[b|B][01]+)|(0[b|B]([01]+_[01]+)+))n?                     : {token, {binary, TokenLine, TokenChars}}.

%Exponencial
{No}+[e|E]?{No}+                                              : {token, {exp, TokenLine, TokenChars}}.

%Exponencial
{No}+[E|e]?\-{No}+                                            : {token, {exp, TokenLine, TokenChars}}.

%Exponencial
{No}+\.{No}+[E|e]?{No}+                                       : {token, {exp, TokenLine, TokenChars}}.

%Exponencial
{No}+\.{No}+[E|e]?\-{No}+                                     : {token, {exp, TokenLine, TokenChars}}.

%Include
\#include                                                    : {token, {include, TokenLine, TokenChars}}.

%complemento include
\<{Alpha}+\.{Alpha}\>                                        : {token, {header, TokenLine, TokenChars}}.

%Data types
int|float|char|string|void|long                              : {token, {dataType, TokenLine, TokenChars}}.

{Alpha}                                                      : {token, {leters, TokenLine, TokenChars}}.

%Key words
auto|break|case|const|continue|default|do|double|else|enum|extern|for|goto|if|inline|long|register|restrict|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|volatile|while|\_Alignas|Alignof|\_Atomic|\_Bool|\_Complex|\_Generic|\_Imaginary|\_Noreturn|\_Static_assert|\_Thread_local\_Packed                       : {token, {keyword, TokenLine, TokenChars}}.

%{Alpha}+|[^((0-9)(\"|\'))]+(.)+[^(\()]                      : {token, {word, TokenLine, TokenChars}}.

{Alpha}+                                                     : {token, {word, TokenLine, TokenChars}}.

%Salto de linea
\n                                                           : {token, {newLine, TokenLine, TokenChars}}.

%Tabulacion
\t                                                           : {token, {tabulacion, TokenLine, TokenChars}}.

%espacio
\s                                                           : {token, {space, TokenLine, TokenChars}}.

% Keys
\(|\)|\{|\}|\[|\]                                            : {token, {keys, TokenLine, TokenChars}}.

%Comillas
\"                                                           : {token, {comilla_doble, TokenLine, TokenChars}}.

%Comilla simple
\'                                                           : {token, {comilla_simple, TokenLine, TokenChars}}.

%punto y coma
\;                                                           : {token, {puntoComa, TokenLine, TokenChars}}.

%Punctuators
\%:%:|\%:|\%>|\%|\<%|\:>|\<:|\##|\#|\,|\|=|\^=|\&=|\>>=|\<<=|\-=|\+=|\%=|\/=|\*=|\...|\:|\=|\:|\?|\|\||\&&|\||\^|\!=|\==|\>=|\<=|\>|\<|\>>|\<<|\%|\/|\!|\~|\-|\+|\*|\&|\--|\++|\->|\.|\\   : {token, {punctuators, TokenLine, TokenChars}}.

Erlang code.