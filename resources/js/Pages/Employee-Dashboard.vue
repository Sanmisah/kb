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
                                        <a :href="'/employee_dashboard/' + notice.id + '/view/'" target="_blank">
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
                                            </a>
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
            
    </Employee>
</template>
