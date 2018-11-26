<h2>Miejscowości</h2>


{if $link.2 == 'add'}
{else}
    <a href="{$config.url}{$link.1}/add"><div class="addElement">Dodaj miejscowość</div></a>
    <br><br>

    {if $cities}
        <table class="tableList">
            <tr><th>Nr</th><th>Nazwa</th><th>Opcje</th>
                {assign var='i' value=1}
                {foreach from=$cities item=v key=k}
            <tr>
                <td>{$i}</td>
                <td>{$v.nazwa}</td>
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

    {else}

    {/if}
{/if}