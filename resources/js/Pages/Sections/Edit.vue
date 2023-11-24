<script setup>
import { reactive } from 'vue';
import { router } from '@inertiajs/vue3';
import App from '@/Layouts/app-layout.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { ref, onMounted } from "vue";
import { Link, useForm, usePage } from '@inertiajs/vue3';
import { useAppStore } from "@/stores/index";

const props = defineProps({ section: Object, errors: Object});

const form = useForm({
   section_name: props.section.section_name,
});

</script>
<template>    
    <App>
        <ul class="flex space-x-2 rtl:space-x-reverse">
            <li>
                <Link href="/sections" :class="{ 'active': $page.component === 'Sections/Index' }">Section</Link>
            </li>
        </ul>
        <br>
        <div class="pt-5">
            <form class="space-y-5" @submit.prevent="form.patch(route('sections.update', props.section.id))">
            <div class="panel">
                <div class="flex items-center justify-between mb-5">
                  <h5 class="font-semibold text-lg dark:text-white-light">Edit Sections</h5>
                </div>
                <div class="grid grid-cols-4 gap-4 mb-4">
                    <TextInput type="text" label="Name" :error="errors.section_name" :required="true" v-model="form.section_name"/>
                </div>
                <div class="flex justify-end mt-4">
                    <button type="submit" class="btn btn-success">Submit</button>&nbsp;&nbsp;
                    <Link href="/sections" class="btn btn-danger" :class="{ 'active': $page.component === 'Sections/Index' }">Cancel</Link>
                </div>
            </div>
            </form>
        </div>
    </App>
</template>
