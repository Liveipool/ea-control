angular.module 'app.test'

.config ($state-provider)!->
  
    $state-provider.state 'app.test.create', {
      url: '/test/executions/create?box_id'
      resolve: data: (test-service, $state-params)-> test-service.create-execution $state-params.box_id
      views:
        'content@app':
          template-url: 'app/main/test/execution/create/create-test-execution.html'
          controller-as: 'vm'
          controller: (data, $scope, $state)!->
            @execution = data
            console.log "datahahhahah: ", data
            @execution-text = '执行新测试'
            counter = 0
            @execute-test = ->
              counter++
              if counter == 1
                @execution-text = '等待测试盒执行...'
              else if counter == 2
                @execution-text = '执行中...'
                $state.go 'app.test.execution-detail', {new_box_id: data._id}
    }
