# Strategy Pattern
Defines a family of algorithms, encapsulate each one and makes them interchangeable Strategy lets algorithm vary independently from client that uses it.

![](Screen%20Shot%202020-10-18%20at%207.17.08%20PM.png)

- **Object using strategy** - Any object that needs an interchangeable behavior (in iOS mostly this is View Controller)
-  **Strategy Protocol** - Method that every strategy must implement
-  **Strategies** - Object that confirms to strategy protocols 

---
## Applicability
Use Strategy pattern when
- Many related classes digger only in their behavior Strategies provide a way to configure a class with one of many behaviors
- You need different variant of an algorithm
- Algorithm uses data that clients shouldn't know about. Use the Strategy pattern to avoid exposing complex algorithm specific structures
- Intended to be easily interchangeable at runtime

>*Favor composition over inheritance*

---

## Structure
![](Screen%20Shot%202020-10-18%20at%209.28.32%20PM.png)

- **Strategy** (Compositor)
	- Declared an interface common to all supported algorithms. Context uses this interface to call the algorithm defined by a ConcreteStrategy.
- **ConcreteStrategy** (SimpleCompositor, TeXCompositor, ArrayCompositor)
	- implements the algorithm using the Strategy interface
- **Context** (Composition)
	- Is configured with ConcreteStrategy object 
	- Maintain s a reference to a Strategy Object 
	- May define an interface that lets strategy access its data 

---
## Collaboration 
- Strategy and Context interact to implement the chosen algorithm.
- A context may pass a ll data required by the algorithm to the strategy when the algorithm is called.
- Alternatively, the context can pass itself as an argument to Strategy operations. That lets the strategy call back on the context as required.
- A context forwards requests from its clients to its strategy.
- Clients usually create and pass a ConcreteStrategy object to the context; thereafter, clients interact with the context exclusively.
- There is often a family of ConcreteStrategy classes for a client to choose from.

---

## Consequences
#### Benefits
1. ___Families of related algorithms___ -  Hierarchies of Strategy classes define a family of algorithms or behaviors for context to reuse. Inheritance can help factor out common functionality of the algorithm.
2. ___An alternate of Subclassing___ - Inheritance offers another way to support a variety of algorithms or behaviors. You can subclass a context class but that will create mixes of algorithm implementation with context making context harder to understand, maintain and extend. _Encapsulating_ the algorithm in separate strategy classes lets you vary the algorithm independently of its context, making it easier to switch, understand and extend.
3.  ___Strategies eliminates conditional statements___
4.  ___A choice of implementations___ - Strategies can provide different implementations of same behavior. The client can choose among strategies with different time and space trade offs

#### Drawbacks 
1. ___Client must be aware of different strategies___ - Client must understand how Strategies differ before it can select the appropriate one. Client might be exposed to implementation issues.
2. ___Communication overhead between Client and Strategy___ - The Strategy interface is shared by all ConcreteStartegy classes weather the algorithms they implement are trivial or complex. There will be times when the context creates and initialize parameters that never gets used.
3. ___Increased number of objects___ - You can reduce this overhead by implementing strategies as stateless objects that context can share. Residual state maintained by context, which passes it in each Strategy object. Shared Strategy should not maintain state across invocations. More details in [Flyweight](Flyweight.md)

---
## Implementation
#### Strategy
```swift
protocol Strategy {
    var strategyProperty: String { get }
    
    func strategyMethod() -> String
}
```

#### Concrete Strategies
```swift
class ConcreteStrategyA: Strategy {
    var strategyProperty: String {
        return "Property from Concrete Stategy A"
    }
    
    func strategyMethod() -> String {
        return "Method from Concrete Strategy A"
    }
}

class ConcreteStrategyB: Strategy {
    var strategyProperty: String {
        return "Property from Concrete Stategy B"
    }
    
    func strategyMethod() -> String {
        return "Method from Concrete Strategy B"
    }
}

class ConcreteStrategyC: Strategy {
    var strategyProperty: String {
        return "Property from Concrete Stategy C"
    }
    
    func strategyMethod() -> String {
        return "Method from Concrete Strategy C"
    }
}
```

#### Context
```swift
class Context {
    private(set) var strategy: Strategy!
    
    init(_ strategy: Strategy) {
        self.strategy = strategy
    }
}

```

#### Usage
```swift
let strategyA = ConcreteStrategyA()
let strategyAContext = Context(strategyA)
strategyAContext.strategy.strategyMethod() // "Method from Concrete Strategy A"
strategyAContext.strategy.strategyProperty // "Property from Concrete Stategy A"

let strategyB = ConcreteStrategyB()
let strategyBContext = Context(strategyB)
strategyBContext.strategy.strategyMethod() // "Method from Concrete Strategy B"
strategyBContext.strategy.strategyProperty // "Property from Concrete Stategy B"

let strategyC = ConcreteStrategyC()
let strategyCContext = Context(strategyC)
strategyCContext.strategy.strategyMethod() // "Method from Concrete Strategy C"
strategyCContext.strategy.strategyProperty // "Property from Concrete Stategy C"

```
---

Pattern Type - #behavior
Related Patterns - [Flyweight](Flyweight.md), [Singleton](Singleton.md)