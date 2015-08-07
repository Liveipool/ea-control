(function ()
{
    'use strict';

    angular.module('app.ui')
        .controller('Style1LeftpaneController', Style1LeftpaneController);

    /** @ngInject */
    function Style1LeftpaneController($mdSidenav)
    {
        var vm = this;

        // Data

        // Methods
        vm.toggleSidenav = toggleSidenav;

        //////////

        /**
         * Toggle sidenav
         *
         * @param sidenavId
         */
        function toggleSidenav(sidenavId)
        {
            $mdSidenav(sidenavId).toggle();
        }
    }
})();
