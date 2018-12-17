<h2>Przewodnicy</h2>


{if $smarty.session.msg.m1.title}
    <div class="{if $smarty.session.msg.m1.err}err{else}ok{/if}">{$smarty.session.msg.m1.title}</div> <br><br>
{/if}

{if $link[2] == 'edit'}
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
{elseif $link.2 == 'del'}
    <form action="" method="POST" id="del">
        <input type="checkbox" name="confirm"> &nbsp;Potwiedź usunięcie...<br><br>
        <input type="hidden" name="action" value="del"/>
        <input type="submit" value="Usuń"/>
    </form>
{elseif $link.2 == 'add'}
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
    <a href="{$config.url}{$link.1}/add"><div class="addElement">Dodaj przewodnika</div></a>
    <br><br>

    {if $guides}
        <div style="overflow-x: auto;">
            <table class="tableList">
                <tr><th>Nr</th><th>Nazwisko</th><th>Imię</th><th>Adres</th><th>Miejscowość</th><th>Kod pocztowy</th><th>PESEL</th><th>Telefon</th><th>E-mail</th><th>Opcje</th>
                    {assign var='i' value=1}
                    {foreach from=$guides item=v key=k}
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
                        <a href="{$config.url}{$link.1}/edit/{$v.id}" title="edytuj"><img
                                    src="{$config.url}resources/images/edit.png" alt="edytuj"/></a>
                        &nbsp;
                        <a href="{$config.url}{$link.1}/del/{$v.id}" title="usuń"><img
                                    src="{$config.url}resources/images/remove.png" alt="usuń"/></a>
                    </td>
                </tr>
                {assign var='i' value=$i+1}
                {/foreach}
            </table>
        </div>

    {else}

    {/if}
{/if}