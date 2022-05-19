#include <regex>
#include "../Lexical-Tastror/include/Lex.h"
#include <iostream>
#include "../Define/include/define.h"

using namespace std;

TNP token_head = std::make_shared<token_node>();
TNP now = token_head;

ifstream ifs;
ofstream ofs;

void save_node(token_type type, string data, int row, int col)
{
    now->data = data;
    now->type = type;
    now->int_or_double = 0;
    now->column = col;
    now->line = row;
    now->next = std::make_shared<token_node>();
    now = now->next;
}

void save_node(int value, int row, int col)
{
    now->value.int_value = value;
    now->type = NUMBER;
    now->int_or_double = 1;
    now->column = col;
    now->line = row;
    now->next = new token_node();
    now = now->next;
}

void save_node(double value, int addon, int row, int col)
{
    now->value.double_value = value;
    now->type = NUMBER;
    now->int_or_double = 2;
    now->column = col;
    now->line = row;
    now->next = new token_node();
    now = now->next;
}

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

string match_id(string read_buffer, int line, int column)
{
    regex id("([a-zA-Z]|_)([0-9a-zA-Z]|_)*");
    regex key("if|while|else");
    smatch match;
    if (regex_search(read_buffer, match, id))
    {
        string result = match[0].str();
    }
}

string match_number(string read_buffer, int line, int column)
{
    regex dec_int("[0-9]+");
    regex dec_float("[0-9]+\\.[0-9]+");
    regex dec_float_e("[0-9]+\\.[0-9]+e[+|-]?[0-9]+");
    regex oct_int("0[0-7]+");
    regex hex_int("0[x|X][0-9a-fA-F]+");
    smatch match;
    if (regex_search(read_buffer, match, dec_float))
    {
        string result = match[0].str();
        double value = stod(result);
        save_node(value, 1, line, column);
        ofs << result << endl;
        ofs << read_buffer.substr(result.size()) << endl;
        return read_buffer.substr(result.size());
    }
    if (regex_search(read_buffer, match, dec_float_e))
    {
        string result = match[0].str();
        double value = stod(result);
        save_node(value, 1, line, column);
        ofs << result << endl;
        ofs << read_buffer.substr(result.size()) << endl;
        return read_buffer.substr(result.size());
    }
    if (regex_search(read_buffer, match, hex_int))
    {
        string result = match[0].str();
        int value = stoi(result);
        save_node(value, line, column);
        ofs << result << endl;
        ofs << read_buffer.substr(result.size()) << endl;
        return read_buffer.substr(result.size());
    }
    if (regex_search(read_buffer, match, dec_int))
    {
        string result = match[0].str();
        int value = stoi(result);
        save_node(value, line, column);
        ofs << result << endl;
        ofs << read_buffer.substr(result.size()) << endl;
        return read_buffer.substr(result.size());
    }
    if (regex_search(read_buffer, match, oct_int))
    {
        string result = match[0].str();
        int value = stoi(result);
        save_node(value, line, column);
        ofs << result << endl;
        ofs << read_buffer.substr(result.size()) << endl;
        return read_buffer.substr(result.size());
    }
    return string("");
}

int main()
{
    char c;
    string read_buffer;
    int row = 0, col = 0;
    ifs.open("testnum.c");
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
        while (read_buffer.size() > 0)
        {
            if (is_number(read_buffer.at(0)) || read_buffer.at(0) == '.')
            {
                read_buffer = match_number(read_buffer, row, col);
            }
            if (is_letter(read_buffer.at(0)) || read_buffer.at(0) == '_')
            {
                read_buffer = match_id_key(read_buffer, row, col);
            }

            read_buffer.clear();
        }
    }
    ifs.close();
    ofs.close();
}