<template>
    <Employee>
    <DLink></DLink>
    <br />
    <div>
        <div class="flex gap-5 relative sm:h-[calc(100vh_-_150px)] h-full">
            <div
                class="panel p-4 flex-none w-[240px] max-w-full absolute xl:relative z-10 space-y-4 xl:h-auto h-full xl:block ltr:xl:rounded-r-md ltr:rounded-r-none rtl:xl:rounded-l-md rtl:rounded-l-none hidden"
                :class="{ '!block': isShowTaskMenu }"
            >
                <div class="flex flex-col h-full pb-16">
                    <div class="pb-5">
                        <div class="flex text-center items-center">
                            <h3 class="text-lg font-semibold ltr:ml-3 rtl:mr-3">Quiz</h3>
                        </div>
                    </div>
                    <div class="h-px w-full border-b border-[#e0e6ed] dark:border-[#1b2e4b] mb-5"></div>
                    <perfect-scrollbar
                        :options="{
                            swipeEasing: true,
                            wheelPropagation: false,
                        }"
                        class="relative ltr:pr-3.5 rtl:pl-3.5 ltr:-mr-3.5 rtl:-ml-3.5 h-full grow">
                        <div>        
                            <template v-for="(val, index) in quiz">
                                <button
                                type="button"
                                class=" items-center h-10 p-1  rounded-md dark:hover:bg-[#181F32] font-medium text-success ltr:hover:pl-3 rtl:hover:pr-3 duration-300"
                                :class="{ 'ltr:pl-3 rtl:pr-3 bg-gray-100 dark:bg-[#181F32]': selectedTab ===  index}"
                                @click='tabChanged( index )'>                                
                                    <span class="badge badge-outline-primary hover:badge badge-outline-success">{{ index+1 }}</span>
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
                    <!-- <div class="p-4 flex sm:flex-row flex-col w-full sm:items-center gap-4">
                        <div class="ltr:mr-3 rtl:ml-3 flex items-center">
                            <button type="button" class="xl:hidden hover:text-primary block ltr:mr-3 rtl:ml-3" @click="isShowTaskMenu = !isShowTaskMenu">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="w-6 h-6">
                                    <path d="M20 7L4 7" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"></path>
                                    <path opacity="0.5" d="M20 12L4 12" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"></path>
                                    <path d="M20 17L4 17" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"></path>
                                </svg>
                            </button>                            
                        </div>                        
                    </div> -->
                    <div class="panel">
                        <form class="space-y-5" @submit.prevent="submit">
                            <div class="inline-block items-center justify-between ">
                                <template v-for="(val, index) in quiz" >  
                                    <div class="grid grid-cols-1 gap-2" v-bind:id="'row_' + (index+1)">
                                        <div>
                                            <span class="text-white-dark">{{ index+1 }}</span> &nbsp;&nbsp;
                                            {{ val.question }}
                                        </div>
                                        <template v-for="(vals, i) in val.quiz_details" >
                                            <div class="flex-1">
                                                <div class="mb-2">
                                                    <label class="inline-flex mt-1 cursor-pointer">
                                                        <input type="radio" v-model="form.single_choice_answer" class="form-radio" :value="vals.answer"/>
                                                        <span class="text-white-dark">{{ vals.answer }}</span>
                                                    </label>
                                                </div>
                                            </div>
                                        </template>
                                    </div>        
                                </template>
                            </div>
                        </form>
                    </div>
                    <!-- <template v-if="!pagedTasks.length">
                        <div class="flex justify-center items-center sm:min-h-[300px] min-h-[400px] font-semibold text-lg h-full">No data available</div>
                    </template> -->
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
    import { Link, useForm, usePage } from "@inertiajs/vue3";
    import { router } from "@inertiajs/vue3";

    const props = defineProps({
        filters: {
            type: Object,
            default: () => ({}),
        },
        articles: {
            type: Array,
            default: () => ({}),
        },
        quiz: {
            type: Object,
            default: () => ({}),
        }       
    });
    console.log(props.quiz);
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

    const form = useForm({
        single_choice_answer: null,
        question: props.quiz[0].question,
    });
    
    function submit() {
        router.post("/employee_dashboard", form);
    }
  
</script>
