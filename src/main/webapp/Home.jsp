<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>




<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/home.css">
<title>Home</title>


<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


</head>
<body>
	<section id="home">
	
	<div class="navbar">
        <a href="#home">Home</a>
        <a href="#serviceform">About</a>
        <a href="#services">Contact</a>
        
    </div>
    <h1>Logged User Information</h1>
    <div class="content">
        <h1>Contact Information</h1>
        <table>
            <tr>
                <th>Name</th>
                <td id="name"></td>
                
                
            </tr>
            <tr>
                <th>Email</th>
                <td id="email"></td>
                
            </tr>
            <tr>
            	<th>Contact No.</th>
            	<td id="phone"></td>
            </tr>
             <tr>
            	<th>Country</th>
            	<td id="country"></td>
            </tr>
        </table>
        
        
          <div class="actions">
  		
  	  <form id="logout-form" action="https://api.asgardeo.io/t/learnsahan/oidc/logout" method="POST">
        <input type="hidden" id="client-id" name="client_id" value="">
        <input type="hidden" id="post-logout-redirect-uri" name="post_logout_redirect_uri" value="">
        <input type="hidden" id="state" name="state" value="">
        <button type="submit" class="logoutbtn">Logout</button>
    </form>
        
       
    </div>
    
    
	</section>
	<section id="serviceform">
	<h1>ServicesForm</h1>
	<div class="container">
        <h1>Contact Form</h1>
        <form action="#" method="post">
            <div class="form-group">
                <label for="location">Location:</label>
                <select id="location" name="location">
                    <option selected>Choose...</option>
						    <option value="Colombo">Colombo</option>
				            <option value="Gampaha">Gampaha</option>
				            <option value="Kalutara">Kalutara</option>
				            <option value="Kandy">Kandy</option>
				            <option value="Matale">Matale</option>
				            <option value="Nuwara Eliya">Nuwara Eliya</option>
				            <option value="Galle">Galle</option>
				            <option value="Matara">Matara</option>
				            <option value="Hambantota">Hambantota</option>
				            <option value="Jaffna">Jaffna</option>
				            <option value="Kilinochchi">Kilinochchi</option>
				            <option value="Mannar">Mannar</option>
				            <option value="Vavuniya">Vavuniya</option>
				            <option value="Mullaitivu">Mullaitivu</option>
				            <option value="Batticaloa">Batticaloa</option>
				            <option value="Ampara">Ampara</option>
				            <option value="Trincomalee">Trincomalee</option>
				            <option value="Kurunegala">Kurunegala</option>
				            <option value="Puttalam">Puttalam</option>
				            <option value="Anuradhapura">Anuradhapura</option>
				            <option value="Polonnaruwa">Polonnaruwa</option>
				            <option value="Badulla">Badulla</option>
				            <option value="Monaragala">Monaragala</option>
				            <option value="Ratnapura">Ratnapura</option>
				            <option value="Kegalle">Kegalle</option>
                </select>
            </div>
            <div class="form-group">
                <label for="mileage">Mileage:</label>
                <input type="text" id="mileage" name="mileage">
            </div>
            <div class="form-group">
                <label for="date">Date:</label>
                <input type="date" id="date" name="date">
            </div>
            <div class="form-group">
                <label for="time">Time:</label>
                <input type="time" id="time" name="time">
            </div>
            <div class="form-group">
                <label for="vehicle">Vehicle Type:</label>
                <select id="vehicle" name="vehicle">
                    <option selected>Choose...</option>
						    <option value="AAA-001"> Suzuki-WagonR(2015)</option>
						    <option value="ABC-002">Toyota-Prius(2012)</option>
						    <option value="FG-034">Suzuki-Alto(2019)</option>
						    <option value="QA-004">Dolphin(2011) </option>
						    <option value="CAT-005">Honda-Fit(2020) </option>
                </select>
            </div>
            <input type="hidden" id="usernameForInsert" name="usernameForInsert" value="" >
            <div class="form-group">
                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="4"></textarea>
            </div>
            <div class="form-group">
                <input type="submit" name="submit" id="submit" value="Submit">
            </div>
        </form>
    </div>
    
     <% 
    // Database connection parameters
    String url = "jdbc:mysql://172.187.178.153:3306/isec_assessment2";
    String username = "isec";
    String password = "EUHHaYAmtzbv";
    
    String location = request.getParameter("location");
    String mileageStr = request.getParameter("mileage");
    String vehicle_no = request.getParameter("vehicle");
    String message = request.getParameter("message");
    String userName = request.getParameter("usernameForInsert");
    String dateStr = request.getParameter("date");
    String timeStr = request.getParameter("time");
    
    Connection conn = null;
    
    if(location != null){
	    try {
	        // Establish the database connection
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        conn = DriverManager.getConnection(url, username, password);
	        
	        // Create SQL statement to insert data
	        String sql = "INSERT INTO vehicle_service (date, time, location, mileage, vehicle_no, message, username) VALUES (?, ?, ?, ?, ?, ?, ?)";;
	        PreparedStatement statement = conn.prepareStatement(sql);
	        statement.setString(1, dateStr);
	        statement.setString(2, timeStr);
	        statement.setString(3, location);
	        statement.setString(4, mileageStr);
	        statement.setString(5, vehicle_no);
	        statement.setString(6, message);
	        statement.setString(7, userName);
	        
	        // Execute the SQL statement
	        statement.executeUpdate();
	        
	        out.println("Data inserted successfully!");
	        conn.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	        out.println("Error: " + e.getMessage());
	      
	    } finally {
	        try {
	            if (conn != null) {
	                conn.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            
	        }
	    }
    }
    %>
    
	</section>
	
	<section id="services">

	<h1>Services</h1>
	<form id="serviceTable" method="post" action="#services" onclick="document.getElementById('SelectContainer').style.display='block'">
		<input type="hidden" id="usernameForSelect" name="usernameForSelect" value="" >
		<input type="submit" name="reservations" id="reservations" value="Cick here to see your reservations">
	
	
	</form>
	<div class="container" id="SelectContainer">
        <h1>Booking Details</h1>
        <table>
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Location</th>
                    <th>Mileage</th>
                    <th>Vehicle Number</th>
                    <th>Message</th>
                    <th>Action</th>
                </tr>
            </thead>
            <%
      
        
       ;
        ResultSet rs = null;
        
        try {
            // Establish the database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
            String userNameForSelect = request.getParameter("usernameForSelect");
            // Create a SQL statement
          
            // Execute a query to retrieve booking data
            String sql = "SELECT * FROM vehicle_service WHERE username = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, userNameForSelect); // Use setString to set the parameter value
			rs = stmt.executeQuery();
			if(rs == null){%>
			
				<script>
				
					document.getElementById('SelectContainer').style.display='none';
				
				</script>
				
			<% }
            if (rs.next()) {
            	 Date currentDate = new Date();
            // Iterate through the result set and display data in the table
            while (rs.next()) {
                int bookingId = rs.getInt("booking_id");
                String date = rs.getString("date");
                String time = rs.getString("time");
                String location1 = rs.getString("location");
                String mileage = rs.getString("mileage");
                String vehicleNumber = rs.getString("vehicle_no");
                String message1 = rs.getString("message");
                Date date0 = rs.getDate("date");
        %>
                <tr>
                    <td><%= bookingId %></td>
                    <td><%= date %></td>
                    <td><%= time %></td>
                    <td><%= location1 %></td>
                    <td><%= mileage %></td>
                    <td><%= vehicleNumber %></td>
                    <td><%= message1 %></td>
                    <td><%   if(!date0.before(currentDate)){ %>
                    	<form id="deleteRecord" method="post" action="#services" onclick="document.getElementById('SelectContainer').style.display='block'">
							<input type="hidden" id="idForDelete" name="idForDelete" value=<%= bookingId %> >
							<input type="submit" name="delete" id="delete" value="Delete">
						
						</form>
					                    	
                    <% } %>
                </tr>
        <%
      
            }}
            
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("Error: " + e.getMessage());
            }
        }
        %>
        </table>
    </div>
    
   
    <%
    
    if (request.getParameter("delete") != null){
		    //delete record from database
		    PreparedStatement preparedStatement = null;
		
		    	try {
		    		Class.forName("com.mysql.cj.jdbc.Driver");
		            conn = DriverManager.getConnection(url, username, password);
					String bookingId = request.getParameter("idForDelete");
			    	
			    	int id = Integer.parseInt(bookingId);	  
		
		    	   
		    	    String sql = "DELETE FROM vehicle_service WHERE booking_id = ?";
		
		    	    preparedStatement = conn.prepareStatement(sql);
		
		    	    preparedStatement.setInt(1, id);
		
		    	    int rowsAffected = preparedStatement.executeUpdate();
		    	    
		    	    conn.close();
		    	   
		    	}catch (SQLException e) {
		    	    e.printStackTrace();
		    	    
		    	} 
		    	
    }
    
    
    %>
	</section>
	
	
