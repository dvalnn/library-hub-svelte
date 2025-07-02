<script lang="ts">
    import Radio, { type RadioProps } from "$lib/Radio.svelte";

    let { selected = $bindable("student") }: { selected: string } = $props();

    const inputClass = "RadioInput hidden";
    const labelClass = `RadioLabel
        cursor-pointer px-3 py-2 rounded-md border-2 
        font-normal text-blue-900 border-blue-500 bg-white 
        transition-all duration-200 
        peer-checked:text-lg 
        peer-checked:font-semibold 
        peer-checked:border-blue-300
        peer-checked:shadow-[0_0_0_2px] 
        peer-checked:shadow-blue-500
    `;

    const config: RadioProps = {
        options: [
            {
                label: "Aluno",
                value: "student",
                inputClass,
                labelClass,
            },
            {
                label: "Professor",
                value: "teacher",
                inputClass,
                labelClass,
            },
            {
                label: "Assistente",
                value: "assistant",
                inputClass,
                labelClass,
            },
            {
                label: "Todos",
                value: "everyone",
                inputClass,
                labelClass,
            },
        ],
        selected,
        class: "flex items-center gap-2",
    };
</script>

<div class="AgentFilterRadioSelector">
    <Radio {...config} bind:selected />
</div>
