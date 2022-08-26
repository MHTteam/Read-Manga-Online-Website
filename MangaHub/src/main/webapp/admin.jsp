<%-- 
    Document   : admin.jsp
    Created on : Aug 25, 2022, 2:35:29 PM
    Author     : Huu Minh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>
    <body>
        <div class="container row">
            <div class="col-md-3 col-sm-3">
                <ul>
                    <li>Manga manager</li>
                    <li>
                        User manager
                        <br>
                        <select name="cars" id="cars">
                            <option value="User manager">User manager</option>
                            <option value="Group manager">Group manager</option>
                            <option value="Request manager">Request manager</option>
                        </select>
                    </li>

                </ul>
            </div>
            <div class="col-md-9 col-sm-9">
                
            </div>
        </div>
    </body>
</html>
