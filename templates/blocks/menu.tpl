<nav class="navbar navbar-inverse" role="navigation" style="border-radius: 0px;">
    <div class="container-fluid">
        <div class="navbar-header">
            <button id="navButton" type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Rozwiń nawigację</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand visible-xs" href="#" style="color: #ffffff">JMP Speed Test</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav" style="margin-left: auto;">
                <li style="padding-bottom: 0px;"><a href="{$config.url}">Strona główna</a></li>
                <li style="padding-bottom: 0px;"><a href="{$config.url}account">Konto</a></li>
                {if $smarty.session.user && in_array('classess', $config.permissions.show[$smarty.session.user.role])}<li style="padding-bottom: 0px;"><a href="{$config.url}classess">Klasy</a></li>{/if}
                {if $smarty.session.user && in_array('places', $config.permissions.show[$smarty.session.user.role])}<li style="padding-bottom: 0px;"><a href="{$config.url}places">Miejsca</a></li>{/if}
                {if $smarty.session.user && in_array('cities', $config.permissions.show[$smarty.session.user.role])}<li style="padding-bottom: 0px;"><a href="{$config.url}cities">Miejscowości</a></li>{/if}
                {if $smarty.session.user && in_array('protectors', $config.permissions.show[$smarty.session.user.role])}<li style="padding-bottom: 0px;"><a href="{$config.url}protectors">Opiekunowie</a></li>{/if}
                {if $smarty.session.user && in_array('guides', $config.permissions.show[$smarty.session.user.role])}<li style="padding-bottom: 0px;"><a href="{$config.url}guides">Przewodnicy</a></li>{/if}
                <li style="padding-bottom: 0px;"><a href="{$config.url}trips">Wycieczki</a></li>
                {if $smarty.session.user.role=='admin'}<li style="padding-bottom: 0px;"><a href="{$config.url}admin">Panel admina</a></li>{/if}
            </ul>
        </div>
    </div>
</nav>

<div class="container" style="margin-top: 50px;">