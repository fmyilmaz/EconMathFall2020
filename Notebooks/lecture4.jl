using SymPy

# National Income Model

eq1 =  SymFunction("eq1")
eq2 =  SymFunction("eq2")

Y, C, b, I₀, G₀, a = symbols("Y C b I₀ G₀, a")

eq1 = Eq(Y - C, I₀ + G₀)
eq2 = Eq(-b*Y + C, a)

display(eq1)
display(eq2)

row1 = [1 -1 I₀ + G₀]
row2 = [-b 1 a]

system  = sympy.Matrix((row1, row2))

display(system)

solution = linsolve(system, (Y, C))
display(solution)



# Demand and Supply Model

eq1 = SymFunction("eq1")
eq2 = SymFunction("eq2")
eq3 = SymFunction("eq3") 

Qᵈ, Qˢ, a, b, P, f, Y, c, d, g, Pᵢ = symbols("Qᵈ Qˢ a b P f Y c d g Pᵢ")

eq1 = Eq(Qᵈ + b*P, a + f*Y)
eq2 = Eq(Qˢ + d*s, c - g*Pᵢ)
eq3 = Eq(Qᵈ - Qˢ)

row1 = [1 0 b a+f*Y]
row2 = [0 1 -d c-g*Pᵢ]
row3 = [1 -1 0 0]


system = sympy.Matrix(((1, 0, b, a+f*Y), (0, 1, -d, c-g*Pᵢ), (1, -1, 0, 0)))

solution = linsolve(system, (Qᵈ, Qˢ, P))

display(solution)

sympy.init_printing(use_latex = "mathjax")
