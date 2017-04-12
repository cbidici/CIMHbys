(function() {
	var utilApp = angular.module('UtilApp', []);
	
	utilApp.factory('Util', [function(){
		return {
			getNumber : function(num){
				return new Array(num);
			},
			math : window.Math
		};
	} ]);
	
	var searchListApp = angular.module('SearchListApp', ['UtilApp']);

	searchListApp.controller('SearchListCtrl', [ '$scope', 'Query', 'Util', function($scope, query, util) {
		$scope.searchParam = {};
		$scope.result = {};
		$scope.util = util;
		
		$scope.search = function() {
			var page = {
				domain : $scope.searchParam
			};
			query(page, $scope.searchUrl, $scope);
		}

		$scope.paginateUpdate = function() {
			var page = $scope.constructPage();
			query(page, $scope.searchUrl, $scope);
		}
		
		$scope.paginateFirst = function() {
			if($result.page.number==0){
				return;
			}
			
			var page = $scope.constructPage();
			page.pageIndex = 0;
			query(page, $scope.searchUrl, $scope);
		}
		
		$scope.paginatePrev = function() {
			if($result.page.number==0){
				return;
			}
			
			var page = $scope.constructPage();
			page.pageIndex = $scope.result.pageIndex-1;
			query(page, $scope.searchUrl, $scope);
		}
		
		$scope.paginateLast= function() {
			if($result.page.number==$result.page.totalPages-1){
				return;
			}
			
			var page = $scope.constructPage();
			page.pageIndex = $scope.result.page.totalPages-1;
			query(page, $scope.searchUrl, $scope);
		}
		
		$scope.paginateNext = function() {
			if($result.page.number==$result.page.totalPages-1){
				return;
			}
			
			var page = $scope.constructPage();
			page.pageIndex = $scope.result.pageIndex+1;
			query(page, $scope.searchUrl, $scope);
		}
		
		$scope.constructPage = function(){
			return {
				pageIndex:$scope.result.displayIndex-1,
				pageSize:$scope.result.pageSize,
				sortKey:$scope.result.sortKey,
				sortDirection:$scope.result.sortDirection,
				domain:$scope.result.domain
			};
		}
	} ]);

	searchListApp.factory('Query', ['$http', function($http) {
		return function(data, url, scope) {
			$http.post(url, data).
				success(function(data, status, headers, config) {
					scope.result = data;
					scope.result.displayIndex = scope.result.pageIndex+1;
				}).
				error(function(data, status, headers, config) {
					alert("hata");
				});
		};
	} ]);
	
	var saveApp = angular.module('SaveApp', []);
	
	saveApp.controller('SaveCtrl', [ '$scope', '$http', function($scope, $http) {
		$scope.domain = {};
		
		$scope.save = function(){
			$http.post($scope.saveUrl, $scope.domain).
				success(function(data, status, headers, config) {
					alert("saved");
				}).
				error(function(data, status, headers, config) {
					alert("hata");
				});
		
		};
		
		$scope.getRoles = function(){
			$http.get($scope.rolesUrl)
				.success(function(data, status, headers, config) {
					$scope.roles = data;
				}).
				error(function(data, status, headers, config) {
					alert("hata");
				});
		};
		
	} ]);
	
})();