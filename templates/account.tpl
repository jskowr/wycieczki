
{if $smarty.session.msg.m1.title}
    <div class="{if $smarty.session.msg.m1.err}err{else}ok{/if}">{$smarty.session.msg.m1.title}</div> <br><br>
{/if}

{if !$smarty.session.user}
<h1>Zaloguj się</h1> <br>
<form action="" method="post">
<label>Login: </label> <input name="login" type="text"> <br><br>
<label>Hasło: </label> <input type="password" name="haslo" type="text"> <br> <br>

zaloguj jako: <br><br>
<input type="radio" name="role" value="wychowawca" checked="checked"> <strong> wychowawca </strong> <br>
<input type="radio" name="role" value="kierownik"> <strong> kierownik biura podróży </strong> <br>
<br><br>
    <input type="hidden" name="action" value="login">

    <input type="submit" value="ZALOGUJ">

</form>
{else}
    <span style="font-size: 20px; font-weight: bold;">
Zalogowany jako: {$smarty.session.user.role} <br>
Login: {$smarty.session.user.login} <br><br>
    </span>
    <form action="" method="post">
        <input type="hidden" name="action" value="logout">
        <input type="submit" value="Wyloguj mnie">
    </form>
{/if}

