
import Cocoa

extension Array where Element: Equatable {
    mutating func removeObject(object: Element) {
        if let index = self.indexOf(object) {
            self.removeAtIndex(index)
        }
    }
    
    mutating func removeObjectsInArray(array: [Element]) {
        for object in array {
            self.removeObject(object)
        }
    }
}

class Container<T: Comparable> {
    private var items: [T] = []
    
    func add(item:T) {
        items.append(item)
    }
    
    func remove(item:T) {
        items.removeObject(item)
    }
    
    func removeSmallest() -> Bool
    {
        guard let item = items.minElement() else
        {
            return false
        }
        items.removeObject(item)
        return true
    }
}

var con1 = Container<Double>()
var con2 = Container<String>()

class Product: Comparable
{
    var name: String
    var price: Double
    
    init(name: String, price:Double)
    {
        self.name = name
        self.price = price
    }
}


// Only need to implement < and ==
// Standard library will supply <=, >, >=, and !=
func < (lhs: Product, rhs: Product) -> Bool {
    return lhs.price < rhs.price
}

func == (lhs: Product, rhs: Product) -> Bool{
    return lhs.price == rhs.price
}

var container = Container<Product>()
let prod1 = Product(name:"Lettuce",price:1.49)
let prod2 = Product(name:"Spinach",price:2.99)
container.add(prod1)
container.add(prod2)
print("Count\(container.items.count)")
container.removeSmallest()
print(container.items.count)
print(container.items[0].name)






