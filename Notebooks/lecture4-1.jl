

### Algoritms and Recursion #####

# Guess-and-check algoritm



function guessandckeck(x)
    #initialize variable
    counter = 1
    # algoritm
    for guess in 0:abs(x)
        if guess^3 > abs(x)
            println("\n$x is not a perfect cube!")
            break
        end
        if guess^3 != abs(x)
            println(counter, "\tGuess = $guess\tGuess Cubed = $(guess^3)")
            counter += 1
        else
            if x < 0
                guess = -guess
            end
            println(counter, "\tGuess = $guess\tGuess cubed = $(guess^3)")
            println("\nThe cube root of $x is $guess.")
            break
        end
    end
end

guessandckeck(7)
guessandckeck(8)
guessandckeck(-8)

# guess and check only works for cubed value and not perfect for negative value. So lets try another algoritm

# Approximate solution

function approximation(x)

    # initialize
    guess = 0.0
    counter = 1
    increment = 0.01
    sensetivity = 0.1

    # algoritm
    while abs(guess^3 - x) >= sensetivity && abs(guess^3) <= abs(x)
        println(counter, "\tGuess = $guess\tGuess cubed = $(guess^3)")
        guess += increment
        counter += 1
    end

    println(counter, "\tGuess = $guess\tGuess cubed = $(guess^3)")
    guess = round(guess, digits = 2)
    x < 0 ? guess = -guess : guess = guess
    println("\nThe cube root of $x is approximately $guess.")
end

approximation(6)


# approximation algoritm works fine but not efficient for large numbers.  So,  Lets look at another algoritm

# Binary search algoritm

function binarysearch(x)

    # initialize

    low = 0
    high = x
    guess = (low + high) /2
    counter = 1
    sensetivity = 0.01

    #algoritm

    while abs(guess^3 -x) ≥ sensetivity
        println(counter, "\tGuess = $guess\tGuess cubed = $(guess^3)")

        if abs(guess^3) < abs(x)
            low = guess
        else
            high = guess
        end

        guess  = (low + high) /2
        counter += 1
        
    end
    println(counter, "\tGuess = $guess\tGuess cubed = $(guess^3)")
    guess = round(guess, digits = 3)
    println("\nThe cube root of $x is approximately $guess.")
end

binarysearch(6)


# performance comparation

using BenchmarkTools

@benchmark guessandckeck(1_000_000)
@benchmark approximation(1_000_000)
@benchmark binarysearch(1_000_000)




# Recursion 

# recursion is a process that divides a problem into sub problem to solve larger one

# think on multipication, Z × 5  =  z + z + z + z + z


# multipication as iteravive solution

function multi_iterative(x,y)
    result = 0

    for i in 1:y
        result += x
        println("$i\t$x * $i\t= $result")
    end

    println("\n$x * $y = $result\n")
    return result 
end


multi_iterative(5,10)

# multipication as recursion

function multi_recursive(x,y)
    if y == 1

        println("multi_recursive($x, $y)\t = $x\n")
        return x
    else

        println("multi_recursive($x, $y)\t = $x + multi_recursive($x, $(y - 1))")
        return x + multi_recursive(x, y - 1)
    end
    
end


multi_recursive(5,10)

# factorial as iterative method

function FactorialIterative(x)
    result = 1

    for i in 1:x
        result *= i

        println("$i factorial = $result")
    end

    println("\nThe Factorial of $x is $result\n")
    return result
end

FactorialIterative(5)

# factorial as recursion method

function FactorialRecursive(x)

    if x == 1

        println("FactorialRecursive($x) = $x\n")
        return 1
    else
        println("FactorialRecursive($x) = $x * FactorialRecursive($(x - 1))")
        return x * FactorialRecursive(x - 1)
    end
end





