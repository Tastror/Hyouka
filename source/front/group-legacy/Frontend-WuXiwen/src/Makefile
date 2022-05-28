../compiler: lex.yy.cpp sysy.tab.cpp main.cpp
	g++ -std=c++17 $^ -o $@

lex.yy.cpp: sysy.l
	flex -o $@ $^

sysy.tab.cpp: sysy.y
	bison -d -o $@ $^
