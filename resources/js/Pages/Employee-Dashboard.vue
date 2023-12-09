<script setup>
import Search from "@/Components/SearchFilter.vue";
import { watch } from "vue";
import Pagination from "@/Components/Pagination.vue";
import { ref , onMounted} from 'vue';
import { router } from '@inertiajs/vue3';
import Employee from '@/Layouts/EmployeeLayout.vue';
import { Head } from '@inertiajs/vue3';
import DLink from '@/Components/DashboardLink.vue';

const props = defineProps({
  notices: {
    type: Object,
    default: () => ({}),
  },
  filters: {
    type: Object,
    default: () => ({}),
  },
  articles: {
    type: Object,
    default: () => ({}),
  }
});
const tabMainChanged = (tabType) => {
    tabMain.value = tabType;
};
const tabMain = ref('notice');
let search = ref(props.filters.search);

watch(search, (value) => {
  router.get(
    "employee_dashboard",
    { search: value },
    {
      preserveState: true,
      replace: true,
    }
  );
});
</script>

<template>
    <Head title="Dashboard" />

    <Employee>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Employee</h2>
        </template>
        <DLink></DLink>
        <br />        
        <div class="panel">
            <div class="mb-5">
                <div class="mb-4 flex items-center sm:flex-row flex-col sm:justify-between justify-center">
                    <div class="sm:mb-0 mb-4">
                        <div class="text-lg font-semibold ltr:sm:text-left rtl:sm:text-right text-center">
                            Notices
                        </div>
                    </div>
                    <div class="grid justify-items-stretch">
                        <div>
                            <Search v-model="search" class="mr-4 w-full max-w-md">
                            </Search>
                        </div>
                    </div>
                </div>
                <div>
                    <!--<div class="table-responsive grow overflow-y-auto min-h-[300px]">-->
                        <table>
                            <tbody>
                                <template v-for="(notice, index) in notices.data">
                                    <tr>
                                        <td>
                                            {{ index + 1 }}
                                        </td>
                                        <td>
                                            <span class="'text-gray-800 dark:text-gray-300 font-semibold'">
                                                {{ notice.sr_no }}
                                            </span>
                                        </td>
                                        <!--<td style="word-break:break-all;white-space: normal;">
                                            <div class="font-medium overflow-hidden min-w-[300px] line-clamp-1">
                                                <span class="'text-gray-800 dark:text-gray-300 font-semibold'">
                                                    {{ notice.notice }}
                                                </span>
                                            </div>
                                        </td>
                                        <td style="word-break:break-all;white-space: normal;">
                                            <div class="font-medium overflow-hidden min-w-[300px] line-clamp-1">
                                                <span class="'text-gray-800 dark:text-gray-300 font-semibold'">
                                                    {{ notice.description }}
                                                </span>
                                            </div>
                                        </td>-->
                                        <td>
                                            <div
                                                class="group-hover:text-primary font-semibold text-base whitespace-nowrap">
                                                {{ notice.notice }}
                                            </div>
                                            <div style="word-break:break-all;white-space: normal;" 
                                                class="text-white-dark overflow-hidden min-w-[300px] line-clamp-1"
                                                >
                                                {{ notice.description }}
                                            </div>
                                        </td>
                                        <td class="whitespace-nowrap font-medium ltr:text-right rtl:text-left">
                                            {{ notice.notice_date}}
                                        </td>
                                        <td>
                                        <!--<a href="'/media/'+ notice.getFirstMediaUrl('attachment')" target="_blank"></a>-->
                                        <button
                                            type="button"
                                            class="btn btn-outline-primary rounded-full p-2 bg-[#fafafa] dark:bg-[#060818] dark:hover:bg-primary"
                                           >
                                            <svg width="24" height="24" class="h-4 w-4" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M8 22.0002H16C18.8284 22.0002 20.2426 22.0002 21.1213 21.1215C22 20.2429 22 18.8286 22 16.0002V15.0002C22 12.1718 22 10.7576 21.1213 9.8789C20.3529 9.11051 19.175 9.01406 17 9.00195M7 9.00195C4.82497 9.01406 3.64706 9.11051 2.87868 9.87889C2 10.7576 2 12.1718 2 15.0002L2 16.0002C2 18.8286 2 20.2429 2.87868 21.1215C3.17848 21.4213 3.54062 21.6188 4 21.749"
                                                    stroke="currentColor"
                                                    stroke-width="1.5"
                                                    stroke-linecap="round"
                                                />
                                                <path
                                                    d="M12 2L12 15M12 15L9 11.5M12 15L15 11.5"
                                                    stroke="currentColor"
                                                    stroke-width="1.5"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                                />
                                            </svg>
                                            </button>
                                            
                                        </td>
                                    </tr>
                                </template>
                            </tbody>
                        </table>
                    <!--</div>-->
                </div>
            </div>
            <Pagination :data="notices" />
        </div>
        <br />
        <!--<div class="panel flex-1 overflow-auto h-full">
            <div class="mb-5">
                <div class="mb-4 flex items-center sm:flex-row flex-col sm:justify-between justify-center">
                    <div class="sm:mb-0 mb-4">
                        <div class="text-lg font-semibold ltr:sm:text-left rtl:sm:text-right text-center">
                            <h3>Article</h3>
                        </div>
                    </div>
                    <div class="grid justify-items-stretch">
                        <div>
                            <Search v-model="search" class="mr-4 w-full max-w-md">
                            </Search>
                        </div>
                    </div>
                </div>
            </div>
            <div class="grid md:grid-cols-1 xl:grid-cols-3 gap-6">
                <template v-for="(article, index) in articles.data">
                <div class="panel h-full dark:shadow-dark">
                <section class="text-gray-600 body-font">
                    <div class="container mx-auto">
                        <div class="-my-8 divide-y-2 divide-gray-100">
                            <div class="py-8 flex flex-wrap md:flex-nowrap">                        
                                <div class="md:flex-grow">
                                    <span class="font-semibold title-font text-gray-700">
                                        {{article.section_name}}
                                    </span>
                                    <br />
                                    <span class="mt-1 text-gray-500 text-sm">
                                        {{article.created_at}}
                                    </span>
                                    <h2 class="text-xl font-medium text-gray-900 title-font mb-2">
                                        {{article.topic}}
                                    </h2>
                                    <p class="leading-relaxed">
                                        {{article.description}}
                                    </p>
                                </div>
                                <div class="md:w-30 md:mb-0 mb-6 flex-shrink-0 flex flex-col">
                                    <a
                                        href="javascript:;"
                                        class="flex items-center bg-success/30 text-success rounded-md px-1.5 py-1 text-xs hover:shadow-[0_10px_20px_-10px] hover:shadow-success"
                                        >Read More
                                        <svg
                                            width="24"
                                            height="24"
                                            viewBox="0 0 24 24"
                                            fill="none"
                                            xmlns="http://www.w3.org/2000/svg"
                                            class="w-4 h-4 rtl:rotate-180 ltr:ml-1.5 rtl:mr-1.5"
                                        >
                                            <path d="M11 19L17 12L11 5" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                                            <path
                                                opacity="0.5"
                                                d="M6.99976 19L12.9998 12L6.99976 5"
                                                stroke="currentColor"
                                                stroke-width="1.5"
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                            />
                                        </svg>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                </div>
                </template>
            </div>
        </div>-->
    </Employee>
</template>
