<%--

    Document   : index
    Created on : 14/10/2016, 11:12:04
    Author     : João


    Aqui precisa ter um código que pegue

--%>

<%@page language='java' contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <title>index</title>
    </head>
    <body>
        <%
            String redirectURL = "http://localhost:8080/Biblioteca-Trab1/View/login.jsp";
            response.sendRedirect(redirectURL);
        %>
    </body>
</html>
