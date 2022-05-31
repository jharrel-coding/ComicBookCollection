<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- for forms -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!-- for validations -->
<%@ page isErrorPage="true"%>



<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type = "text/javascript" src ="/js/script.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<div class="container">
		<form:form action="/comics/${ comic.id }/update " method="POST" modelAttribute="editComic">
		<input type="hidden" name="_method" value="put">
			<div class="row">
				<form:label path="title" class="form-label">Name</form:label>
				<form:input path="title" class="form-control" value= "${ comic.title }" type = "text"/>
				<form:errors path="title" class="text-danger" />
			</div>
			<div class="row">
				<form:label path="issueNumber" class="form-label">Issue Number</form:label>
				<form:input path="issueNumber" class="form-control" value= "${ comic.issueNumber }" type = "number"/>
				<form:errors path="issueNumber" class="text-danger" />
			</div>
			<div class="row">
				<form:label path="description" class="form-label">Description</form:label>
				<form:input path="description" class="form-control" type = "text" value= "${ comic.description }"/>
				<form:errors path="description" class="text-danger" />
			</div>
			<div class="row">
				<form:label path="mainCharacter" class="form-label">Main Character</form:label>
				<form:input path="mainCharacter" class="form-control" type = "text" value= "${ comic.mainCharacter }"/>
				<form:errors path="mainCharacter" class="text-danger" />
			</div>
			
			<input class = "btn btn-primary" type="submit" value="Edit" />
			
		</form:form>


	</div>
</html>