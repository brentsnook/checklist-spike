ChecklistsController = ($scope, $http) ->

  $scope.categories = {}
  $scope.activeCategory = null

  $http(method: 'GET', url: 'checklists/1.json').success (data, status, headers, config) ->
    $scope.categories = data.categories
    $scope.activeCategory = $scope.categories[0]

  $scope.complete_count = (category) ->
    (item for item in category.items when item.status == 'Y').length

  $scope.complete_percentage = (category) ->
    category.completion.percentage

  $scope.setActiveCategory = (categoryName) ->
    $scope.activeCategory = (category for category in $scope.categories when category.name == categoryName)[0]
    $scope.$apply()

angular.module('checklists', []).controller('ChecklistsController', ChecklistsController)
