angular.module 'app.test'

.config ($state-provider)!->
  
    $state-provider.state 'app.test.execution-detail', {
      url: '/test/execution-detail'
      resolve: data: (api-resolver)-> api-resolver.resolve('testInfo@get')
      views:
        'content@app':
          template-url: 'app/main/test/execution/detail/test-execution-detail.html'
          controller-as: 'vm'
          controller: (data, $scope)!->
            @execution = data
            # console.log "aaaaaa: ", data.testInfo.steps
    }
