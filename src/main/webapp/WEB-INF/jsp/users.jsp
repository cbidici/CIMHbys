<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglibs.jsp"%>

<div class="panel-group" role="tablist" aria-multiselectable="true">
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-heading-group middle" aria-lavel="..." data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				<span class="glyphicon glyphicon-search"></span> <spring:message code="users.panel.search.title.usersearch" />
			</div>
		</div>
		<div id="collapseOne" class="panel-collapse collapse in"
			role="tabpanel" aria-labelledby="headingOne">
			<div class="panel-body">
				<c:url var="searchUrl" value="/users/search.html"/>
				<form:form action="${searchUrl}" commandName="searchUser" method="POST" cssClass="form-horizontal">
					<div class="row row-padded">
						<div class="col-sm-4">
							<div class="form-group form-group-sm">
								<label class="col-sm-5 control-label" for="userSearchUsername"><spring:message code="entity.user.username" /></label>
								<div class="col-sm-7">
									<form:input path="domain.username" cssClass="form-control" />
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group form-group-sm">
								<label class="col-sm-5 control-label" for="userSearchFirstname"><spring:message code="entity.user.firstname" /></label>
								<div class="col-sm-7">
									<form:input path="domain.firstname" cssClass="form-control" />
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group form-group-sm">
								<label class="col-sm-5 control-label" for="userSearchLastname"><spring:message code="entity.user.lastname" /></label>
								<div class="col-sm-7">
									<form:input path="domain.lastname" cssClass="form-control" />
								</div>
							</div>
						</div>
					</div>
					<div class="row row-padded">
						<div class="col-sm-12">
							<div class="col-sm-12">
								<button type="submit" class="btn btn-default btn-sm pull-right"><spring:message code="common.search" /></button>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="btn-group panel-heading-group left" role="group" aria-lavel="...">
			</div>
			<div class="btn-group panel-heading-group right" role="group" aria-lavel="...">
				<a class="btn btn-default btn-sm" data-toggle="modal" data-target="#modalNewUser"><spring:message code="users.panel.users.toolbar.newuser" /></a>
				<a class="btn btn-danger btn-sm" data-toggle="modal" data-target="#modalConfirmRemove"><spring:message code="users.panel.users.toolbar.deleteselected" /></a>
			</div>
			<div class="panel-heading-group middle" aria-lavel="..." data-toggle="collapse" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
				<span class="glyphicon glyphicon-list"></span> <spring:message code="users.panel.users.title.users" />
			</div>
		</div>
		<div id="collapseThree" class="panel-collapse collapse in"
			role="tabpanel" aria-labelledby="headingThree">
			<div class="panel-body">
			</div>
			<div class="table-responsive">
				<table class="table table-hover table-striped table-condensed">
					<thead>
						<tr>
							<th><input type="checkbox" id="checkalluser" name="checkalluser" value="<c:out value="${user.id}"/>"></th>
							<th><spring:message code="entity.user.username" /></th>
							<th><spring:message code="entity.user.firstname" /></th>
							<th><spring:message code="entity.user.lastname" /></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${searchUser.pageResult}" var="user">
							<tr>
								<td><input type="checkbox" id="checkboxuser" name="checkboxuser" value="<c:out value="${user.id}"/>"></td>
								<!--  <td><a href="<spring:url value="/users/${user.id}.html" />"><c:out value="${user.username}" /></a></td> -->
								<!--  <td><a onclick="getUser('${user.id}')" data-toggle="modal" data-target="#modalNewUser"><c:out value="${user.username}" /></a></td>-->
								<td><a onclick="loadUser('${user.id}')" ><c:out value="${user.username}" /></a></td>
								
								<td><c:out value="${user.firstname}" /></td>
								<td><c:out value="${user.lastname}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<c:url var="pageableUrl" value="/users/search.html" />
			<c:set var="pageable" value="${searchUser}" />
			<nav>
 				 <ul class="pagination">
			        <c:choose>
			            <c:when test="${pageable.page.number == 0}">
			                <li class="disabled"><a href="JavaScript:;">&lt;&lt;</a></li>
			                <li class="disabled"><a href="JavaScript:;">&lt;</a></li>
			            </c:when>
			            <c:otherwise>
			                <li><a href="${pageableUrl}?pdx=0&psz=${pageable.pageSize}&sdr=${pageable.sortDirection}&sky=${pageable.sortKey}">&lt;&lt;</a></li>
			                <li><a href="${pageableUrl}?pdx=${pageable.page.number-1}&psz=${pageable.pageSize}&sdr=${pageable.sortDirection}&sky=${pageable.sortKey}">&lt;</a></li>
			            </c:otherwise>
			        </c:choose>
			        <c:forEach var="i" begin="0" end="${pageable.page.totalPages-1}">
			            <c:choose>
			                <c:when test="${i == pageable.page.number}">
			                    <li class="active"><a href="${pageableUrl}?pdx=${i}&psz=${pageable.pageSize}&sdr=${pageable.sortDirection}&sky=${pageable.sortKey}"><c:out value="${i+1}" /></a></li>
			                </c:when>
			                <c:otherwise>
			                    <li><a href="${pageableUrl}?pdx=${i}&psz=${pageable.pageSize}&sdr=${pageable.sortDirection}&sky=${pageable.sortKey}"><c:out value="${i+1}" /></a></li>
			                </c:otherwise>
			            </c:choose>
			        </c:forEach>
			        <c:choose>
			            <c:when test="${pageable.page.number == pageable.page.totalPages-1}">
			                <li class="disabled"><a href="JavaScript:;">&gt;</a></li>
			                <li class="disabled"><a href="JavaScript:;">&gt;&gt;</a></li>
			            </c:when>
			            <c:otherwise>
			                <li><a href="${pageableUrl}?pdx=${pageable.page.number + 1}&psz=${pageable.pageSize}&sdr=${pageable.sortDirection}&sky=${pageable.sortKey}">&gt;</a></li>
			                <li><a href="${pageableUrl}?pdx=${pageable.page.totalPages-1}&psz=${pageable.pageSize}&sdr=${pageable.sortDirection}&sky=${pageable.sortKey}">&gt;&gt;</a></li>
			            </c:otherwise>
			        </c:choose>
			    </ul>
			</nav>
		</div>
	</div>
