#include"../Lexical-Tastror/include/Lex.h"
#include<iostream>
#include"../Define/include/define.h"

using namespace std;

token_node* token_head=new token_node();
token_node* now=token_head;


void match_number(char c,ifstream ifs){
    string token;
    token.push_back(c);
    if(c=='0'){
        ifs.get(c);
        token.push_back(c);
        if(c=='x'||c=='X'){
            ifs.get(c);
            token.push_back(c);
            if(c>='0'&&c<='9'||c>='a'&&c<='f'||c>='A'&&c<='F'){
                ifs.get(c);
                token.push_back(c);
                while(c>='0'&&c<='9'||c>='a'&&c<='f'||c>='A'&&c<='F'){
                    ifs.get(c);
                    token.push_back(c);
                }
            }
            else{
                cout<<"Error: "<<c<<" is not a number"<<endl;
                return;
            }
        }
        else if(c>='0'&&c<='9'){
            ifs.get(c);
            token.push_back(c);
            
            while(c>='0'&&c<='9'){
                ifs.get(c);
                token.push_back(c);
            }
        }
        else{
            cout<<"Error: "<<c<<" is not a number"<<endl;
            return;
        }
    }
    else if(c>='1'&&c<='9'){
        ifs.get(c);
        token.push_back(c);
        while(c>='0'&&c<='9'){
            ifs.get(c);
            token.push_back(c);
        }
    }
    else{
        cout<<"Error: "<<c<<" is not a number"<<endl;
        return;
    }
    cout<<"Interger: "<<token<<endl;
}



bool is_punct(char c){
    if(c==';'||c==','||c=='{'||c=='}')
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

int main(){
    char c;
    ifstream ifs;
    ifs.open("test.c");
    if(!ifs.is_open()){
        cout<<"open file error"<<endl;
        return 0;
    }
    while (!ifs.eof()) {
        ifs.get(c);
        if(is_number(c)){
            match_interger(c,ifs);
        }
    }
}
