<h2>Opiekunowie</h2>


{if $link.2 == 'add'}
<h3>Wypełnij pola:</h3><br><br>
    <form action="" method="post" id="add">
        <label class="elementLabel">Nazwisko: </label> <input name="nazwisko" style="width: 100px;" class="inputElement" type="text" required><br>
        <label class="elementLabel">Imię: </label> <input name="imie" style="width: 100px;" class="inputElement" type="text" required><br>
        <label class="elementLabel">Adres: </label> <input name="adres" style="width: 100px;" class="inputElement" type="text" ><br>
        <label class="elementLabel">Miejscowosc (Wstaw tutaj kontrolkę "select-option" niech pobiera z bazy...): </label><br>
        <label class="elementLabel">Kod pocztowy: </label> <input name="kod_pocztowy" style="width: 100px;" class="inputElement" type="text" ><br>
        <label class="elementLabel">Pesel: </label> <input name="pesel" style="width: 100px;" class="inputElement" type="text" required><br>
        <label class="elementLabel">Telefon: </label> <input name="telefon" style="width: 100px;" class="inputElement" type="text" ><br>
        <label class="elementLabel">E-mail: </label> <input name="email" style="width: 100px;" class="inputElement" type="text" >
        <br><br>
        <input type="hidden" name="action" value="add">
        <label class="elementLabel">(WERSJA ALPHA! Tylko wyświetla, brak weryfikacji danych, brak miejscowości.) </label>
        <input class="submitButton" type="submit" value="Dodaj">
    </form>
{else}
    <a href="{$config.url}{$link.1}/add"><div class="addElement">Dodaj opiekuna</div></a>
    <br><br>

    {if $protectors}
        <div style="overflow-x: auto;">
        <table class="tableList">
            <tr><th>Nr</th><th>Nazwisko</th><th>Imię</th><th>Adres</th><th>Miejscowość</th><th>Kod pocztowy</th><th>PESEL</th><th>Telefon</th><th>E-mail</th><th>Opcje</th>
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