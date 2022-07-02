//test domain of global var define and local define
int a = 3;
int b = 5;
int c = -1;
int d = -200;

int main(){
    //int a = 5;
    int x1[5][3] = {1, 2, 3};
    int x2[5][3] = {1, 2, 3, 4};
    int x3[5][3] = {1, 2, 3, 4, 5, 6};
    int x4[5][3] = {1, 2, 3, {4, 5}, 6};
    return a + b + c + d ;
}