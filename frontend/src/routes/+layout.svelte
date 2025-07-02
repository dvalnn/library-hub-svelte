<script lang="ts">
	import "../app.css";
	import TabsRadio from "./TabsRadio.svelte";
	import { goto } from "$app/navigation";
	import { page } from "$app/stores";

	let activeTab = $state($page.url.pathname.split("/")[1] || "records");

	// Only navigate if tab changes manually (avoid re-triggering on initial load)
	$effect(() => {
		const currentPath = $page.url.pathname.split("/")[1] || "records";
		if (activeTab !== currentPath) {
			goto(`/${activeTab}`);
		}
	});

	let { children } = $props();
</script>

<div class="min-h-screen flex flex-col bg-gray-50 font-inter text-gray-900">
	<!-- Top Navigation Bar -->
	<header
		class="fixed top-0 left-0 right-0 z-10 bg-white shadow-md h-16 flex items-center justify-center px-4"
	>
		<TabsRadio bind:selected={activeTab} />
	</header>

	<!-- Main content area -->
	<main class="flex-1 pt-20 px-4 sm:px-6 md:px-8 bg-gray-50">
		{@render children()}
	</main>
</div>

<style>
	@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap");

	.font-inter {
		font-family: "Poppins", sans-serif;
	}
</style>
