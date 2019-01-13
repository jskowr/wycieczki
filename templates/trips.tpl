<h2>Wycieczki</h2>


{if $smarty.session.msg.m1.title}
    <div class="{if $smarty.session.msg.m1.err}err{else}ok{/if}">{$smarty.session.msg.m1.title}</div> <br><br>
{/if}

{if $link[2] == 'edit' && in_array($link.1, $config.permissions.edit[$smarty.session.user.role])}
    <form action="" method="post" id="add">
        <label class="elementLabel">Nazwa: </label> <input value="{$smarty.post.nazwa}" name="nazwa" class="inputElement" type="text" required> <br><br>
        <label class="elementLabel">Data rozpoczęcia: </label> <input value="{$smarty.post.data_rozpoczecia}" autocomplete="off" placeholder="rrrr/mm/dd gg:mm" id="from" name="data_rozpoczecia" class="inputElement" type="text" required> <br><br>
        <label class="elementLabel">Data zakończenia: </label> <input value="{$smarty.post.data_zakonczenia}" autocomplete="off" placeholder="rrrr/mm/dd gg:mm" id="to" name="data_zakonczenia" class="inputElement" type="text" required> <br><br>
        <label class="elementLabel">Liczba uczniów: </label> <input value="{$smarty.post.liczba_uczniow}" name="liczba_uczniow" class="inputElement" type="text" required> <br><br>
        <label class="elementLabel">Miejscowość: </label>
        <select name="id_miejscowosci">
            <option value="0">Wybierz miejscowość...</option>
            {if $cities}
                {foreach from=$cities key=k item=v}
                    <option value="{$v.id}" {if $smarty.post.id_miejscowosci == $v.id}selected="selected"{/if}>{$v.nazwa}</option>
                {/foreach}
            {/if}
        </select>
        <br><br>
        <input type="hidden" name="action" value="edit">

        <script type="text/javascript">
            $(document).ready(function(){
                $('#from').datetimepicker();
                $('#to').datetimepicker();
            });
        </script>

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
        <label class="elementLabel">Nazwa: </label> <input name="nazwa" class="inputElement" type="text" required> <br><br>
        <label class="elementLabel">Data rozpoczęcia: </label> <input autocomplete="off" placeholder="rrrr/mm/dd gg:mm" id="from" name="data_rozpoczecia" class="inputElement" type="text" required> <br><br>
        <label class="elementLabel">Data zakończenia: </label> <input autocomplete="off" placeholder="rrrr/mm/dd gg:mm" id="to" name="data_zakonczenia" class="inputElement" type="text" required> <br><br>
        <label class="elementLabel">Liczba uczniów: </label> <input name="liczba_uczniow" class="inputElement" type="text" required> <br><br>
        <label class="elementLabel">Miejscowość: </label>
        <select name="id_miejscowosci">
            <option value="0">Wybierz miejscowość...</option>
            {if $cities}
                {foreach from=$cities key=k item=v}
                    <option value="{$v.id}">{$v.nazwa}</option>
                {/foreach}
            {/if}
        </select>
        <br><br>
        <input type="hidden" name="action" value="add">

        <script type="text/javascript">
            $(document).ready(function(){
                $('#from').datetimepicker();
                $('#to').datetimepicker();
            });
        </script>

        <input class="submitButton" type="submit" value="Dodaj">
    </form>

{elseif $link.2 == 'assign' && in_array($link.1, $config.permissions.edit[$smarty.session.user.role])}
    <h3>Przypisz wycieczkę <strong>{$trip.nazwa}</strong> do wybranego przewodnika/przewodników.</h3> <br>

    <form action="" method="post">
        {if $guides}
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
                                <input type="checkbox" {if in_array($v.id,$check_guides)} checked="checked"{/if} name="assign_guides[]" value="{$v.id}">
                            </td>

                        </tr>
                        {assign var='i' value=$i+1}
                    {/foreach}
                </table>
            </div>
        {else}
            Brak dostępnych przewodników.
        {/if}
        <br><br>


        <input type="hidden" name="action" value="assign">
        <input class="submitButton" style="width: 200px !important; height: 50px !important; font-size: 30px; !important;" type="submit" value="Przypisz">
    </form>
    <br>
{elseif $link.2 == 'generate' && in_array($link.1, $config.permissions.edit[$smarty.session.user.role])}

{else}
    {if $smarty.session.user.role == 'kierownik'}<a href="{$config.url}{$link.1}/add"><div class="addElement">Dodaj wycieczkę</div></a>{/if}
    <br><br>

    {if $trips}
        <div class="table-responsive">
        <table id="trips" class="table">
            <thead>
            <tr>
            <th>Nr</th>
            <th>Nazwa</th>
            <th>Data rozpoczęcia</th>
            <th>Data zakończenia</th>
            <th>Liczba uczniów</th>
            <th>Miejscowość</th>
            {if in_array($link.1, $config.permissions.edit[$smarty.session.user.role])}<th>Opcje</th>{/if}
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
                {if in_array($link.1, $config.permissions.edit[$smarty.session.user.role])}<td>
                    {if $smarty.session.user.role == 'kierownik'}  <a href="{$config.url}{$link.1}/edit/{$v.id}" title="edytuj"><img
                                src="{$config.url}resources/images/edit.png" alt="edytuj"/></a> {/if}
                    &nbsp;
                    {if $smarty.session.user.role == 'kierownik'}  <a href="{$config.url}{$link.1}/del/{$v.id}" title="usuń"><img
                                src="{$config.url}resources/images/remove.png" alt="usuń"/></a> {/if}
                    &nbsp;
                    {if $smarty.session.user.role == 'kierownik'}  <a href="{$config.url}{$link.1}/assign/{$v.id}" title="przypisz"><img
                                src="{$config.url}resources/images/assign.png" alt="przypisz"/></a> {/if} &nbsp;
                    {if $smarty.session.user.role == 'kierownik'}  <a href="{$config.url}{$link.1}/generate/{$v.id}" title="generuj raport"><img
                                src="{$config.url}resources/images/pdf.png" alt="generuj raport"/></a> {/if}
                </td>
                {/if}
            </tr>
            {assign var='i' value=$i+1}
            {/foreach}
        </table>
        </div>
        <script>
        $(document).ready(function(){
            $('#trips').DataTable();
        })
        </script>
    {else}

    {/if}
{/if}