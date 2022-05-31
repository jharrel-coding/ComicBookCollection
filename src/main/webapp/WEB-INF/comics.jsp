<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- for forms -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for validations -->
<%@ page isErrorPage="true"%>



<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/script.js"></script>

<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<div class="container">
		<h1>Welcome to Comic Collector</h1>
		<h2>All Comics</h2>
		<a href="/comics/new">Add a New Comic</a>
		<table class="table table-hover table-striped">
			<thead>
				<tr>
					<th>Title</th>
					<th>Issue Number</th>
					<th>Description</th>
					<th>Main Character</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ allComics }" var="comic">
					<tr>
						<td>${ comic.title }</td>
						<td>${ comic.issueNumber }</td>
						<td>${ comic.description }</td>
						<td>${ comic.mainCharacter }</td>
						<td><a href= "/comics/${ comic.id }">View</a> | <a href="/comics/${ comic.id }/edit">Edit</a> | 
						<form action="/comics/${ comic.id }/destroy" method = "POST">
						<input type="hidden" name="_method" value="delete">
						<input type="submit" value="Delete" /></form>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>

</body>
</html>