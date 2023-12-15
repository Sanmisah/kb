<template>
    <div class="panel p-0 flex-1 overflow-x-hidden h-full">
        <div class="flex flex-col h-full">
            <div class="h-px border-b border-[#e0e6ed] dark:border-[#1b2e4b]"></div>
            <div class="flex flex-wrap flex-col md:flex-row xl:w-auto justify-between items-center px-4 pb-4">
                <div class="w-full sm:w-auto grid grid-cols-2 sm:grid-cols-4 gap-3 mt-4">
                    <Link :href="'/employee_dashboard'">
                    <button type="button"
                        class="btn btn-outline-primary flex"
                        :class="{ 'text-white bg-primary': selectMainTab === 'notice' }" >
                        <svg
                            width="24"
                            height="24"
                            viewBox="0 0 24 24"
                            fill="none"
                            xmlns="http://www.w3.org/2000/svg"
                            class="w-5 h-5 ltr:mr-2 rtl:ml-2"
                        >
                            <circle cx="12" cy="6" r="4" stroke="currentColor" stroke-width="1.5" />
                            <ellipse opacity="0.5" cx="12" cy="17" rx="7" ry="4" stroke="currentColor" stroke-width="1.5" />
                        </svg>
                        Notice
                    </button>
                    </Link>
                    <Link :href="'/article'">
                    <button
                        type="button"
                        class="btn btn-outline-warning flex"
                        :class="{ 'text-white bg-warning': selectMainTab === modelValue }">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 ltr:mr-2 rtl:ml-2">
                                <path
                                    opacity="0.5"
                                    d="M16.755 2H7.24502C6.08614 2 5.50671 2 5.03939 2.16261C4.15322 2.47096 3.45748 3.18719 3.15795 4.09946C3 4.58055 3 5.17705 3 6.37006V20.3742C3 21.2324 3.985 21.6878 4.6081 21.1176C4.97417 20.7826 5.52583 20.7826 5.8919 21.1176L6.375 21.5597C7.01659 22.1468 7.98341 22.1468 8.625 21.5597C9.26659 20.9726 10.2334 20.9726 10.875 21.5597C11.5166 22.1468 12.4834 22.1468 13.125 21.5597C13.7666 20.9726 14.7334 20.9726 15.375 21.5597C16.0166 22.1468 16.9834 22.1468 17.625 21.5597L18.1081 21.1176C18.4742 20.7826 19.0258 20.7826 19.3919 21.1176C20.015 21.6878 21 21.2324 21 20.3742V6.37006C21 5.17705 21 4.58055 20.842 4.09946C20.5425 3.18719 19.8468 2.47096 18.9606 2.16261C18.4933 2 17.9139 2 16.755 2Z"
                                    stroke="currentColor"
                                    stroke-width="1.5"
                                />
                                <path d="M10.5 11L17 11" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                                <path d="M7 11H7.5" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                                <path d="M7 7.5H7.5" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                                <path d="M7 14.5H7.5" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                                <path d="M10.5 7.5H17" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                                <path d="M10.5 14.5H17" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                            </svg>

                        Article
                    </button>
                    </Link>
                    <Link :href="'/induction'">
                        <button
                            type="button"
                            class="btn btn-outline-secondary flex"
                            :class="{ 'text-white bg-secondary': selectMainTab === modelValue }">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" class="w-5 h-5 ltr:mr-2 rtl:ml-2" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M20.082 3.01787L20.1081 3.76741L20.082 3.01787ZM16.5 3.48757L16.2849 2.76907V2.76907L16.5 3.48757ZM13.6738 4.80287L13.2982 4.15375L13.2982 4.15375L13.6738 4.80287ZM3.9824 3.07501L3.93639 3.8236L3.9824 3.07501ZM7 3.48757L7.19136 2.76239V2.76239L7 3.48757ZM10.2823 4.87558L9.93167 5.5386L10.2823 4.87558ZM13.6276 20.0694L13.9804 20.7312L13.6276 20.0694ZM17 18.6335L16.8086 17.9083H16.8086L17 18.6335ZM19.9851 18.2229L20.032 18.9715L19.9851 18.2229ZM10.3724 20.0694L10.0196 20.7312H10.0196L10.3724 20.0694ZM7 18.6335L7.19136 17.9083H7.19136L7 18.6335ZM4.01486 18.2229L3.96804 18.9715H3.96804L4.01486 18.2229ZM2.75 16.1437V4.99792H1.25V16.1437H2.75ZM22.75 16.1437V4.93332H21.25V16.1437H22.75ZM20.0559 2.26832C18.9175 2.30798 17.4296 2.42639 16.2849 2.76907L16.7151 4.20606C17.6643 3.92191 18.9892 3.80639 20.1081 3.76741L20.0559 2.26832ZM16.2849 2.76907C15.2899 3.06696 14.1706 3.6488 13.2982 4.15375L14.0495 5.452C14.9 4.95981 15.8949 4.45161 16.7151 4.20606L16.2849 2.76907ZM3.93639 3.8236C4.90238 3.88297 5.99643 3.99842 6.80864 4.21274L7.19136 2.76239C6.23055 2.50885 5.01517 2.38707 4.02841 2.32642L3.93639 3.8236ZM6.80864 4.21274C7.77076 4.46663 8.95486 5.02208 9.93167 5.5386L10.6328 4.21257C9.63736 3.68618 8.32766 3.06224 7.19136 2.76239L6.80864 4.21274ZM13.9804 20.7312C14.9714 20.2029 16.1988 19.6206 17.1914 19.3587L16.8086 17.9083C15.6383 18.2171 14.2827 18.8702 13.2748 19.4075L13.9804 20.7312ZM17.1914 19.3587C17.9943 19.1468 19.0732 19.0314 20.032 18.9715L19.9383 17.4744C18.9582 17.5357 17.7591 17.6575 16.8086 17.9083L17.1914 19.3587ZM10.7252 19.4075C9.71727 18.8702 8.3617 18.2171 7.19136 17.9083L6.80864 19.3587C7.8012 19.6206 9.0286 20.2029 10.0196 20.7312L10.7252 19.4075ZM7.19136 17.9083C6.24092 17.6575 5.04176 17.5357 4.06168 17.4744L3.96804 18.9715C4.9268 19.0314 6.00566 19.1468 6.80864 19.3587L7.19136 17.9083ZM21.25 16.1437C21.25 16.8295 20.6817 17.4279 19.9383 17.4744L20.032 18.9715C21.5062 18.8793 22.75 17.6799 22.75 16.1437H21.25ZM22.75 4.93332C22.75 3.47001 21.5847 2.21507 20.0559 2.26832L20.1081 3.76741C20.7229 3.746 21.25 4.25173 21.25 4.93332H22.75ZM1.25 16.1437C1.25 17.6799 2.49378 18.8793 3.96804 18.9715L4.06168 17.4744C3.31831 17.4279 2.75 16.8295 2.75 16.1437H1.25ZM13.2748 19.4075C12.4825 19.8299 11.5175 19.8299 10.7252 19.4075L10.0196 20.7312C11.2529 21.3886 12.7471 21.3886 13.9804 20.7312L13.2748 19.4075ZM13.2982 4.15375C12.4801 4.62721 11.4617 4.65083 10.6328 4.21257L9.93167 5.5386C11.2239 6.22189 12.791 6.18037 14.0495 5.452L13.2982 4.15375ZM2.75 4.99792C2.75 4.30074 3.30243 3.78463 3.93639 3.8236L4.02841 2.32642C2.47017 2.23065 1.25 3.49877 1.25 4.99792H2.75Z"
                                    fill="currentColor"
                                />
                                <path opacity="0.5" d="M12 5.854V20.9999" stroke="currentColor" stroke-width="1.5" />
                                <path opacity="0.5" d="M5 9L9 10" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                                <path opacity="0.5" d="M5 13L9 14" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                                <path opacity="0.5" d="M19 13L15 14" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                                <path
                                    d="M19 5.5V9.51029C19 9.78587 19 9.92366 18.9051 9.97935C18.8103 10.035 18.6806 9.97343 18.4211 9.85018L17.1789 9.26011C17.0911 9.21842 17.0472 9.19757 17 9.19757C16.9528 9.19757 16.9089 9.21842 16.8211 9.26011L15.5789 9.85018C15.3194 9.97343 15.1897 10.035 15.0949 9.97935C15 9.92366 15 9.78587 15 9.51029V6.95002"
                                    stroke="currentColor"
                                    stroke-width="1.5"
                                    stroke-linecap="round"
                                />
                            </svg>
                            Inductions
                        </button>
                    </Link>
                    <Link :href="'/contacts'">
                        <button
                            type="button"
                            class="btn btn-outline-success flex"
                            :class="{ 'text-white bg-success': selectMainTab === modelValue }">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 ltr:mr-2 rtl:ml-2">
                                <circle cx="12" cy="6" r="4" stroke="currentColor" stroke-width="1.5" />
                                <path
                                    opacity="0.5"
                                    d="M18 9C19.6569 9 21 7.88071 21 6.5C21 5.11929 19.6569 4 18 4"
                                    stroke="currentColor"
                                    stroke-width="1.5"
                                    stroke-linecap="round"
                                />
                                <path
                                    opacity="0.5"
                                    d="M6 9C4.34315 9 3 7.88071 3 6.5C3 5.11929 4.34315 4 6 4"
                                    stroke="currentColor"
                                    stroke-width="1.5"
                                    stroke-linecap="round"
                                />
                                <ellipse cx="12" cy="17" rx="6" ry="4" stroke="currentColor" stroke-width="1.5" />
                                <path
                                    opacity="0.5"
                                    d="M20 19C21.7542 18.6153 23 17.6411 23 16.5C23 15.3589 21.7542 14.3847 20 14"
                                    stroke="currentColor"
                                    stroke-width="1.5"
                                    stroke-linecap="round"
                                />
                                <path
                                    opacity="0.5"
                                    d="M4 19C2.24575 18.6153 1 17.6411 1 16.5C1 15.3589 2.24575 14.3847 4 14"
                                    stroke="currentColor"
                                    stroke-width="1.5"
                                    stroke-linecap="round"
                                />
                            </svg>
                            Contacts
                        </button>
                    </Link>
                </div>                    
            </div>                
        </div>              
    </div>
</template>

<script lang="ts" setup>
    import { ref } from 'vue';
    import { useAppStore } from '@/stores/index';
    import { Link } from '@inertiajs/vue3';
    const store = useAppStore();
    const showCustomizer = ref(false);

   
</script>
