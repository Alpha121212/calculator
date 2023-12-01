<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Calculator</title>
</head>
<body>

    <h2>Simple Calculator</h2>

    <form action="calculator.jsp" method="post">
        <input type="text" name="num1" placeholder="Enter number 1" required>
        <select name="operator">
            <option value="+">+</option>
            <option value="-">-</option>
            <option value="*">*</option>
            <option value="/">/</option>
        </select>
        <input type="text" name="num2" placeholder="Enter number 2" required>
        <input type="submit" value="Calculate">
    </form>

    <%!
        double calculate(double num1, double num2, String operator) {
            switch (operator) {
                case "+":
                    return num1 + num2;
                case "-":
                    return num1 - num2;
                case "*":
                    return num1 * num2;
                case "/":
                    if (num2 != 0) {
                        return num1 / num2;
                    } else {
                        return Double.NaN; // Handle division by zero
                    }
                default:
                    return Double.NaN; // Invalid operator
            }
        }
    %>

    <%
        if (request.getMethod().equalsIgnoreCase("POST")) {
            double num1 = Double.parseDouble(request.getParameter("num1"));
            double num2 = Double.parseDouble(request.getParameter("num2"));
            String operator = request.getParameter("operator");

            double result = calculate(num1, num2, operator);
    %>

        <h3>Result:</h3>
        <p><%= num1 %> <%= operator %> <%= num2 %> = <%= result %></p>

    <%
        }
    %>

</body>
</html>

