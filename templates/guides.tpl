<h2>Przewodnicy</h2>


{if $link.2 == 'add'}
{else}
    <a href="{$config.url}{$link.1}/add"><div class="addElement">Dodaj przewodnika</div></a>
    <br><br>

    {if $guides}
        <div class="table-responsive" style="overflow-x: auto;">
            <table id="guides" class="table">
                <thead>
                <tr>
                <th>Nr</th>
                <th>Nazwisko</th>
                <th>Imię</th>
                <th>Adres</th>
                <th>Miejscowość</th>
                <th>Kod pocztowy</th>
                <th>PESEL</th>
                <th>Telefon</th>
                <th>E-mail</th>
                <th>Opcje</th>
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
        <script>
        $(document).ready(function(){
            $('#guides').DataTable();
        })
        </script>
    {else}

    {/if}
{/if}