<h2>Klasy</h2>

{if $smarty.session.msg.m1.title}
    <div class="{if $smarty.session.msg.m1.err}err{else}ok{/if}">{$smarty.session.msg.m1.title}</div> <br><br>
{/if}

{if $link[2] == 'edit' && in_array($link.1, $config.permissions.edit[$smarty.session.user.role])}
<form class="smallCenter" id="edit" action="" method="POST">

    Symbol: <input value="{$smarty.post.symbol}" name="symbol" type="text" required><br><br>

    <input type="hidden" name="action" value="edit"/>

    <input type="submit" name="edit" value="Zapisz"/><br><br>

</form>
{elseif $link.2 == 'del' && in_array($link.1, $config.permissions.edit[$smarty.session.user.role])}
<form action="" method="POST" id="del">
    <input type="checkbox" name="confirm"> &nbsp;Potwiedź usunięcie...<br><br>
    <input type="hidden" name="action" value="del"/>
    <input type="submit" value="Usuń"/>
</form>
{elseif $link.2 == 'add' && in_array($link.1, $config.permissions.edit[$smarty.session.user.role])}
    <h3>Wypełnij pola:</h3><br><br>
    <form action="" method="post" id="add">
        <label class="elementLabel">Symbol Klasy: </label> <input name="symbol" style="width: 100px;" class="inputElement" type="text" required>
        <br><br>
        <input type="hidden" name="action" value="add">
        <input class="submitButton" type="submit" value="Dodaj">
    </form>
{elseif $link.2 == 'assign' && in_array($link.1, $config.permissions.edit[$smarty.session.user.role])}
    <h3>Przypisz klasę <strong>{$class.symbol}</strong> do wybranej wycieczki/wycieczek.</h3> <br>
    {if $trips}
        <form action="" method="post">
            <div class="table-responsive">
            <table id="trips" class="table">
                <thead>
                <tr>
                    <th>Nr</th>
                    <th>Nazwa</th>
                    <th>Data rozpoczęcia</th>
                    <th>Data zakończenia</th>
                    <th>Masymalna liczba uczniów</th>
                    <th>Miejscowość</th>
                    <th>Przypisz</th>
                </tr>
                </thead>
                {assign var='i' value=1}
                {foreach from=$trips item=v key=k}
                    <tr>
                        <td>{$i}</td>
                        <td>{$v.nazwa}</td>
                        <td>{$v.data_rozpoczecia}</td>
                        <td>{$v.data_zakonczenia}</td>
                        <td>{$v.liczba_uczniow}</td>
                        <td>{$v.miejscowosc}</td>
                        <td>
                            <input type="checkbox" {if in_array($v.id,$check)} checked="checked"{/if} name="assign[]" value="{$v.id}">
                        </td>
                    </tr>
                    {assign var='i' value=$i+1}
                {/foreach}
            </table>
            </div> <br>
            {else}
            Brak dostępnych wycieczek.
            {/if}

            <h3>Przypisz klasę <strong>{$class.symbol}</strong> do wybranego opiekuna/opiekunów.</h3> <br>
            {if $protectors}
                <div class="table-responsive" style="overflow-x: auto;">
                    <table id="protectors" class="table">
                        <thead>
                        <tr>
                            <th data-field="id">Nr</th>
                            <th data-field="surname">Nazwisko</th>
                            <th data-field="name">Imię</th>
                            <th data-field="adress">Adres</th>
                            <th data-field="city">Miejscowość</th>
                            <th data-field="postcode">Kod pocztowy</th>
                            <th data-field="pesel">PESEL</th>
                            <th data-field="phone">Telefon</th>
                            <th data-field="email">E-mail</th>
                            {if in_array($link.1, $config.permissions.edit[$smarty.session.user.role])}<th>Opcje</th>{/if}
                        </tr>
                        </thead>
                        {assign var='i' value=1}
                        {foreach from=$protectors item=v key=k}
                            <tr>
                                <td>{$i}</td>
                                <td>{$v.nazwisko}</td>
                                <td>{$v.imie}</td>
                                <td>{$v.adres}</td>
                                <td>{$v.miejscowosc}</td>
                                <td>{$v.kod_pocztowy}</td>
                                <td>{$v.pesel}</td>
                                <td>{$v.telefon}</td>
                                <td>{$v.email}</td>
                                <td>
                                    <input type="checkbox" {if in_array($v.id,$check_protectors)} checked="checked"{/if} name="assign_protectors[]" value="{$v.id}">
                                </td>

                            </tr>
                            {assign var='i' value=$i+1}
                        {/foreach}
                    </table>
                </div>
            {else}
                Brak dostępnych opiekunów.
            {/if}
            <br><br>


            <input type="hidden" name="action" value="assign">
            <input class="submitButton" style="width: 200px !important; height: 50px !important; font-size: 30px; !important;" type="submit" value="Przypisz">
        </form>
<br>


{else}

{if $smarty.session.user.role == 'wychowawca'}<a href="{$config.url}{$link.1}/add"><div class="addElement">Dodaj klasę</div></a>{/if}
<br><br>

{if $classess}
<div class="table-responsive">
<table id="classes" class="table">
    <thead>
    <tr>
    <th>Nr</th>
    <th>Symbol</th>
    {if in_array($link.1, $config.permissions.edit[$smarty.session.user.role])}<th>Opcje</th>{/if}
    </tr>
    </thead>
    {assign var='i' value=1}
    {foreach from=$classess item=v key=k}
            <tr>
                <td>{$i}</td>
                <td>{$v.symbol}</td>
                {if in_array($link.1, $config.permissions.edit[$smarty.session.user.role])}<td>
                    {if $smarty.session.user.role == 'wychowawca'}  <a href="{$config.url}{$link.1}/edit/{$v.id}" title="edytuj"><img
                                src="{$config.url}resources/images/edit.png" alt="edytuj"/></a> {/if}
                    &nbsp;
                    {if $smarty.session.user.role == 'wychowawca'}  <a href="{$config.url}{$link.1}/del/{$v.id}" title="usuń"><img
                                src="{$config.url}resources/images/remove.png" alt="usuń"/></a> {/if} &nbsp;
                    {if $smarty.session.user.role == 'wychowawca'}  <a href="{$config.url}{$link.1}/assign/{$v.id}" title="przypisz"><img
                                src="{$config.url}resources/images/assign.png" alt="przypisz"/></a> {/if}
                </td>
                {/if}
            </tr>
        {assign var='i' value=$i+1}
    {/foreach}
</table>
</div>
<script>
        $(document).ready(function(){
            $('#classes').DataTable();
        })
        </script>
{else}

{/if}
{/if}