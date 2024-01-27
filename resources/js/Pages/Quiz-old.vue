<script setup>
import Pagination from "@/Components/Pagination.vue";
import { ref , onMounted} from 'vue';
import { watch } from "vue";
import Employee from '@/Layouts/EmployeeLayout.vue';
import DLink from '@/Components/DashboardLink1.vue';
import { Link, useForm, usePage } from "@inertiajs/vue3";
import { router } from "@inertiajs/vue3";

const props = defineProps({
  quiz: Object, 
});

const tabMainChanged = (tabType) => {
    tabMain.value = tabType;
};

const tabMain = ref('notice');

const form = useForm({
    multiple_choice_answer: null,
    single_choice_answer: null,
    quiz_id: props.quiz.data[0].id,
    induction_id: props.quiz.data[0].induction_id,
    next_page_url: props.quiz.next_page_url,
    quiz_answer: props.quiz.data[0].answer,
    last_page_url: props.quiz.last_page_url,
    current_page: props.quiz.current_page,
    last_page: props.quiz.last_page,
});
console.log(props.quiz);
function submit() {
    router.post("/employee_dashboard", form);
}

</script>

<template>
    <Employee>
        <DLink></DLink>
        <br>
        <div class="panel">
            <div class="flex items-center justify-between mb-5">
                <h5 class="font-semibold text-lg dark:text-white-light">Quiz</h5>
            </div>
            <div class="mb-5">
                <form class="space-y-5" @submit.prevent="submit">
                    <div class="flex sm:flex-row flex-col" v-for="(val, index) in quiz.data">
                        <input type="hidden" class="form-input" v-model="form.quiz_id"/> 
                        <input type="hidden" class="form-input" v-model="form.induction_id"/>                        
                        <input type="hidden" class="form-input" v-model="form.next_page_url"/> 
                        <input type="hidden" class="form-input" v-model="form.quiz_answer"/>
                        <input type="hidden" class="form-input" v-model="form.last_page_url"/> 
                        <input type="hidden" class="form-input" v-model="form.current_page"/> 
                        <input type="hidden" class="form-input" v-model="form.last_page"/> 
                        <div v-if="val.type == 'Single Choice'">
                            <div class="flex-1">
                                <div class="mb-2">
                                    <span class="text-white-dark">{{ quiz.current_page }}</span>
                                    {{ val.question }}
                                </div>
                                <div class="mb-2">
                                    <input type="text" v-model="form.single_choice_answer" class="form-input">
                                </div>
                            </div>
                        </div>
                        <div v-if="val.type == 'Multiple Choice'">
                            <div class="flex-1">
                                <div class="mb-2">
                                    <span class="text-white-dark">{{ quiz.current_page }}</span> &nbsp;&nbsp;
                                    {{ val.question }}
                                </div>
                                <div class="mb-2">
                                    <label class="inline-flex mt-1 cursor-pointer">
                                        <input type="radio" v-model="form.multiple_choice_answer" class="form-radio" :value="val.choice_1"/>
                                        <span class="text-white-dark">{{ val.choice_1 }}</span>
                                    </label>
                                </div>
                                <div class="mb-2">
                                    <label class="inline-flex mt-1 cursor-pointer">
                                        <input type="radio" v-model="form.multiple_choice_answer" class="form-radio" :value="val.choice_2"/>
                                        <span class="text-white-dark">{{ val.choice_2 }}</span>
                                    </label>
                                </div>
                                <div>
                                    <label class="inline-flex mt-1">
                                        <input type="radio" v-model="form.multiple_choice_answer" :value="val.choice_3" class="form-radio"/>
                                        <span class="text-white-dark">{{ val.choice_3 }}</span>
                                    </label>
                                </div>
                                <div>
                                    <label class="inline-flex mt-1">
                                        <input type="radio" v-model="form.multiple_choice_answer" :value="val.choice_4" class="form-radio"/>
                                        <span class="text-white-dark">{{ val.choice_4 }}</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary !mt-6">Submit</button>
                </form>
            </div> 
            <Pagination :data="quiz" />   
        </div>
    </Employee>
</template>
