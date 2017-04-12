<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<%@ include file="/WEB-INF/layout/taglibs.jsp"%>

<tilesx:useAttribute name="pageId" />

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="<spring:url value="/resources/css/bootstrap.min.css?3.3.2" />">
<link rel="stylesheet" href="<spring:url value="/resources/css/bootstrap-theme.min.css?3.3.2" />">

<script src="<spring:url value="/resources/js/jquery.min.js?2.1.3" />"></script>
<script src="<spring:url value="/resources/js/jquery.validate.min.js?1.13.1" />"></script>
<script src="<spring:url value="/resources/js/bootstrap.min.js?3.3.2" />"></script>
<script src="<spring:url value="/resources/js/notify.min.js?0.0.1" />"></script>
<script src="<spring:url value="/resources/js/validator/validator.js?0.0.1" />"></script>
<script src="<spring:url value="/resources/js/angular.min.js?1.3.14" />"></script>
<script src="<spring:url value="/resources/js/angular.ng-modules.js?0.0.1" />"></script>
<script src="<spring:url value="/resources/js/app/apps.js?0.0.1" />"></script>
<!-- Load Json dato to form elemet-->
<script src="<spring:url value="/resources/js/jquery.loadJSON.js" />"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<style type="text/css">
html{
	height: 100%;
}

body{
	height: 100%;
	background: #EEEEEE;
	margin: 0px;
	padding: 0px;
}

.body-container{
	position: absolute;
	width: 100%;
	height: 100%;
	padding-top: 60px;
}

.footer-container{
	width: 100%;
	text-align: center;
}

.row-padded{
	padding: 2px;
}

.panel-heading{
	padding: 3px 2px;
}

.panel-heading-group.left{
	float: left;
}

.panel-heading-group.right{
	float: right;
}

.panel-heading-group.middle{
	overflow:hidden;
	padding: 5px 5px;
	cursor: pointer;
}

.form-horizontal .control-label{
	text-align: left;
}

.table.table-marginfix{
	margin-bottom: 5px;
}

.pagination.pg-marginfix{
	margin: 0px 5px;
}

.pagination-textarea {
	padding: 5px 10px;
	font-size: 12px;
}

.pagination li input{
	margin: -4px -0px -4px -2px;
	max-width: 40px;
	text-align: right;
}

.pagination li select{
	margin:-4px -4px;
	padding: 0px 4px;
	height: 25px;
	line-height: 25px;
	color: #337AB7;
}
</style>

<title><spring:message code="${pageId}.title" /></title>
</head>
<body>

	<div class="container-fluid">
		<!-- Static navbar -->
		<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href='<spring:url value="/" />'>CIM HBYS</a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<security:authorize access="hasRole('ROLE_ADMIN')">
							<li class="${pageId == 'index' ? 'active' : ''}">
								<a href='<spring:url value="/" />'>
									<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
									<spring:message code="navigation.home" />
								</a>
							</li>
						</security:authorize>
						<security:authorize access="hasRole('ROLE_ADMIN')">
							<li class="${pageId == 'users' || pageId == 'userdetail' ? 'active' : ''}">
								<a href="<spring:url value="/users.html" />">
									<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
									<spring:message code="navigation.users" />
								</a>
							</li>
						</security:authorize>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<security:authorize access="isAuthenticated()">
							<li class="">
								<a href="<spring:url value="/logout.html" />">
									<spring:message code="navigation.logout" />
									<span class="glyphicon glyphicon-log-out" aria-hidden="true">
								</a>
							</li>
						</security:authorize>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
			<!--/.container-fluid -->
		</div>
	</div>
	<div class="body-container">
		<div class="container-fluid">
			<tiles:insertAttribute name="body" />
		</div>
		<div class="footer-container">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
	
</body>
</html>