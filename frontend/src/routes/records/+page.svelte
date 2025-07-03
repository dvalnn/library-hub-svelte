<script lang="ts">
	import { ButtonGroup } from "flowbite-svelte";
	import {
		ChalkboardUserSolid,
		UserGraduateSolid,
		UserSolid,
		UsersGroupSolid,
	} from "flowbite-svelte-icons";
	import FloatingIsland from "$lib/components/FloatingIsland.svelte";

	let searchTerm = $state("");
	let selectedFilter = $state("All");

	// Function to handle search button click
	function handleSearchClick() {
		console.log(
			"Searching for:",
			searchTerm,
			"with filter:",
			selectedFilter,
		);
	}

	function handleFilterClick(filter: string) {
		selectedFilter = filter;
	}

	function onkeydown(event: KeyboardEvent) {
		if (event.key === "Enter") {
			handleSearchClick();
		} else if (event.key === "Escape") {
			searchTerm = "";
		}
	}

	const buttons = [
		{
			name: "Students",
			icon: UserGraduateSolid,
			class: "rounded-l-lg sm:rounded-l-lg sm:rounded-r-none",
		},
		{
			name: "Teachers",
			icon: ChalkboardUserSolid,
			class: "sm:border-l sm:border-r sm:rounded-none",
		},
		{
			name: "Assistants",
			icon: UserSolid,
			class: "sm:rounded-r-none sm:rounded-l-none",
		},
		{
			name: "All",
			icon: UsersGroupSolid,
			class: "rounded-r-lg sm:rounded-r-lg sm:rounded-l-none",
		},
	];

	const inputClass = `
		flex-grow block w-full px-4 py-2.5 text-gray-900 placeholder-gray-500
		bg-white border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500
		focus:outline-none text-base
	`;

	const searchButtonClass = `
		flex-shrink-0 px-5 py-2.5 bg-primary-600 text-white font-medium text-base rounded-lg
		transition-transform duration-200
		hover:scale-110 active:bg-primary-900
	`;
</script>

<FloatingIsland>
	<div class="flex items-center w-full space-x-4">
		<!-- Search input with its own border and focus styles -->
		<input
			placeholder="Search ..."
			class={inputClass}
			bind:value={searchTerm}
			{onkeydown}
		/>
		<!-- Search button, now separate and fully rounded -->
		<button onclick={handleSearchClick} class={searchButtonClass}>
			Search
		</button>
	</div>
	<ButtonGroup
		class="flex flex-wrap gap-2 sm:gap-0 w-full sm:w-auto justify-center"
	>
		{#each buttons as button}
			<button
				onclick={() => handleFilterClick(button.name)}
				class={`
					flex items-center justify-center px-4 py-2.5 text-sm font-medium
					transition-colors duration-200 ease-in-out border border-gray-300
					${button.class}
					${selectedFilter === button.name ? "bg-primary-600 text-white hover:text-white-600" : "hover:text-primary-600 "}
					`}
			>
				<button.icon class="w-5 h-5 mr 2" />
				{button.name}
			</button>
		{/each}
	</ButtonGroup>
</FloatingIsland>
