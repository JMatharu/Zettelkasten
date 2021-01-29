/*
 Behavioral Patterns
 */

//1. Strategy Pattern
print("-------- Strategy Pattern Start --------")
let strategyA = StrategyPattern(StrategyA())
strategyA.createObject()
let strategyB = StrategyPattern(StrategyB())
strategyB.createObject()
let strategyC = StrategyPattern(StrategyC())
strategyC.createObject()
print("-------- Strategy Pattern End --------")