<script>
$(document).ready(function() {
	var accessToken = localStorage.getItem('accessToken');
	var idToken = localStorage.getItem('idToken');
	
	console.log(accessToken);
	if(accessToken){
		   var settings = {
		            "url": 'https://api.asgardeo.io/t/learnsahan/oauth2/userinfo',
		            "method": "GET",
		            "timeout": 0,
		            "headers": {
		                "Authorization": "Bearer " + accessToken
		            },
		        };
	
		        $.ajax(settings)
		            .done(function (response) {
		                console.log(response);
		                var username =  response.username;
		                var given_name = response.given_name;
		                var phone = response.phone_number;
		                var email = response.email;
		                var username = response.username;
						var address = response.address;
		                var country = address.country;
		                console.log(username);
		               console.log(country);
		                
		                
		                document.getElementById('name').textContent = given_name;
		                document.getElementById('email').textContent = email;
		                document.getElementById('phone').textContent = phone;
		                document.getElementById('country').textContent = country;
		                
		            
		                localStorage.setItem('username', username);
		            
		                 
		             
		            })
		            .fail(function (jqXHR, textStatus, errorThrown) {
		                // Handle any errors here
		                console.error('Error:', errorThrown);
		                alert("Authorization error. Login again!");
		                window.location.href = "./index.jsp";
		            });
	}
	
	
    var username = localStorage.getItem('username')
    console.log(username);
     
     document.getElementById('submit').addEventListener('click', function () {
         // Set the username as a hidden field value in the form
         document.getElementById('usernameForInsert').value = username;
      });
     
     document.getElementById('reservations').addEventListener('click', function () {
         // Set the username as a hidden field value in the form
         document.getElementById('usernameForSelect').value = username;
      });
     
     
     
     	//const idToken = localStorage.getItem('idToken');
 	
 		const state = localStorage.getItem('sessionState');

 	
    document.getElementById("client-id").value = "n6etGd7Se3dD804oM6BORdPoUx4a";
    document.getElementById("post-logout-redirect-uri").value = "http://localhost:8082/Turbo__WHeel/index.jsp";
    document.getElementById("state").value = state;
    
    
    
	
});
	 
	


</script>

</body>
</html>