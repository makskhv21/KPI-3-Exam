import Foundation

typealias EncryptionStrategy = (String) -> String

func caesarCipher(_ input: String) -> String {
    print("Encrypting with Caesar Cipher")
    let shifted = input.unicodeScalars.map {
        Character(UnicodeScalar(($0.value + 3) % 128)!)
    }
    return String(shifted)
}

func reverseCipher(_ input: String) -> String {
    print("Encrypting with Reverse Cipher")
    return String(input.reversed())
}

func base64Cipher(_ input: String) -> String {
    print("Encrypting with Base64 Cipher")
    let data = input.data(using: .utf8)!
    return data.base64EncodedString()
}

let encryptionStrategies: [String: EncryptionStrategy] = [
    "caesar": caesarCipher,
    "reverse": reverseCipher,
    "base64": base64Cipher
]

class Encryptor {
    private var strategy: EncryptionStrategy
    
    init(strategy: @escaping EncryptionStrategy) {
        self.strategy = strategy
    }
    
    func setStrategy(_ strategy: @escaping EncryptionStrategy) {
        self.strategy = strategy
    }
    
    func encrypt(_ text: String) -> String {
        return strategy(text)
    }
}

// Usage

let encryptor = Encryptor(strategy: encryptionStrategies["caesar"]!)
print(encryptor.encrypt("Hello World!"))

encryptor.setStrategy(encryptionStrategies["reverse"]!)
print(encryptor.encrypt("Hello World!"))

encryptor.setStrategy(encryptionStrategies["base64"]!)
print(encryptor.encrypt("Hello World!"))