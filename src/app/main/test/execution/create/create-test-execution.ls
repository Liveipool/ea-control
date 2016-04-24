angular.module 'app.test'

.config ($state-provider)!->
  
    $state-provider.state 'app.test.create', {
      url: '/test/create/new-execution'
      resolve: data: (api-resolver)-> api-resolver.resolve('testExecutions@get')
      views:
        'content@app':
          template-url: 'app/main/test/execution/create/create-test-execution.html'
          controller-as: 'vm'
          controller: (data, $scope, $state)!->
            @execution = data
            @execution-text = '等待执行'
            @execute-test = do ~> 
              counter = 1
              ~> 
                @execution-text = '开始执行'
                $state.go 'app.test.execution-detail' if counter is 2
                counter++
    }
