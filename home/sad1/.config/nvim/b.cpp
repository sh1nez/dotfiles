#include <iostream>


using namespace std;

int main() {
    freopen("input.txt", "r", stdin);
    int len;
    cin >> len;
    int arr[len];
    for (int i = 0; i<len; ++i){
        cin >> arr[i];
    }
    int maxim = 0;
    for (int i = 1; i < sizeof(arr)/sizeof(int); ++i){
        int num = min(arr[i], arr[i-1]);
        if (num > maxim){
            maxim = num;
    }
    cout << maxim;
    // for (int i : arr){
    //     cout << i << " ";
    }
}
