import Foundation

protocol DiscountStrategy {
    func apply(price: Double, customerType: String) -> Double
}

class NoDiscount: DiscountStrategy {
    func apply(price: Double, customerType: String) -> Double {
        print("No discount applied")
        return price
    }
}

class VIPDiscount: DiscountStrategy {
    func apply(price: Double, customerType: String) -> Double {
        let discounted = customerType == "VIP" ? price * 0.8 : price
        print("VIP discount applied: \(discounted)")
        return discounted
    }
}

class SeasonalDiscount: DiscountStrategy {
    func apply(price: Double, customerType: String) -> Double {
        let discounted = price * 0.9
        print("Seasonal discount applied: \(discounted)")
        return discounted
    }
}

let discountStrategies: [String: DiscountStrategy] = [
    "none": NoDiscount(),
    "vip": VIPDiscount(),
    "seasonal": SeasonalDiscount()
]

class Checkout {
    private var strategy: DiscountStrategy
    
    init(strategy: DiscountStrategy) {
        self.strategy = strategy
    }
    
    func setStrategy(_ strategy: DiscountStrategy) {
        self.strategy = strategy
    }
    
    func finalPrice(price: Double, customerType: String) -> Double {
        return strategy.apply(price: price, customerType: customerType)
    }
}

// Usage

let checkout = Checkout(strategy: discountStrategies["none"]!)
print(checkout.finalPrice(price: 100, customerType: "Regular"))

checkout.setStrategy(discountStrategies["vip"]!)
print(checkout.finalPrice(price: 100, customerType: "VIP"))

checkout.setStrategy(discountStrategies["seasonal"]!)
print(checkout.finalPrice(price: 100, customerType: "Regular"))