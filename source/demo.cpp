//
// This demo is for Lexical-WuXiwen Analysis and Parsing AST
//

float test(int a[6], float x) {
    return a[1] + x;
}

int k[8][6] = {{5}, {8, 2}, 11};

int main() {

    /* comment 1 */

    {}  // comment 2

    const int _abc = 7 + 5 / 3 + 4 * (8 - 2) - k[2 + 3][5] +  (-3 || 4 >= 2) + test(k[6], 16);

    float x = 0.14 + 3 * 1;

    if (x > 3 || x < 2)
        x = x - 2;
    else if (x <= 3.5)
        x = x + 1;
    else { ; }

    while (x < 20) {
        x = x + 3;
    }

    return 0;
}
