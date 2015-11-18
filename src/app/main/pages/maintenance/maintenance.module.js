(function ()
{
    'use strict';

    angular
        .module('app.pages.maintenance', [])
        .config(config);

    /** @ngInject */
    function config($stateProvider, $translatePartialLoaderProvider, msNavigationFactoryProvider)
    {
        // State
        $stateProvider.state('app.pages_maintenance', {
            url      : '/pages/maintenance',
            views    : {
                'main@'                        : {
                    templateUrl: 'app/core/layouts/basic.html'
                },
                'content@app.pages_maintenance': {
                    templateUrl: 'app/main/pages/maintenance/maintenance.html',
                    controller : 'MaintenanceController as vm'
                }
            },
            bodyClass: 'maintenance'
        });

        // Translation
        $translatePartialLoaderProvider.addPart('app/main/pages/maintenance');

        // Navigation
        msNavigationFactoryProvider.saveItem('fuse.pages.maintenance', {
            title : 'Maintenance',
            state : 'app.pages_maintenance',
            weight: 5
        });
    }

})();