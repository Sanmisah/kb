<script setup>
import { router } from "@inertiajs/vue3";
import App from "@/Layouts/app-layout.vue";
import InputLabel from "@/Components/InputLabel.vue";
import TextInput from "@/Components/TextInput.vue";
import SelectInput from "@/Components/SelectInput.vue";
import { Link, useForm, usePage } from "@inertiajs/vue3";
import { ref, onMounted } from "vue";

defineProps({ errors: Object, open: false, inductions: Object});

const quiz_details = ref([]);
const addItem = () => {
    let maxId = 0;
    if (quiz_details.value && quiz_details.value.length) {
        maxId = quiz_details.value.reduce(
            (max, character) => (character.id > max ? character.id : max),
            quiz_details.value[0].id
        );
    }
    quiz_details.value.push({
        id: maxId + 1,
        answer: "",
        isCorrect: "",
    });
};
const removeItem = (item = null) => {
    quiz_details.value = quiz_details.value.filter((d) => d.id != item.id);
};
const form = useForm({
    question: null,
    type: null,
    induction_id: null,
    quiz_details: null,
});
function submit() {
    form.quiz_details = quiz_details;
    router.post("/quiz", form);
}
</script>

<template>
    <App>
        <ul class="flex space-x-2 rtl:space-x-reverse">
            <li>
                <Link href="/quiz"
                    :class="{ active: $page.component === 'Quiz/Index' }"
                    >Quiz</Link>
            </li>
        </ul>
        <div class="pt-5">
            <form class="space-y-5" @submit.prevent="submit">
                <div class="panel">
                    <div class="flex items-center justify-between mb-5">
                        <h5 class="font-semibold text-lg dark:text-white-light">
                            Create Quiz
                        </h5>
                    </div>
                    <div class="grid grid-cols-1 gap-4 mb-4">                       
                        <TextInput type="text" label="Question" v-model="form.question" :required="true" :error="errors.question"/>
                    </div>
                    <div class="grid grid-cols-4 gap-4 mb-4">
                        <SelectInput label="Induction" v-model="form.induction_id" :data="inductions" :error="errors.induction_id" />
                        <div>
                            <InputLabel
                                class="after:content-['*'] after:text-red-500"
                                value="Question Type"
                            />
                            <select class="form-select " v-model="form.type" v-on:change="questionType()">    
                                <option>Select</option>                            
                                <option value="Single Choice">Single Choice</option>
                                <option value="Multiple Choice">Multiple Choice</option>                                
                            </select>
                            <br />
                            <div class="mt-2 text-red-500" v-if="errors.type">
                                {{ errors.type }}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel table-responsive">
                    <div class="flex items-center justify-between mb-5">
                        <h5 class="font-semibold text-lg dark:text-white-light">
                            Add Quiz Answers
                        </h5>
                    </div>
                    <div class="flex xl:flex-row flex-col gap-2.5">
                        <div class="panel px-0 flex-1 py-1 ltr:xl:mr-6 rtl:xl:ml-6">
                            <div class="mt-8">
                                <div class="table-responsive">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Option</th>
                                                <th>Correct</th>
                                                <th class="w-1"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <template v-if="quiz_details.length <= 0">
                                                <tr>
                                                    <td colspan="5" class="!text-center font-semibold">
                                                        No Item Available
                                                    </td>
                                                </tr>
                                            </template>
                                            <template v-for="(item, i) in quiz_details" :key="i">
                                                <tr class="align-top">
                                                    <td>
                                                        <TextInput type="text" v-model="
                                                            item.answer"/>
                                                    </td>
                                                    <td>
                                                        <input type="checkbox" class="form-checkbox text-success myCheck" v-model="item.isCorrect" />
                                                    </td>
                                                    <td>
                                                        <button type="button" @click="
                                                            removeItem(item)">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24px"
                                                                height="24px" viewBox="0 0 24 24" fill="none"
                                                                stroke="currentColor" stroke-width="1.5"
                                                                stroke-linecap="round" stroke-linejoin="round"
                                                                class="w-5 h-5">
                                                                <line x1="18" y1="6" x2="6" y2="18"></line>
                                                                <line x1="6" y1="6" x2="18" y2="18"></line>
                                                            </svg>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </template>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="flex justify-between sm:flex-row flex-col mt-6 px-4">
                                    <div class="sm:mb-0 mb-6">
                                        <button type="button" class="btn btn-primary" @click="addItem()">
                                            Add
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="flex justify-end mt-4">
                    <button type="submit" class="btn btn-success">Submit</button
                    >&nbsp;&nbsp;
                    <Link
                        href="/quiz"
                        class="btn btn-danger"
                        :class="{
                            active: $page.component === 'Quiz/Index',
                        }"
                        >Cancel</Link>
                </div>
            </form>
        </div>
    </App>
</template>
