export default {
    content: [
        "./src/**/*.{html,js,svelte,ts}",
    ],
    theme: {
        extend: {
            colors: {
                "medium-blue": "var(--medium-blue)",
                "light-gray": "var(--light-gray)",
                "dark-blue": "var(--dark-blue)",
                "white": "var(--white)",
                "light-blue": "var(--light-blue)",
                "gray": "var(--gray)",
            },
            fontFamily: {
                poppins: ["Poppins", "sans-serif"],
            },
        },
    },
    plugins: [
        require("@tailwindcss/forms"), // Add this line
        require("@tailwindcss/typography"), // Add this line
    ],
};

