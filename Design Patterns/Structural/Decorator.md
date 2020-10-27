# Decorator Pattern
The Decorator pattern attaches additional responsibilities to an object dynamically. Decorator provide a flexible alternative to sub classing for extending functionality.

---
## Motivation 
- Sometimes we want to add responsibilities to individual objects, not to entire class.
- Ex - GUI will let you add properties like borders or behaviors like scrolling to any user interface component
- One way to add responsibility is with _inheritance_
	- Inheriting a border from another class put border around every subclass instance
	- This is inflexible, because the choice of border is made statically
	- A client can't control how and when to decorate the component with a border
- More flexible approach
	- Enclosed the component into another object that adds the border
	- The enclosing object is called ***Decorator***
	- The decorator confirms to the interface of the component it decorates so that its presence is transparent to the components clients
	- Decorator forwards request to the component and may perform additional actions (like drawing a border) before or after forwarding
	- Transparency lets you nest decorators recursively there by allowing an unlimited number of added responsibilities

### Example 
- TextView Object 
	- Text view has no scroll bar by default, because we might not always need them
	- When we do we can use ScrollDecorator to add them 
	- Suppose we also want to add thick black border around the TextView
	- We can use BorderDecorator to add this as well 
	- We simply expose the decorator with TextView to produce the desired result

![](Screen%20Shot%202020-10-25%20at%209.58.54%20PM.png)

- The ScrollDecorator and BorderDecorator classes are subclasses of Decorator an _abstract class_ for visual components that decorate other visual components 

![](Screen%20Shot%202020-10-26%20at%209.09.11%20PM.png)

- VisualComponent is the abstract clkass for visual objects.
	- This defines their drawing and even handling interface
- Decorator class simply forwards draw requests to its components and how decorator subclass can extend this operation
	- Decorator subclass are free to add operations for specific functionality
	- For example, ScrollDecorator's ScrollTo operation lets other objec ts scroll the interface if they know there happens to be a ScrollDecorator object in the interface
- The important aspect of this pattern is that it lets decorators appear anywhere a VisualComponent can.
	- That way clients generally can't tell the difference between a decorated component and an undecorated one, and so they don't depend at all on the decoration.

---
## Applicability 
Use Decorator 
- to add responsibility to individual objects dynamically and transparently, that is, without affecting other objects
- for responsibility that can be withdrawn
- when extension of subclass is impractical 
- A class definition may be hidden or otherwise unavailable for sub classing.

---
## Structure
![](Screen%20Shot%202020-10-25%20at%209.04.32%20PM.png)

-	__Component__ (VisualComponent)
	-	defines the interface for objects that can have responsibilities added to them added dynamically
-	__ConcreteComponent__ (TextView)
	-	defines an object to which additional responsibilities can be attached
-	__Decorator__ 
	-	Maintains a reference to a Component object and defines an interface that conforms to component's interface.
-	__ConcreteDecorator__ (BorderDecorator, ScrollDecorator)
	-	adds responsibility to the component

---
## Collaborations
- Decorator forwards requests to its component object. It may optionally perform additional operations before and after forwarding the request.

## Consequences
#### Benefits
- q

#### Drawbacks
- a

---
## Implementation
![](Screen%20Shot%202020-10-26%20at%209.18.00%20PM.png)

### Interface / Component
```swift
protocol Pizza {
    var description: String { get }
    var cost: Double { get }
}
```

### Concrete Class
```swift
class PlainPizza: Pizza {
    var description: String = "Thin Dough"
    var cost: Double = 4.00
}
```

### Decorator
```swift
protocol ToppingDecorator: Pizza {
    var pizza: Pizza { get }
}
```

### ConcreteDecorators
```swift
struct Mozzarella: ToppingDecorator {
    let pizza: Pizza
    
    var description: String {
        return pizza.description + ", Mozzarella"
    }
    
    var cost: Double {
        return pizza.cost + 0.20
    }
}

struct TomatoSauce: ToppingDecorator {
    var pizza: Pizza
    
    var description: String {
        return pizza.description + ", Tomato Sauce"
    }
    
    var cost: Double {
        return pizza.cost + 0.35
    }
}
```

### Usage
```swift
var basicPizza: Pizza = PlainPizza()
basicPizza = Mozzarella(pizza: basicPizza)
basicPizza = TomatoSauce(pizza: basicPizza)
basicPizza.cost // 4.55
basicPizza.description // "Thin Dough, Mozzarella, Tomato Sauce"
```
___

Pattern Type - #structural

Related Patterns - 
- [Composite](Composite.md) - A decorator can be viewed as a degenerate composite with only one component. However, a decorator adds additional responsibilities—it isn't intended for object aggregation
- [Strategy](Strategy.md) - A decorator lets you change the skin of an object; a strategy lets you change the guts. These are two alternative ways of changing an object.
- [Adapter](Adapter.md) - A decorator is different from an adapter in that a decorator only changes an object's responsibilities,not its interface; an adapter will give an object a completely new interface.