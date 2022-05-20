//
// Created by Tastror on 2022/5/20.
//

#include "Lex.h"

std::vector<char> Lexical::operator_begin_list = {'|', '&', '<', '>', '=', '!', '+', '-', '*', '/', '%', '[', ']', '(', ')'};
std::vector<char> Lexical::double_operator_begin_list = {'|', '&', '<', '>', '=', '!', '/'};
std::vector<std::string> Lexical::single_operator_list = {"<", ">", "=", "!", "+", "-", "*", "/", "%", "[", "]", "(", ")"};
std::vector<std::string> Lexical::double_operator_list = {"||", "&&", "<=", ">=", "==", "!="};
std::vector<std::string> Lexical::comment_list = {"//", "/*"};

std::vector<char> Lexical::punctuation_begin_list = {'{', '}', ';', ','};
std::vector<std::string> Lexical::punctuation_list = {"{", "}", ";", ","};

std::vector<std::string> Lexical::keyword_list = {"const", "int", "float", "if", "else", "while", "break", "continue", "return"};