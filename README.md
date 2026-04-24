# Secant Method in MATLAB

## 📌 Overview
The **Secant Method** is a root-finding algorithm that uses a succession of roots of secant lines to better approximate a root of a function. 

### Why use the Secant Method?
* **Derivative-Free Approximation:** Unlike Newton's method, it does not require the calculation of derivatives.
* **Stability in Flat Regions:** Newton's method can fail or diverge if the derivative approaches zero (f'(x) -> 0). The Secant method offers an alternative when the derivative is difficult to compute or undefined.

## ⚖️ Newton-Raphson vs. Secant Method

| Feature | Newton-Raphson Method | Secant Method |
| :--- | :--- | :--- |
| **Derivative Required** | Yes (Needs `f'(x)`) | No (Uses two initial points) |
| **Convergence Speed** | Very Fast (Quadratic) | Relatively Slow (Superlinear) |
| **Failure Risk** | High if `f'(x) -> 0` | Lower, but still requires good initial guesses |

## 🧮 The Formula
The recurrence relation for the Secant Method is defined as:

x(n+1) = x(n) - f(x(n)) * [x(n) - x(n-1)] / [f(x(n)) - f(x(n-1))]

## 💻 How to Use (MATLAB)
```matlab
% Example of how to run the code
f = @(x) x^2 - 4; % Define your function here
x0 = 1;           % First initial guess
x1 = 3;           % Second initial guess
tol = 1e-5;       % Tolerance 

% Call the secant method function
root = secant_method(f, x0, x1, tol);
disp(['The root is: ', num2str(root)]);
