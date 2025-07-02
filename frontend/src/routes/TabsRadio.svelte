<script lang="ts">
    import Radio, { type RadioProps } from "$lib/Radio.svelte";
    let { selected = $bindable("records") }: { selected: string } = $props();

    const labelClass = `
        TabsRadioLabel
        flex items-center justify-center grow basis-0
        font-poppins text-dark-blue
        border-b-2 border-t-2 border-transparent
        cursor-pointer transition-colors duration-300 opacity-60
        relative z-10 whitespace-nowrap
    `;

    const inputClass = "TabsRadioInput hidden";

    const config: RadioProps = {
        options: [
            {
                label: "Registos",
                value: "records",
                labelClass: `${labelClass} rounded-tl-[5px] rounded-bl-[5px]`,
                inputClass,
            },
            {
                label: "Histórico",
                value: "history",
                inputClass,
                labelClass,
            },
            {
                label: "Requisições",
                value: "requests",
                inputClass,
                labelClass,
            },
            {
                label: "Estatística",
                value: "stats",
                inputClass,
                labelClass: `${labelClass} rounded-tr-[5px] rounded-br-[5px]`,
            },
        ],
        selected,
        class: `
            flex justify-center items-center self-start
            rounded-[7px] border-2 border-medium-blue bg-light-gray
            w-1/2 min-w-[700px] my-[5px] ml-[10px] relative
        `,
    };
</script>

<div class="TabsRadioSelector">
    <Radio {...config} bind:selected />
</div>

<style>
    .TabsRadioSelector :global(.TabsRadioLabel) {
        font-size: calc(1rem + 0.4vw);
    }

    .TabsRadioSelector :global(.TabsRadioLabel:hover) {
        color: var(--light-blue);
        opacity: 90%;
    }

    .TabsRadioSelector :global(.TabsRadioInput:checked + label) {
        background-color: var(--white);
        color: var(--dark-blue);
        border-bottom: 2px solid var(--light-blue);
        border-top: 2px solid var(--light-blue);
        opacity: 100%;
    }
</style>
