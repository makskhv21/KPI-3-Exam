import Foundation

typealias SortingStrategy = ([Int]) -> [Int]

func bubbleSort(_ array: [Int]) -> [Int] {
    var arr = array
    for i in 0..<arr.count {
        for j in 1..<arr.count - i {
            if arr[j] < arr[j-1] {
                arr.swapAt(j, j-1)
            }
        }
    }
    print("Sorting using Bubble Sort")
    return arr
}

func quickSort(_ array: [Int]) -> [Int] {
    if array.count <= 1 { return array }
    let pivot = array[array.count / 2]
    let less = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    let greater = array.filter { $0 > pivot }
    print("Sorting using Quick Sort")
    return quickSort(less) + equal + quickSort(greater)
}

func insertionSort(_ array: [Int]) -> [Int] {
    var arr = array
    for i in 1..<arr.count {
        var j = i
        let key = arr[j]
        while j > 0 && arr[j-1] > key {
            arr[j] = arr[j-1]
            j -= 1
        }
        arr[j] = key
    }
    print("Sorting using Insertion Sort")
    return arr
}

let sortingStrategies: [String: SortingStrategy] = [
    "bubble": bubbleSort,
    "quick": quickSort,
    "insertion": insertionSort
]

class Sorter {
    private var strategy: SortingStrategy
    
    init(strategy: @escaping SortingStrategy) {
        self.strategy = strategy
    }
    
    func setStrategy(_ strategy: @escaping SortingStrategy) {
        self.strategy = strategy
    }
    
    func sort(array: [Int]) -> [Int] {
        return strategy(array)
    }
}

// Usage

let numbers = [5, 3, 8, 6, 2]
let sorter = Sorter(strategy: sortingStrategies["bubble"]!)
print(sorter.sort(array: numbers))

sorter.setStrategy(sortingStrategies["quick"]!)
print(sorter.sort(array: numbers))