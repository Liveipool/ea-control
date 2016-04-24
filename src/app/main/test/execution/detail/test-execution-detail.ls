angular.module 'app.test'

.config ($state-provider)!->
  
    $state-provider.state 'app.test.execution-detail', {
      url: '/test/execution-detail'
      views:
        'content@app':
          template-url: 'app/main/test/execution/detail/test-execution-detail.html'
          controller: ($scope)!->
    }
