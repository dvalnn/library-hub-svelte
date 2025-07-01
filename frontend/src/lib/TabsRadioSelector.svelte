<script lang="ts">
    import TabsRadioInput from "./TabsRadioInput.svelte";

    const { activeTab, setActiveTab } = $props();

    const tabs = [
        {
            name: "Registos",
            id: "records",
            labelClassExtra: "rounded-tl-[5px] rounded-bl-[5px]",
        },
        { name: "Histórico", id: "history" },
        { name: "Requisições", id: "requests" },
        {
            name: "Estatística",
            id: "stats",
            labelClassExtra: "rounded-tr-[5px] rounded-br-[5px]",
        },
    ];
</script>

<div
    class={`
        tab-container
        flex justify-center items-center self-start
        rounded-[7px] border-2 border-medium-blue bg-light-gray
        w-1/2 min-w-[700px] my-[5px] ml-[10px] relative
    `}
>
    {#each tabs as tab}
        <TabsRadioInput
            name={tab.name}
            id={tab.id}
            checked={activeTab === tab.id}
            onchange={() => setActiveTab(tab.id)}
            inputClassExtra="TabsRadioInput"
            labelClassExtra={tab.labelClassExtra}
        />
    {/each}
</div>