</div>

<div class="modal fade" id="modalConfirmRemove" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">
					<spring:message code="common.confirm" />
				</h4>
			</div>
			<div class="modal-body">
				<spring:message code="users.modal.delete.message.confirmdeleteuser" />
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					<spring:message code="common.cancel" />
				</button>
				<a href="" class="btn btn-danger doRemove"><spring:message code="common.yes" /></a>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalNewUser" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<c:url var="registerUrl" value="/users.html"/>
			<form:form id="registerationForm" action="${registerUrl}" commandName="user" cssClass="form-horizontal">
				
				<form:hidden path="id" />
				
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<spring:message code="users.modal.register.title.registernewuser" />
					</h4>
				</div>
				<div class="modal-body">
					<!-- First Name -->
					<div class="form-group">
						<label for="firstname" class="col-sm-4 control-label">
							<span class="translate"><spring:message code="entity.user.firstname" /></span>
						</label>
						<div class="col-sm-8">
							<form:input path="firstname" cssClass="form-control" />
							<form:errors path="firstname" />
						</div>
					</div>
					<!-- Last Name -->
					<div class="form-group">
						<label for="lastname" class="col-sm-4 control-label">
							<span class="translate"><spring:message code="entity.user.lastname" /></span>
						</label>
						<div class="col-sm-8">
							<form:input path="lastname" cssClass="form-control" />
							<form:errors path="lastname" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="username" class="col-sm-4 control-label">
							<spring:message code="entity.user.username" />
						</label>
						<div class="col-sm-8">
							<form:input path="username" cssClass="form-control" />
							<form:errors path="username" />
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-sm-4 control-label">
							<spring:message code="entity.user.email" />
						</label>
						<div class="col-sm-8">
							<form:input path="email" cssClass="form-control" />
							<form:errors path="email" />
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-4 control-label">
							<spring:message code="entity.user.password" />
						</label>
						<div class="col-sm-8">
							<form:password path="password" cssClass="form-control" />
							<form:errors path="password" />
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-4 control-label">
							<spring:message code="entity.user.passwordagain" />
						</label>
						<div class="col-sm-8">
							<input type="password" id="passwordAgain" name="passwordAgain" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label for="phone" class="col-sm-4 control-label">
							<spring:message code="entity.user.phone" />
						</label>
						<div class="col-sm-8">
							<form:input path="phone" cssClass="form-control" />
							<form:errors path="phone" />
						</div>
					</div>
					<div class="form-group">
						<label for="address" class="col-sm-4 control-label">
							<spring:message code="entity.user.address" />
						</label>
						<div class="col-sm-8">
							<form:input path="address" cssClass="form-control" />
							<form:errors path="address" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="roles" class="col-sm-4 control-label">
							<spring:message code="entity.user.roles" />
						</label>
						<div class="col-sm-8">
							<form:select path="roles"  cssClass="form-control" >
								<c:forEach items="${roles}" var="role">
									<option value="${role.id}"><spring:message code="${role.nameI18n}"/></option>
								</c:forEach>
							</form:select>
							<form:errors path="roles" />
						</div>
					</div>
					
					
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<spring:message code="common.cancel" />
					</button>
					<button type="submit" class="btn btn-large btn-primary">
						<spring:message code="common.save" />
					</button>
				</div>
			</form:form>
		</div>
	</div>
</div>

<script type="text/javascript">

	var submitPagination = function(data){
		<c:url var="searchUrl" value="/users/search.html" />
		if(data.pageIndex) {$("#userList #pageIndex").val(data.pageIndex);}
		if(data.pageSize) {$("#userList #pageSize").val(data.pageSize);}
		if(data.sortKey) {$("#userList #sortKey").val(data.sortKey);}
		if(data.sortDirection) {$("#userList #sortDirection").val(data.sortDirection);}
		
		$("#userList").attr("action", "${searchUrl}");
		$("#userList").submit();
	}

	var getUser = function(id) {
		var url = "<spring:url value='/api/users/' />" + id + ".json";
		$.get(url, function(data) {
	        $('#modalNewUser').loadJSON(data);
	        $('#modalNewUser').modal('show');
	        alert("Loaded Data... Username:"+ data.username);
		});
	};
	function loadUser(id){
		getUser(id);
		
	};
	
	
	$('#modalNewUser').on('hidden.bs.modal', function (e) {
		alert("clear");
		  $(this)
		    .find("input,textarea,select")
		       .val('')
		       .end()
		    .find("input[type=checkbox], input[type=radio]")
		       .prop("checked", "")
		       .end();
		})
		
	


</script>