import Foundation

// Stratergy Protocol
public protocol Strategy {
    var strategyProperty: String { get }
    func strategyMethod() -> String
}

// Strategies or Concrete Strategies
public class StrategyA: Strategy {
    
    public init() {}
    
    public var strategyProperty: String {
        return "Property from StrategyA"
    }
    
    public func strategyMethod() -> String {
        return "Method from StrategyA"
    }
}

public class StrategyB: Strategy {
    
    public init() {}
    
    public var strategyProperty: String {
        return "Property from StrategyB"
    }
    
    public func strategyMethod() -> String {
        return "Method from StrategyB"
    }
}

public class StrategyC: Strategy {
    
    public init() {}
    
    public var strategyProperty: String {
        return "Property from StrategyC"
    }
    
    public func strategyMethod() -> String {
        return "Method from StrategyC"
    }
}

/*
 Object Using Stratergy
 
 This can be think of context as well, so that when this class gets initialized we need to tell what strategy will it use,
 in this way this class can work without concrete implementation about strategy protocol
 */
public class StrategyPattern {
    
    var strategy: Strategy
    
    public init(_ strategy: Strategy) {
        self.strategy = strategy
    }
    
    public func createObject() {
        print(strategy.strategyMethod())
        print(strategy.strategyProperty)
    }
}
