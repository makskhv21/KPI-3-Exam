import Foundation

protocol CompressionStrategy {
    func compress(data: Data) -> Data
}

class ZipCompression: CompressionStrategy {
    func compress(data: Data) -> Data {
        print("Compressing data using ZIP")
        return data 
    }
}

class RarCompression: CompressionStrategy {
    func compress(data: Data) -> Data {
        print("Compressing data using RAR")
        return data
    }
}

class SevenZipCompression: CompressionStrategy {
    func compress(data: Data) -> Data {
        print("Compressing data using 7-Zip")
        return data
    }
}

class Compressor {
    private var strategy: CompressionStrategy
    
    init(strategy: CompressionStrategy) {
        self.strategy = strategy
    }
    
    func setStrategy(_ strategy: CompressionStrategy) {
        self.strategy = strategy
    }
    
    func compress(data: Data) -> Data {
        return strategy.compress(data: data)
    }
}

let strategies: [String: CompressionStrategy] = [
    "zip": ZipCompression(),
    "rar": RarCompression(),
    "7zip": SevenZipCompression()
]

// Usage

let data = Data("Example data".utf8)
let compressor = Compressor(strategy: strategies["zip"]!)

compressor.compress(data: data)       

compressor.setStrategy(strategies["7zip"]!)
compressor.compress(data: data)