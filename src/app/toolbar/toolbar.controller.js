(function ()
{
    'use strict';

    angular.module('app.toolbar')
        .controller('ToolbarController', ToolbarController);

    /** @ngInject */
    function ToolbarController($rootScope, $mdSidenav, msNavFoldService, $translate, $mdToast)
    {
        var vm = this;

        // Data
        $rootScope.global = {
            search: ''
        };

        // Methods
        vm.toggleSidenav = toggleSidenav;
        vm.toggleNavigationSidenavFold = toggleNavigationSidenavFold;
        vm.logout = logout;
        vm.changeLanguage = changeLanguage;
        vm.setUserStatus = setUserStatus;
        vm.userStatusOptions = [
            {
                'title': 'Online',
                'icon' : 'icon-check-circle',
                'color': '#7DBC00'
            },
            {
                'title': 'Away',
                'icon' : 'icon-clock',
                'color': '#F9CE15'
            },
            {
                'title': 'Do not Disturb',
                'icon' : 'icon-minus-circle',
                'color': '#EB0615'
            },
            {
                'title': 'Invisible',
                'icon' : 'icon-checkbox-blank-circle-outline',
                'color': '#d7d7d7'
            },
            {
                'title': 'Offline',
                'icon' : 'icon-checkbox-blank-circle-outline',
                'color': '#616161'
            }
        ];
        
        vm.userStatus = vm.userStatusOptions[0];

        vm.languages = [
            {
                'title'      : 'English',
                'translation': 'TOOLBAR.ENGLISH',
                'code'       : 'en',
                'flag'       : 'gb'
            },
            {
                'title'      : 'Spanish',
                'translation': 'TOOLBAR.SPANISH',
                'code'       : 'es',
                'flag'       : 'es'
            },
            {
                'title'      : 'Turkish',
                'translation': 'TOOLBAR.TURKISH',
                'code'       : 'tr',
                'flag'       : 'tr'
            }
        ];

        vm.selectedLanguage = vm.languages[0];

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

        /**
         * Toggle navigation sidenav fold
         */
        function toggleNavigationSidenavFold(event)
        {
            event.preventDefault();

            msNavFoldService.toggleFold();
        }

        /**
         * Sets User Status
         * @param status
         */
        function setUserStatus(status)
        {
            vm.userStatus = status;
        }

        /**
         * Logout Function
         */
        function logout()
        {
            console.log('Logout Clicked');
        }

        /**
         * Change Language
         */
        function changeLanguage(lang)
        {
            //Set Selected Language
            vm.selectedLanguage = lang;

            // Show Message if selected other than English
            if ( lang.code !== 'en' )
            {
                $mdToast.show(
                    $mdToast.simple()
                        .content('Fuse supports Multi Language, but there is no other language file despite English for now.')
                        .position('top right')
                        .hideDelay(6000)
                        .parent('#content')
                );
                return;
            }

            //Change the language
            $translate.use(lang.code);
        }
    }

})();


