<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editor de tarefas</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

</head>
<header>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="./">WEB</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="createoredittask.jsp">Criar tarefas<span class="sr-only"></span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="TaskController?action=listalltask">Listar tarefas</a>
      </li>
    </ul>
  </div>
</nav>
	</header>
<body>
    <div style="padding: 28px;margin-top: 40px;">
        <div class="row">
        <table class="table">
            <thead class="thead-light" >
                    <tr>
                        <th scope="col">Id da tarefa</th>
                        <th scope="col">Nome</th>
                        <th scope="col">Descrição</th>
                        <th scope="col">Tipo</th>
                        <th scope="col">Status da atarefa</th>
                        <th scope="col">Data de criação</th>
                        <th scope="col">Data de atualização</th>
                        <th scope="col">Atribuido para</th>
                        <th scope="col">Data de conclusão</th>
                        <th scope="col" colspan="2">Ações</th>
                    </tr>
            </thead>
            <tbody>
                <c:forEach items="${tasks}" var="task">
            <tr>
                <td><c:out value="${task.id}" /></td>
                <td><c:out value="${task.name}" /></td>
                <td><c:out value="${task.description}" /></td>
                <td><c:out value="${task.typeTask}" /></td>
                <td><c:out value="${task.taskStatus}" /></td>
                <td><c:out value="${task.dateCreated}" /></td>
                <td><c:out value="${task.dateUpdated}" /></td>
                <td><c:out value="${task.assignedTo}" /></td>
                <td><c:out value="${task.dateConclusion}" /></td>
                <td><a href="TaskController.do?action=edit&id=<c:out value="${task.id}"/>">Editar</a></td>
                <form action='TaskController.do' method='delete'>
                	<td><a href="TaskController.do?action=delete&id=<c:out value="${task.id}"/>">Remover</a></td>
                </form>
           	 </tr>
        	</c:forEach>
            </tbody>
     	   </table>
     	  <a href="TaskController.do?action=create"><button class="btn btn-secondary">Nova Tarefa</button></a>
       </div>
     
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean> 
	
	<c:forEach items= "${tasks}" var="task">
		<c:if test="${task.dateConclusion le now}">
			<c:if test="${task.dateConclusion le now}">
				<script>
	        		alert("a atividade " + ${task.id} +"esta atrasada");
	   			 </script>
   			 </c:if>
		</c:if>
	</c:forEach>   
  
    
</div>

   
</body>
</html>
