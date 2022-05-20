int main() {
    int res[400], i = 1;
    res[0] = 1;
    res[1] = 1;
    while (i < 20) {
        i = i + 1;
        res[i] = res[i - 1] + res[i - 2];
    }
    return 0;

    int a;
    int& x = a;
    int b;
    x = b;
}