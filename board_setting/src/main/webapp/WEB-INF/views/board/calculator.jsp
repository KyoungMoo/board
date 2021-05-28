<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Calculator</title>
		<style type="text/css">
			table {
	    		border-collapse: collapse;
	    		}
			td {padding: 5px 10px;
				text-align: center;
				}
			input {
				text-align:right;
				border: none;
				}
			input:focus {
    			outline: none;
    			}
		</style>
		<script>
	        function add(char) {
	            var display = document.getElementById('display'); 
	            display.value = display.value + char;
	            
	        }
	        function calculate() {
	            var display = document.getElementById('display');
	            var result = eval(display.value); 
	            document.getElementById('display').value = result;
	        }
	        function bs() {
	        	cal.display.value =
		        cal.display.value.substring(0, display.value.length-1);
	        }

	    </script>



	</head>
	<body>	
		<h3>계산기!</h3>
		<form name="cal">
		  <table border="1">
        <tr>
            <td colspan="4">
                <input type="text" id="display" >
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <input type="text" id="result" readonly="readonly">
            </td>
        </tr>
        <tr>
            <td onclick="add(7)">7</td>
            <td onclick="add(8)">8</td>
            <td onclick="add(9)">9</td>
            <td onclick="add('*')">*</td>
        </tr>
        <tr>
            <td onclick="add(4)">4</td>
            <td onclick="add(5)">5</td>
            <td onclick="add(6)">6</td>
            <td onclick="add('-')">-</td>
        </tr>
        <tr>
            <td onclick="add(1)">1</td>
            <td onclick="add(2)">2</td>
            <td onclick="add(3)">3</td>
            <td onclick="add('+')">+</td>
        </tr>
        <tr>
        	<td onclick="bs()">Del</td>
            <td onclick="add(0)">0</td>
            <td onclick="add('.')">.</td>
            <td onclick="calculate()">=</td>
        </tr>

    </table>
    </form>
		
	</body>
</html>