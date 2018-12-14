<h2>Wycieczki</h2>


{if $link.2 == 'add'}
{else}
    <a href="{$config.url}{$link.1}/add"><div class="addElement">Dodaj wycieczkę</div></a>
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
            <th>Opcje</th>
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
            $('#trips').DataTable();
        })
        </script>
    {else}

    {/if}
{/if}