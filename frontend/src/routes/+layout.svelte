<script lang="ts">
	import "../app.css";
	import { page } from "$app/state";

	import { BottomNav, BottomNavItem } from "flowbite-svelte";
	import {
		HomeSolid,
		ArchiveSolid,
		CalendarMonthSolid,
		ChartPieSolid,
		BookOpenSolid,
		AdjustmentsHorizontalSolid,
	} from "flowbite-svelte-icons";

	let { children } = $props();
	let activeUrl = $derived(page.url.pathname);

	const activeClass = "font-bold text-primary-600";
	const buttons = [
		{ name: "Home", icon: HomeSolid, path: "/" },
		{ name: "Records", icon: ArchiveSolid, path: "/records" },
		{ name: "History", icon: CalendarMonthSolid, path: "/history" },
		{ name: "Requests", icon: BookOpenSolid, path: "/requisitions" },
		{ name: "Stats", icon: ChartPieSolid, path: "/statistics" },
		{
			name: "Settings",
			icon: AdjustmentsHorizontalSolid,
			path: "/settings",
		},
	];
</script>

<main class="flex flex-col h-screen">
	<div
		class={`
		bg-gray-500 font-sans
		flex flex-col flex-grow items-center justify-center
	`}
	>
		{@render children()}
	</div>

	<BottomNav
		{activeUrl}
		{activeClass}
		position="absolute"
		navType="border"
		outerClass="mt-4"
		innerClass="grid grid-flow-col grid-cols-6"
	>
		{#each buttons as button}
			<BottomNavItem
				href={button.path}
				btnClass="hover:text-white hover:bg-primary-600 active:bg-primary-900"
			>
				<button.icon />
				{button.name}
			</BottomNavItem>
		{/each}
	</BottomNav>
</main>
