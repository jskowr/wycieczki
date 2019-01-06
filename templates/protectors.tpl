<h2>Opiekunowie</h2>


{if $smarty.session.msg.m1.title}
    <div class="{if $smarty.session.msg.m1.err}err{else}ok{/if}">{$smarty.session.msg.m1.title}</div> <br><br>
{/if}

{if $link[2] == 'edit' && in_array($link.1, $config.permissions.edit[$smarty.session.user.role])}
    <form action="" method="post" id="edit">
        <label class="elementLabel">Nazwisko: </label> <input name="nazwisko"  class="inputElement" type="text" value="{$smarty.post.nazwisko}" required>
        <br><br>
        <label class="elementLabel">Imię: </label> <input name="imie"  class="inputElement" type="text" value="{$smarty.post.imie}" required>
        <br><br>
        <label class="elementLabel">Nazwisko: </label> <input name="adres"  class="inputElement" type="text" value="{$smarty.post.adres}" required>
        <br><br>
        <label class="elementLabel">Miasto: </label>
        <select name="id_miejscowosci">
            <option value="0">Wybierz miejscowość...</option>
            {if $cities}
                {foreach from=$cities key=k item=v}
                    <option value="{$v.id}" {if $smarty.post.id_miejscowosci == $v.id}selected="selected"{/if}>{$v.nazwa}</option>
                {/foreach}
            {/if}
        </select>
        <br><br>
        <label class="elementLabel">Kod pocztowy: </label> <input name="kod_pocztowy"  class="inputElement" type="text" value="{$smarty.post.kod_pocztowy}" required>
        <br><br>
        <label class="elementLabel">PESEL: </label> <input name="pesel"  class="inputElement" type="text" value="{$smarty.post.pesel}" required>
        <br><br>
        <label class="elementLabel">Telefon: </label> <input name="telefon"  class="inputElement" type="text" value="{$smarty.post.telefon}" required>
        <br><br>
        <label class="elementLabel">E-mail: </label> <input name="email"  class="inputElement" type="text" value="{$smarty.post.email}" required>
        <br><br>

        <input type="hidden" name="action" value="edit">
        <input class="submitButton" type="submit" value="Zapisz">
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
        <label class="elementLabel">Nazwisko: </label> <input name="nazwisko"  class="inputElement" type="text" required>
        <br><br>
        <label class="elementLabel">Imię: </label> <input name="imie"  class="inputElement" type="text" required>
        <br><br>
        <label class="elementLabel">Nazwisko: </label> <input name="adres"  class="inputElement" type="text" required>
        <br><br>
        <label class="elementLabel">Miasto: </label>
        <select name="id_miejscowosci">
            <option value="0">Wybierz miejscowość...</option>
            {if $cities}
                {foreach from=$cities key=k item=v}
                    <option value="{$v.id}">{$v.nazwa}</option>
                {/foreach}
            {/if}
        </select>
        <br><br>
        <label class="elementLabel">Kod pocztowy: </label> <input name="kod_pocztowy"  class="inputElement" type="text" required>
        <br><br>
        <label class="elementLabel">PESEL: </label> <input name="pesel"  class="inputElement" type="text" required>
        <br><br>
        <label class="elementLabel">Telefon: </label> <input name="telefon"  class="inputElement" type="text" required>
        <br><br>
        <label class="elementLabel">E-mail: </label> <input name="email"  class="inputElement" type="text" required>
        <br><br>

        <input type="hidden" name="action" value="add">
        <input class="submitButton" type="submit" value="Dodaj">
    </form>
{else}
{if $smarty.session.user.role == 'wychowawca'}<a href="{$config.url}{$link.1}/add"><div class="addElement">Dodaj opiekuna</div></a>{/if}
    <br><br>

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
                {if in_array($link.1, $config.permissions.edit[$smarty.session.user.role])}<td>
                     <a href="{$config.url}{$link.1}/edit/{$v.id}" title="edytuj"><img
                                src="{$config.url}resources/images/edit.png" alt="edytuj"/></a>
                    &nbsp;
                       <a href="{$config.url}{$link.1}/del/{$v.id}" title="usuń"><img
                                src="{$config.url}resources/images/remove.png" alt="usuń"/></a> 
                </td>
                {/if}
            </tr>
            {assign var='i' value=$i+1}
            {/foreach}
        </table>
        </div>
        <script>
        $(document).ready(function(){
            $('#protectors').DataTable();
        })
        </script>

    {else}

    {/if}
{/if}