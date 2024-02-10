#include <iostream>
#include <string>
#include <sstream>
#include <vector>

using namespace std;

// n is the length of arr[]
void insertionSort (int arr[], int n) {
    for (int i = 1; i < n; i++) {
        int val = arr[i];
        int j = i - 1;

        while (j >= 0 && arr[j] > val) {
	        arr [j + 1] = arr[j];
	        j -= 1;
        }

        arr[j + 1] = val;
    }
}

// helper func. to print an array
void printArray (int arr[], int n) {
    for (int i = 0; i < n; i++) {
        cout << arr[i] << " ";
    }

    cout << endl;
}

// entry point
int main() {
    string input;
    cout << "Enter the array elements separated by spaces: ";

    // get an entire line of input, 
    // not just up to the first space
    getline(cin, input);

    // create a dynamically-sized vector 
    // for splitting the input into
    vector<int> arr_vec;
    arr_vec.reserve(input.length());

    // chunk the stream on every space occurrence
    stringstream ss(input);
    string chunk;

    while (getline(ss, chunk, ' ')) {
        try {
            // transform to an int and add to `arr_vec`
            arr_vec.push_back(stoi(chunk));
        } catch (invalid_argument e) {
            // if stoi() fails
            cout << "please enter numbers..." << endl;
            break;
        }
    }

    // vectors store data contiguously
    // so we use v.data() to get the address
    // use it to sort and print
    insertionSort(arr_vec.data(), arr_vec.size());
    printArray(arr_vec.data(), arr_vec.size());

    return 0;
}
