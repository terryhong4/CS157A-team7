<%@ page import="java.sql.*, com.team7.jsp.*"%>
<html>
  <head>
    <title>CS157A Team 7</title>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
   </head>
  <body>
    <h1>CS157A Team 7</h1>

    <% 
	    // Create a MySQLAccount object to manage MySQL connection credentials.
	    MySQLAccount acc = new MySQLAccount("cs157ateam7", "root", "ZoinkScoobs42.");
        
    	// Print the test statement to the webpage, Shows how to use functions.
        String test = Util.test();
        out.println(test);
        
        try {
        	// Connect to MySQL database.
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + acc.getDb() + "?autoReconnect=true&useSSL=false", acc.getUser(), acc.getPassword());
            out.println(acc.getDb() + " database successfully opened.<br/><br/>");
            
            // Perform a SQL Query and get the resulting set (rows, values, tiples, etc.)
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM address");
            out.println("Initial entries in table \"address\": <br/>");
            
            /*
             	Display a table using the database information.
             	Maybe but this in a function in Util.java?
             	Need to automate this.
            */
            if (rs.next() != false) {
            	// End JSP, start HTML. Will do this alot.
            	// Write HTML code for the initial table.
            	%>
	  			<table border = 1>
	  			<tr>
	  				<th>address_id</th>
	  				<th>address</th>
	  				<th>district</th>
	  				<th>city_id</th>
	  				<th>postal_code</th>
	  				<th>phone</th>
	  				<th>last_update</th>
	  			</tr>
			  	<%
			  	
			  	// Now populate the table white rs.next() is not false.
			  	do {
			  		%>
			  			<tr>
			  				<td> <%= rs.getString(1) %></td>
			  				<td> <%= rs.getString(2) %></td>
			  				<td> <%= rs.getString(3) %></td>
			  				<td> <%= rs.getString(4) %></td>
			  				<td> <%= rs.getString(5) %></td>
			  				<td> <%= rs.getString(6) %></td>
			  				<td> <%= rs.getString(7) %></td>
			  			</tr>
			  		<%
			  	} while (rs.next());
			  	
			  	// End HTML table tag.
			  	%>
			  	</table>
			  	<%
            } else {
            	out.println("No record found or invalid statement.");
            }
            
            // Close result, query, and connection.
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>
