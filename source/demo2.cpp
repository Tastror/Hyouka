//
// Created by Tastror on 2022/6/1.
//

int test(int x, int y) {
    return x + y;
}

int main() {
    float s = 75;
    int crash = 75;
    int k = test(1 + s, crash * 2);
    return 0;
}