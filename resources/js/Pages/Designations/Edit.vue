<script setup>
import App from '@/Layouts/app-layout.vue';
import InputLabel from '@/Components/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import { Link, useForm } from '@inertiajs/vue3';

const props = defineProps({ designation: Object, errors: Object});

const form = useForm({
   designation_name: props.designation.designation_name,
});

</script>
<template>    
    <App>
        <ul class="flex space-x-2 rtl:space-x-reverse">
            <li>
                <Link href="/designations" :class="{ 'active': $page.component === 'Designations/Index' }">Designation</Link>
            </li>
        </ul>
        <div class="pt-5">
            <form class="space-y-5" @submit.prevent="form.patch(route('designations.update', props.designation.id))">
            <div class="panel">
                <div class="flex items-center justify-between mb-5">
                  <h5 class="font-semibold text-lg dark:text-white-light">Edit Designations</h5>
                </div>
                <div class="grid grid-cols-4 gap-4 mb-4">
                    <div>
                    <InputLabel class="after:content-['*'] after:text-red-500" value="Name" />
                    <TextInput
                        type="text"
                        class="form-input"
                        v-model="form.designation_name"/>
                    <br>
                    <div class="mt-2 text-red-500" v-if="errors.designation_name">{{ errors.designation_name }}</div>
                    </div>
                </div>
                <div class="flex justify-end mt-4">
                    <button type="submit" class="btn btn-success">Submit</button>&nbsp;&nbsp;
                    <Link href="/designations" class="btn btn-danger" :class="{ 'active': $page.component === 'Designations/Index' }">Cancel</Link>
                </div>
            </div>
            </form>
        </div>
    </App>
</template>
