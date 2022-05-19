#include <regex>
#include "../Lexical-Tastror/include/Lex.h"
#include <iostream>
#include "../Define/include/define.h"

using namespace std;

token_node *token_head = new token_node();
token_node *now = token_head;

ifstream ifs;
ofstream ofs;

bool is_punct(char c)
{
    if (c == ';' || c == ',' || c == '{' || c == '}')
        return true;
    return false;
}

bool is_number(char c)
{
    if (c >= '0' && c <= '9')
        return true;
    return false;
}

bool is_letter(char c)
{
    if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))
        return true;
    return false;
}

bool is_blank(char c)
{
    if (c == ' ' || c == '\t' || c == '\n' || c == '\r')
        return true;
    return false;
}

void match(string read_buffer, int line, int column)
{
    regex dec_int("[0-9]+");
    regex dec_float("[0-9]+\\.[0-9]+");
    regex dec_float_e("[0-9]+\\.[0-9]+e[+|-]?[0-9]+");
    regex oct_int("0[0-7]+");
    regex hex_int("0[x|X][0-9a-fA-F]+");
    smatch match;
    if (regex_search(read_buffer, match, dec_int))
    {
        now->value.double_value = stoi(match.str());
        ofs<<match.str()<<endl;
        now->int_or_double = 1;
        now->type = NUMBER;
        now->line = line;
        now->column = column;
        now->next = new token_node();
        now = now->next;
        return;
    }
    return;
}

int main()
{
    char c;
    string read_buffer;
    int row = 0, col = 0;
    ifs.open("test.c");
    ofs.open("out.txt");
    if (!ifs.is_open())
    {
        cout << "open file error" << endl;
        return 0;
    }
    while (!ifs.eof())
    {
        ifs >> read_buffer;

        cout << read_buffer << endl;
        if (read_buffer.size() > 0)
        {
            match(read_buffer, row, col);
            read_buffer.clear();
        }
    }
    ifs.close();
    ofs.close();
}