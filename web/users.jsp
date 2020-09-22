<%@page import="classe.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%
     ArrayList<User> userList = (ArrayList) application.getAttribute("userList");
     if(userList == null){
         userList = new ArrayList();
         userList.add(new User("EU", "eu@gmail.com", "991787899"));
         userList.add(new User("Beatriz", "bia11@hotmail.com", "974155588"));
         userList.add(new User("Joao", "joaozin@outlook.com", "988204548"));
         userList.add(new User("Leonardo", "leosn@gmail.com", "997568798"));
         application.setAttribute("userList", userList);
     }
     if(request.getParameter("add")!=null){
         String name = request.getParameter("name");
         String email = request.getParameter("email");
         String telefone = request.getParameter("telefone");
         userList.add(new User(name, email, telefone));
         response.sendRedirect(request.getRequestURI());
     }
     if(request.getParameter("remove")!=null){
         int i = Integer.parseInt(request.getParameter("i"));
         userList.remove(i);
         response.sendRedirect(request.getRequestURI());
     }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuários - JavaOO</title>
    </head>
    <body>
        <div><a href="index.jsp">Voltar</a></div>
        <h1>JavaOO</h1>
        <h2>Usuários</h2>
        <form method="post">
            Nome: <input type="text" name="name"/>
            Telefone: <input type="number" name="telefone" required="[0-9]"/>
            Email: <input type="text" name="email"/>
            <input type="submit" name="add" value="Adicionar"/>
        </form>
        <hr/>
        <table border="1">
            <tr>
                <th>Índice</th>
                <th>Nome</th>
                <th>Telefone</th>
                <th>Email</th>
                <th>Comandos</th>
            </tr>
            <%for(int i=0; i<userList.size(); i++){%>
                <% User user = userList.get(i); %>
                <tr>
                    <td><%= i %></td>
                    <td><%= user.getName() %></td>
                    <td><%= user.getTelefone() %></td>
                    <td><%= user.getEmail() %></td>
                    <td>
                        <form>
                            <input type="submit" name="remove" value="Remover"/>
                            <input type="hidden" name="i" value="<%= i %>"/>
                        </form>
                    </td>
                </tr>
            <%}%>
        </table>
    </body>
</html>
