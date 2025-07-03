<script lang="ts">
	import { Button, ButtonGroup, Search, Skeleton } from "flowbite-svelte";
	import {
		ChalkboardUserSolid,
		UserGraduateSolid,
		UserSolid,
		UsersGroupSolid,
	} from "flowbite-svelte-icons";
	import FloatingIsland from "$lib/components/FloatingIsland.svelte";
	import { fade } from "svelte/transition";

	let searchTerm = $state("");
	let selectedFilter = $state("All");
	let nSkeletons = $state(15);

	// Function to handle search button click
	function handleSearchClick() {
		console.log(
			"Searching for:",
			searchTerm,
			"with filter:",
			selectedFilter,
		);
		nSkeletons = Math.floor(Math.random() * 20 + 1); // Randomize the number of skeletons between 1 and 20
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
		},
		{
			name: "Teachers",
			icon: ChalkboardUserSolid,
		},
		{
			name: "Assistants",
			icon: UserSolid,
		},
		{
			name: "All",
			icon: UsersGroupSolid,
		},
	];

	const searchButtonClass = `
		flex-shrink-0 px-5 py-2.5 bg-primary-600 text-white font-medium text-base rounded-lg
		transition-transform duration-200
		hover:scale-110 active:bg-primary-900
	`;
</script>

<FloatingIsland classExtra="mt-4">
	<div class="flex items-center w-full space-x-4">
		<Search
			placeholder="Search ..."
			clearable
			bind:value={searchTerm}
			{onkeydown}
		/>
		<button onclick={handleSearchClick} class={searchButtonClass}>
			Search
		</button>
	</div>
	<ButtonGroup
		class="flex flex-wrap gap-2 sm:gap-0 w-full sm:w-auto justify-center"
	>
		{#each buttons as button}
			<Button
				pill
				onclick={() => handleFilterClick(button.name)}
				class={`px-4 py-2.5 text-sm font-medium 
					${selectedFilter === button.name ? "text-primary-600" : ""}
					`}
			>
				<button.icon class="w-5 h-5 mr 2" />
				{button.name}
			</Button>
		{/each}
	</ButtonGroup>
</FloatingIsland>

<FloatingIsland classExtra="max-h-[60vh] overflow-hidden mt-4 mb-4">
	<div class="SearchResults mt-4 text-gray-600 max-h-full overflow-y-auto">
		{#each Array(nSkeletons) as _, i (i)}
			<div
				in:fade={{ duration: 200 }}
				out:fade={{ duration: 200 }}
				class="mb-4"
			>
				<Skeleton />
			</div>
		{/each}
	</div>
</FloatingIsland>
