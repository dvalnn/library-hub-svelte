<script lang="ts">
    import Radio, { type RadioProps } from "$lib/Radio.svelte";

    let { selected = $bindable("student") }: { selected: string } = $props();

    const baseLabelClass = `
        RadioLabel
        cursor-pointer px-4 py-1.5
        text-sm font-medium
        text-gray-700 transition-colors duration-150
    `;

    const inputClass = "RadioInput hidden";

    const config: RadioProps = {
        options: [
            { label: "Aluno", value: "student" },
            { label: "Professor", value: "teacher" },
            { label: "Assistente", value: "assistant" },
            { label: "Todos", value: "everyone" },
        ].map((opt) => ({
            ...opt,
            inputClass,
            labelClass: baseLabelClass,
        })),
        selected,
        class: `gap-x-3 items-center bg-transparent`,
    };
</script>

<div class="AgentFilterRadioSelector">
    <Radio {...config} bind:selected />
</div>

<style>
    .AgentFilterRadioSelector :global(.RadioLabel) {
        font-size: calc(1rem + 0.3vw);
    }

    .AgentFilterRadioSelector :global(.RadioLabel:hover) {
        color: var(--light-blue);
        opacity: 90%;
    }

    .AgentFilterRadioSelector :global(.RadioInput:checked + label) {
        background-color: var(--white);
        color: var(--light-blue);
        opacity: 100%;
    }
</style>
