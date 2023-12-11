<template>
    <Employee>
    <DLink></DLink>
    <div>
        <div class="flex gap-5 relative sm:h-[calc(100vh_-_150px)] h-full">
            <div
                class="panel p-4 flex-none w-[240px] max-w-full absolute xl:relative z-10 space-y-4 xl:h-auto h-full xl:block ltr:xl:rounded-r-md ltr:rounded-r-none rtl:xl:rounded-l-md rtl:rounded-l-none hidden"
                :class="{ '!block': isShowTaskMenu }"
            >
                <div class="flex flex-col h-full pb-16">
                    <div class="pb-5">
                        <div class="flex text-center items-center">
                            <div class=" shrink-0">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="w-5 h-5">
                                    <path
                                        opacity="0.5"
                                        d="M16 4.00195C18.175 4.01406 19.3529 4.11051 20.1213 4.87889C21 5.75757 21 7.17179 21 10.0002V16.0002C21 18.8286 21 20.2429 20.1213 21.1215C19.2426 22.0002 17.8284 22.0002 15 22.0002H9C6.17157 22.0002 4.75736 22.0002 3.87868 21.1215C3 20.2429 3 18.8286 3 16.0002V10.0002C3 7.17179 3 5.75757 3.87868 4.87889C4.64706 4.11051 5.82497 4.01406 8 4.00195"
                                        stroke="currentColor"
                                        stroke-width="1.5"
                                    />
                                    <path d="M8 14H16" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                                    <path d="M7 10.5H17" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                                    <path d="M9 17.5H15" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                                    <path
                                        d="M8 3.5C8 2.67157 8.67157 2 9.5 2H14.5C15.3284 2 16 2.67157 16 3.5V4.5C16 5.32843 15.3284 6 14.5 6H9.5C8.67157 6 8 5.32843 8 4.5V3.5Z"
                                        stroke="currentColor"
                                        stroke-width="1.5"
                                    />
                                </svg>
                            </div>
                            <h3 class="text-lg font-semibold ltr:ml-3 rtl:mr-3">Articles</h3>
                        </div>
                    </div>
                    <div class="h-px w-full border-b border-[#e0e6ed] dark:border-[#1b2e4b] mb-5"></div>
                    <perfect-scrollbar
                        :options="{
                            swipeEasing: true,
                            wheelPropagation: false,
                        }"
                        class="relative ltr:pr-3.5 rtl:pl-3.5 ltr:-mr-3.5 rtl:-ml-3.5 h-full grow"
                    >
                        <div class="space-y-1">                          
                           
                            <div class="text-white-dark px-1 py-3">Sections</div>
                            <button
                            type="button"
                            class="w-full flex justify-between items-center p-2 hover:bg-white-dark/10 rounded-md dark:hover:text-primary hover:text-primary dark:hover:bg-[#181F32] font-medium h-10"
                            :class="{ 'bg-gray-100 dark:text-primary text-primary dark:bg-[#181F32]': selectedTab === '' }"
                            @click="tabChanged('')"
                        >
                            <div class="flex items-center">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="w-4.5 h-4.5 shrink-0">
                                    <path
                                        d="M2 5.5L3.21429 7L7.5 3"
                                        stroke="currentColor"
                                        stroke-width="1.5"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                    />
                                    <path
                                        opacity="0.5"
                                        d="M2 12.5L3.21429 14L7.5 10"
                                        stroke="currentColor"
                                        stroke-width="1.5"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                    />
                                    <path
                                        d="M2 19.5L3.21429 21L7.5 17"
                                        stroke="currentColor"
                                        stroke-width="1.5"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                    />
                                    <path d="M22 19L12 19" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                                    <path opacity="0.5" d="M22 12L12 12" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                                    <path d="M22 5L12 5" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                                </svg>
                                <div class="ltr:ml-3 rtl:mr-3">All</div>
                            </div>
                        </button>
                            <template v-for="(section, index) in sections">
                            <button
                                type="button"
                                class="w-full flex items-center h-10 p-1 hover:bg-white-dark/10 rounded-md dark:hover:bg-[#181F32] font-medium text-success ltr:hover:pl-3 rtl:hover:pr-3 duration-300"
                                :class="{ 'ltr:pl-3 rtl:pr-3 bg-gray-100 dark:bg-[#181F32]': selectedTab ===  section.section_name}"
                                @click='tabChanged( section.section_name )'
                            >
                                <svg
                                    width="24"
                                    height="24"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    xmlns="http://www.w3.org/2000/svg"
                                    class="w-3 h-3 rotate-45 fill-success shrink-0"
                                >
                                    <path
                                        d="M2 12C2 7.28595 2 4.92893 3.46447 3.46447C4.92893 2 7.28595 2 12 2C16.714 2 19.0711 2 20.5355 3.46447C22 4.92893 22 7.28595 22 12C22 16.714 22 19.0711 20.5355 20.5355C19.0711 22 16.714 22 12 22C7.28595 22 4.92893 22 3.46447 20.5355C2 19.0711 2 16.714 2 12Z"
                                        stroke="currentColor"
                                        stroke-width="1.5"
                                    />
                                </svg>
                                <div class="ltr:ml-3 rtl:mr-3">{{ section.section_name }}</div>
                            </button>
                             </template>

                           

                           
                        </div>
                    </perfect-scrollbar>
                  
                </div>
            </div>
            <div
                class="overlay bg-black/60 z-[5] w-full h-full rounded-md absolute hidden"
                :class="{ '!block xl:!hidden': isShowTaskMenu }"
                @click="isShowTaskMenu = !isShowTaskMenu"
            ></div>
            <div class="panel p-0 flex-1 overflow-auto h-full">
                <div class="flex flex-col h-full">
                    <div class="p-4 flex sm:flex-row flex-col w-full sm:items-center gap-4">
                        <div class="ltr:mr-3 rtl:ml-3 flex items-center">
                            <button type="button" class="xl:hidden hover:text-primary block ltr:mr-3 rtl:ml-3" @click="isShowTaskMenu = !isShowTaskMenu">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="w-6 h-6">
                                    <path d="M20 7L4 7" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"></path>
                                    <path opacity="0.5" d="M20 12L4 12" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"></path>
                                    <path d="M20 17L4 17" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"></path>
                                </svg>
                            </button>
                            <div class="relative group flex-1">
                                <input
                                    type="text"
                                    class="form-input peer ltr:!pr-10 rtl:!pl-10"
                                    placeholder="Search Task..."
                                    v-model="searchTask"
                                    @keyup="searchTasks()"
                                />
                                <div class="absolute ltr:right-[11px] rtl:left-[11px] top-1/2 -translate-y-1/2 peer-focus:text-primary">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="w-4 h-4">
                                        <circle cx="11.5" cy="11.5" r="9.5" stroke="currentColor" stroke-width="1.5" opacity="0.5"></circle>
                                        <path d="M18.5 18.5L22 22" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"></path>
                                    </svg>
                                </div>
                            </div>
                        </div>
                        <div class="flex items-center justify-center sm:justify-end sm:flex-auto flex-1">
                            <p class="ltr:mr-3 rtl:ml-3">
                                {{ pager.startIndex + 1 + '-' + (pager.endIndex + 1) + ' of ' + filteredTasks.length }}
                            </p>
                            <button
                                type="button"
                                :disabled="pager.currentPage == 1"
                                class="bg-[#f4f4f4] rounded-md p-1 enabled:hover:bg-primary-light dark:bg-white-dark/20 enabled:dark:hover:bg-white-dark/30 ltr:mr-3 rtl:ml-3 disabled:opacity-60 disabled:cursor-not-allowed"
                                @click="pager.currentPage--, searchTasks(false)"
                            >
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 rtl:rotate-180">
                                    <path d="M15 5L9 12L15 19" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                </svg>
                            </button>
                            <button
                                type="button"
                                :disabled="pager.currentPage == pager.totalPages"
                                class="bg-[#f4f4f4] rounded-md p-1 enabled:hover:bg-primary-light dark:bg-white-dark/20 enabled:dark:hover:bg-white-dark/30 disabled:opacity-60 disabled:cursor-not-allowed"
                                @click="pager.currentPage++, searchTasks(false)"
                            >
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 ltr:rotate-180">
                                    <path d="M15 5L9 12L15 19" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                </svg>
                            </button>
                        </div>
                    </div>
                    <div class="h-px w-full border-b border-[#e0e6ed] dark:border-[#1b2e4b]"></div>
                    <template v-if="pagedTasks.length">
                        <div class="table-responsive grow  sm:min-h-[300px] min-h-[400px]">
                            <table class="table-hover">
                                <tbody>
                                    <template v-for="task in pagedTasks" :key="task.id">
                                        <tr class="group cursor-pointer" :class="{ 'bg-white-light/30 dark:bg-[#1a2941]': task.status === 'complete' }">
                                           <a :href="'/article-detail/' + task.id">
                                            <td>
                                                <div @click="viewTask(task)">
                                                    <div
                                                        class="group-hover:text-primary font-semibold text-base whitespace-nowrap"
                                                        :class="{ 'line-through': task.status === 'complete' }"
                                                    >
                                                        {{ task.title }}
                                                    </div>
                                                    <div
                                                        class="text-white-dark overflow-hidden min-w-[300px] line-clamp-1"
                                                        :class="{ 'line-through': task.status === 'complete' }"
                                                    >
                                                        {{ task.descriptionText }}
                                                    </div>
                                                </div>
                                            </td>
                                            <td >

                                                <template v-if="task.tag">
                                                    <div>                                                           
                                                        <a
                                                            href="#"
                                                            class="badge rounded-full hover:top-0 hover:text-white badge-outline-primary hover:bg-info "
                                                            
                                                        >
                                                            {{ task.tag }}
                                                        </a>
                                                            
                                                    </div>
                                                </template>
                                            </td>
                                            <td >
                                                <p
                                                    class="whitespace-nowrap text-white-dark font-medium"
                                                    :class="{ 'line-through': task.status === 'complete' }"
                                                >
                                                    {{ task.date }}
                                                </p>
                                            </td>         
                                        </a>                                  
                                        </tr>
                                    </template>
                                </tbody>
                            </table>
                        </div>
                    </template>
                    <template v-if="!pagedTasks.length">
                        <div class="flex justify-center items-center sm:min-h-[300px] min-h-[400px] font-semibold text-lg h-full">No data available</div>
                    </template>
                </div>
            </div>

         
        </div>
    </div>
