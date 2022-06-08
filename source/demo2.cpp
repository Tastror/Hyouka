//
// Created by Tastror on 2022/6/1.
//

int test(int x, int y, int fuck[2]) {
    return x + y;
}

float kkk[2] = {1, 2.2};

int main() {
    int test_array[4][3] = {{1}, {2, 4}, 3};
    float s = 75;
    int crash = 75;
    test(1, 2, test_array[2]);
    int x = 1 || test(1, 2, test_array[2]);
    int k = test(1 + s, crash * (2 + 5), test_array[0]);
    return 0;
}