import Foundation

protocol PaymentStrategy {
    func pay(amount: Double)
}

class CreditCardPayment: PaymentStrategy {
    func pay(amount: Double) {
        print("Paying \(amount) using Credit Card")
    }
}

typealias PaymentFunction = (Double) -> Void

enum PaymentOption {
    case classStrategy(PaymentStrategy)
    case funcStrategy(PaymentFunction)
    
    func pay(amount: Double) {
        switch self {
        case .classStrategy(let strategy):
            strategy.pay(amount: amount)
        case .funcStrategy(let function):
            function(amount)
        }
    }
}

let paymentStrategies: [String: PaymentOption] = [
    "creditCard": .classStrategy(CreditCardPayment()),
    "paypal": .funcStrategy({ amount in
        print("Paying \(amount) using PayPal")
    }),
    "bitcoin": .funcStrategy({ amount in
        print("Paying \(amount) using Bitcoin")
    })
]

class PaymentProcessor {
    private var strategy: PaymentOption
    
    init(strategy: PaymentOption) {
        self.strategy = strategy
    }
    
    func setStrategy(_ strategy: PaymentOption) {
        self.strategy = strategy
    }
    
    func pay(amount: Double) {
        strategy.pay(amount: amount)
    }
}

// Usage

let processor = PaymentProcessor(strategy: paymentStrategies["paypal"]!)
processor.pay(amount: 150)

processor.setStrategy(paymentStrategies["creditCard"]!)
processor.pay(amount: 200)