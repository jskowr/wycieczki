{include file="templates/blocks/header.tpl"}

{if $link[1] && file_exists("templates/$link[1].tpl")}
    {include file="$link[0].tpl"}
{else}
    {include file="templates/index.tpl"}
{/if}

{include file="templates/blocks/footer.tpl"}