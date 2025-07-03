<script lang="ts">
	import { ButtonGroup } from "flowbite-svelte";
	import {
		ChalkboardUserSolid,
		UserGraduateSolid,
		UserSolid,
		UsersGroupSolid,
	} from "flowbite-svelte-icons";

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
		// In a real application, you would trigger a search API call here
	}

	// Function to handle filter button clicks
	function handleFilterClick(filter: string) {
		selectedFilter = filter;
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
</script>

<div class="w-full max-w-2xl bg-white shadow-lg rounded-xl p-6 space-y-6">
	<div class="flex items-center w-full space-x-4">
		<!-- Search input with its own border and focus styles -->
		<input
			placeholder="Search ..."
			class="flex-grow block w-full px-4 py-2.5 text-gray-900 placeholder-gray-500 bg-white border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:outline-none text-base"
			bind:value={searchTerm}
			onkeydown={(e: KeyboardEvent) => {
				if (e.key === "Enter") {
					handleSearchClick();
				} else if (e.key === "Escape") {
					searchTerm = ""; // Clear search term on Escape
				}
			}}
		/>
		<!-- Search button, now separate and fully rounded -->
		<button
			onclick={handleSearchClick}
			class="flex-shrink-0 px-5 py-2.5 bg-gray-600 text-white font-medium text-base rounded-lg hover:bg-primary-600 transition duration-150 ease-in-out"
			aria-label="Search button"
		>
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
</div>
