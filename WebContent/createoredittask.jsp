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
 	<a class="navbar-brand" href="#">WEB</a>
 	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
  	</button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="createoredittask.jsp">Criar tarefas<span class="sr-only"></span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="TaskController?action=listalltask">Listar tarefas</a>
      </li>
    </ul>
  </div>
</nav>
	</header>
	<body>
   	 <div class="container col-md-6 .offset-md-3" style="margin-top: 40px;">
   	 <div>
        <h3>Crie uma nova tarefa</h3>
   		 </div>
        <form action='TaskController.do' method='post'>
            <div class="form-group">
            	<input type='hidden' name='id' value="${task.id}">
            </div>
            <div class="form-group">
                <input type="name" class="form-control" name="name" placeholder="Nome" value="${task.name}">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="description" placeholder="Descrição" value="${task.description}">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="typeTask" placeholder="Tipo" value="${task.typeTask}">
            </div>
  				<select class="form-control" name="taskStatus">
 			  		 <option value="planejada">Planejada</option>
  			 		 <option value="andamento">Em andamento</option>
  			 		 <option value="concluida">Concluída</option>
 				 </select>
            <div class="form-group">
                <input type="hidden" class="form-control" name="dateCreated"  value="${task.dateCreated}">
            </div>
            <div class="form-group">
                <input type="hidden" class="form-control" name="dateUpdated"  value="${task.dateUpdated}">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="assignedTo" placeholder="Atribuido para" value="${task.assignedTo}">
            </div>
            <div class="form-group">
            	<label for="">Data de Conclusão</label>
                <input type="date" class="form-control" name="dateConclusion" placeholder="Data de conclusão" value="${task.dateConclusion}">
            </div>
            <button type="submit" class="btn btn-primary">Salvar</button>
        </form>
    </div>
</body>
</html>
                