</Employee>
</template>
<script lang="ts" setup>
    import { ref, onMounted } from 'vue';
    import { useAppStore } from '@/stores/index';
    import Employee from '@/Layouts/EmployeeLayout.vue';
    import DLink from '@/Components/DashboardLink.vue';
    const props = defineProps({
    filters: {
        type: Object,
        default: () => ({}),
    },
    articles: {
        type: Array,
        default: () => ({}),
    },
    sections: {
        type: Object,
        default: () => ({}),
    }
});
    const store = useAppStore();

    const defaultParams = ref({
        id: null,
        title: '',
        description: '',
        descriptionText: '',
        assignee: '',
        path: '',
        tag: '',
        priority: 'low',
    });

    const selectedTab = ref('');
    const isShowTaskMenu = ref(false);
    const viewTaskModal = ref(false);


 

    const params = ref(JSON.parse(JSON.stringify(defaultParams.value)));
    const allTasks = ref([]);
    props.articles.map(function (value) {
        allTasks.value.push({
            id: value.id,
            description: value.description,
            descriptionText: value.description,
            title: value.topic,
            date: value.created_at,          
            tag: ''+value.section.section_name+'',
            priority: 'medium',
            assignee: '',
            path: '',
            status: '',
        });
        
    });
    const filteredTasks: any = ref([]);
    const pagedTasks: any = ref([]);
    const searchTask = ref('');
    const selectedTask: any = ref(defaultParams.value);
    const isPriorityMenu: any = ref(null);
    const isTagMenu: any = ref(null);

    const pager = ref({
        currentPage: 1,
        totalPages: 0,
        pageSize: 10,
        startIndex: 0,
        endIndex: 0,
    });


    onMounted(() => {
        searchTasks();
    });

   

    const searchTasks = (isResetPage = true) => {
        if (isResetPage) {
            pager.value.currentPage = 1;
        }
        console.log(selectedTab.value)
        let res;
        
        res = allTasks.value.filter((d) => d.tag === selectedTab.value);
        if(selectedTab.value == ''){
            res = allTasks.value.filter((d) => d.tag?.toLowerCase(selectedTab.value));

        }

        
      
        filteredTasks.value = res.filter((d) => d.title?.includes(searchTask.value));
        getPager();
    };

    const getPager = () => {
        setTimeout(() => {
            if (filteredTasks.value.length) {
                pager.value.totalPages = pager.value.pageSize < 1 ? 1 : Math.ceil(filteredTasks.value.length / pager.value.pageSize);
                if (pager.value.currentPage > pager.value.totalPages) {
                    pager.value.currentPage = 1;
                }
                pager.value.startIndex = (pager.value.currentPage - 1) * pager.value.pageSize;
                pager.value.endIndex = Math.min(pager.value.startIndex + pager.value.pageSize - 1, filteredTasks.value.length - 1);
                pagedTasks.value = filteredTasks.value.slice(pager.value.startIndex, pager.value.endIndex + 1);
            } else {
                pagedTasks.value = [];
                pager.value.startIndex = -1;
                pager.value.endIndex = -1;
            }
        });
    };

    const setPriority = (task: any, name: string = '') => {
        let item = filteredTasks.value.find((d) => d.id === task.id);
        item.priority = name;
        searchTasks(false);
    };

    const setTag = (task: any, name: string = '') => {
        let item = filteredTasks.value.find((d) => d.id === task.id);
        item.tag = name;
        searchTasks(false);
    };

    const tabChanged = (type: any = null) => {
        selectedTab.value = type;
        searchTasks();
        isShowTaskMenu.value = false;
    };

   

    const viewTask = (item: any = null) => {
        selectedTask.value = item;
        setTimeout(() => {
            viewTaskModal.value = true;
        });
    };

    
  
</script>
