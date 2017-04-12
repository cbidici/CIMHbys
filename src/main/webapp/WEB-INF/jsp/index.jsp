<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/layout/taglibs.jsp"%>

<div class="panel-group" role="tablist" aria-multiselectable="true" ng-modules="SearchListApp">
	<c:url var="searchUrl" value="/api/users/search.json"/>
	<div ng-controller="SearchListCtrl" ng-init="searchUrl='${searchUrl}'; search()">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-heading-group middle" aria-lavel="..." data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
					<span class="glyphicon glyphicon-search"></span> <spring:message code="users.panel.search.title.usersearch" />
				</div>
			</div>
			<div id="collapseOne" class="panel-collapse collapse in"
				role="tabpanel" aria-labelledby="headingOne">
				<div class="panel-body">
					<form class="form-horizontal">
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group form-group-sm">
									<label class="col-sm-5 control-label" for="userSearchUsername"><spring:message code="entity.user.username" /></label>
									<div class="col-sm-7">
										<input type="text" class="form-control" ng-model="searchParam.username">
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group form-group-sm">
									<label class="col-sm-5 control-label" for="userSearchFirstname"><spring:message code="entity.user.firstname" /></label>
									<div class="col-sm-7">
										<input type="text" class="form-control" ng-model="searchParam.firstname">
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group form-group-sm">
									<label class="col-sm-5 control-label" for="userSearchLastname"><spring:message code="entity.user.lastname" /></label>
									<div class="col-sm-7">
										<input type="text" class="form-control" ng-model="searchParam.lastname">
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<button type="button" class="btn btn-default btn-sm pull-right" ng-click="search()"><spring:message code="common.search" /></button>
							</div>
						</div>
					</form>
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
					<table class="table table-hover table-striped table-condensed table-marginfix">
						<thead>
							<tr>
								<th><input type="checkbox" id="checkalluser" nane="checkalluser" value=""></th>
								<th><spring:message code="entity.user.username" /></th>
								<th><spring:message code="entity.user.firstname" /></th>
								<th><spring:message code="entity.user.lastname" /></th>
							</tr>
						</thead>
						<tbody>
							<tr ng-show="result.page.content.length == 0">
								<td colspan="4" style="text-align: center;"><spring:message code="common.norecordwithqueryconditions" /></td>
							</tr>
							<tr ng-show="result.page.content.length > 0" ng-repeat="item in result.page.content">
								<td><input type="checkbox" id="checkboxuser" name="checkboxuser" value=""></td>
								<td><a onclick="">{{item.username}}</a></td>
								<td>{{item.firstname}}</td>
								<td>{{item.lastname}}</td>
							</tr>
						</tbody>
					</table>
					<div class="pagination-textarea pull-left">
						{{result.page.totalElements}} <spring:message code="common.resultsfound" />
					</div>
					<nav class="pull-right">
						<ul class="pagination pagination-sm pg-marginfix">
							<li>
								<a>
									<select class="form-control input-sm" ng-change="paginateUpdate()" ng-model="result.pageSize">
										<option>10</option>
										<option>50</option>
										<option>100</option>
									</select>
								</a>
							</li>
							<li ng-class="{disabled : result.page.number==0}">
								<a href="" ng-click="paginateFirst()">&lt;&lt;</a>
							</li>
							<li ng-class="{disabled : result.page.number==0}">
								<a href="" ng-click="paginatePrev()">&lt;</a>
							</li>
							<li>
								<a>
									<input ng-model="result.displayIndex">/{{result.page.totalPages}}
								</a>
								<a href="" ng-click="paginateUpdate()">Git</a>
							</li>
							<li ng-class="{disabled : result.page.number==result.page.totalPages-1}">
								<a href="" ng-click="paginateNext()">&gt;</a>
							</li>
							<li ng-class="{disabled : result.page.number==result.page.totalPages-1}">
								<a href="" ng-click="paginateLast()">&gt;&gt;</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modalNewUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div ng-modules="SaveApp" class="modal-content">
			<c:url var="saveUrl" value="/api/users.json"/>
			<c:url var="rolesUrl" value="/api/users/roles.json"/>
			<form id="registerationForm" class="form-horizontal" ng-controller="SaveCtrl" ng-init="saveUrl='${saveUrl}'; rolesUrl='${rolesUrl}'; getRoles();" ng-submit="save()" novalidate>
				
				<input type="hidden" ng-model="domain.id" autocomplete="off" />
				
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
							<input ng-model="domain.firstname" class="form-control input-sm" autocomplete="off" />
						</div>
					</div>
					<!-- Last Name -->
					<div class="form-group">
						<label for="lastname" class="col-sm-4 control-label">
							<span class="translate"><spring:message code="entity.user.lastname" /></span>
						</label>
						<div class="col-sm-8">
							<input ng-model="domain.lastname" class="form-control input-sm" autocomplete="off" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="username" class="col-sm-4 control-label">
							<spring:message code="entity.user.username" />
						</label>
						<div class="col-sm-8">
							<input ng-model="domain.username" class="form-control input-sm" autocomplete="off" />
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-sm-4 control-label">
							<spring:message code="entity.user.email" />
						</label>
						<div class="col-sm-8">
							<input ng-model="domain.email" class="form-control input-sm" autocomplete="off" />
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-4 control-label">
							<spring:message code="entity.user.password" />
						</label>
						<div class="col-sm-8">
							<input type="password" ng-model="domain.password" class="form-control input-sm" autocomplete="off" />
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-4 control-label">
							<spring:message code="entity.user.passwordagain" />
						</label>
						<div class="col-sm-8">
							<input type="password" ng-model="domain.passwordagain" class="form-control input-sm" autocomplete="off" />
						</div>
					</div>
					<div class="form-group">
						<label for="phone" class="col-sm-4 control-label">
							<spring:message code="entity.user.phone" />
						</label>
						<div class="col-sm-8">
							<input ng-model="domain.phone" class="form-control input-sm" autocomplete="off" />
						</div>
					</div>
					<div class="form-group">
						<label for="address" class="col-sm-4 control-label">
							<spring:message code="entity.user.address" />
						</label>
						<div class="col-sm-8">
							<input ng-model="domain.address" class="form-control input-sm" autocomplete="off" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="roles" class="col-sm-4 control-label">
							<spring:message code="entity.user.roles" />
						</label>
						<div class="col-sm-8">
							<select multiple ng-multiple="true" ng-model="domain.roles" ng-options="role.nameI18n for role in roles" class="form-control input-sm"></select>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">
						<spring:message code="common.cancel" />
					</button>
					<button type="submit" class="btn btn-primary btn-sm">
						<spring:message code="common.save" />
					</button>
				</div>
			</form>
		</div>
	</div>
</div>




