<script setup>
import App from "@/Layouts/app-layout.vue";
import InputLabel from "@/Components/InputLabel.vue";
import TextInput from "@/Components/TextInput.vue";
import { Link, useForm, usePage } from "@inertiajs/vue3";
import { ref, onMounted } from "vue";
import flatPickr from "vue-flatpickr-component";
import "flatpickr/dist/flatpickr.css";

const props = defineProps({ departments: Object, errors: Object, designations: Object, notice: Object, mediaItems: Object});
const basic = ref({
    dateFormat: 'd/m/Y'
});
const form = useForm({
    _method: 'patch',
    sr_no: props.notice.sr_no,
    notice_date: props.notice.notice_date,
    notice: props.notice.notice,
    department_id: props.notice.department_id,
    designation_id: props.notice.designation_id,
    description: props.notice.description,
});

</script>
<template>    
    <App>
        <ul class="flex space-x-2 rtl:space-x-reverse">
            <li>
                <Link href="/notices" :class="{ 'active': $page.component === 'Notices/Index' }">Notice</Link>
            </li>
        </ul>
        <br>
        <div class="pt-5">
            <form class="space-y-5" @submit.prevent="form.patch(route('notices.update', props.notice.id))">
                <div class="panel">
                    <div class="flex items-center justify-between mb-5">
                        <h5 class="font-semibold text-lg dark:text-white-light">Edit Notices</h5>
                    </div>
                    <div class="grid grid-cols-4 gap-4 mb-4">
                        <div>
                            <InputLabel
                                value="Serial No"
                            />
                            <TextInput
                                type="text"
                                class="form-input bg-gray-100 dark:bg-gray-700"
                                v-model="form.sr_no"/>
                        </div>
                        <div>
                            <InputLabel class="after:content-['*'] after:text-red-500" value="Notice Date" />
                            <flat-pickr class="form-input" :config="basic" v-model="form.notice_date"></flat-pickr>
                            <br />
                            <div class="mt-2 text-red-500" v-if="errors.notice_date">
                                {{ errors.notice_date }}
                            </div>
                        </div>
                        <div>
                            <InputLabel
                                class="after:content-['*'] after:text-red-500"
                                value="Department"
                            />
                            <select class="form-select" v-model="form.department_id">
                                <template v-for="(department, id) in departments" :key="id">
                                    <option :value="id" v-text="department"></option>
                                </template>
                            </select>                            
                            <div class="mt-2 text-red-500" v-if="errors.department">
                                {{ errors.department }}
                            </div>
                        </div>
                        <div>
                            <InputLabel
                                class="after:content-['*'] after:text-red-500"
                                value="Designation"
                            />
                            <select class="form-select" v-model="form.designation_id">
                                <template v-for="(designation, id) in designations" :key="id">
                                    <option :value="id" v-text="designation"></option>
                                </template>
                            </select>                            
                            <div class="mt-2 text-red-500" v-if="errors.designation">
                                {{ errors.designation }}
                            </div>
                        </div>
                    </div>
                    <div class="grid grid-cols-1 gap-4 mb-4">
                        <div>
                            <InputLabel
                                class="after:content-['*'] after:text-red-500"
                                value="Notice"
                            />
                            <TextInput
                                type="text"
                                class="form-input"
                                v-model="form.notice"/>
                            <br />
                            <div class="mt-2 text-red-500" v-if="errors.notice">
                                {{ errors.notice }}
                            </div>
                        </div>
                    </div>
                    <div class="grid grid-cols-1 gap-4 mb-4">
                        <div>
                            <InputLabel class="after:content-['*'] after:text-red-500" value="Description" />
                            <TextInput
                                type="text"
                                class="form-input"
                                v-model="form.description"/>
                                <div class="mt-2 text-red-500" v-if="errors.description">
                                    {{ errors.description }}
                                </div>
                        </div>
                    </div>
                    <div class="grid grid-cols-4 gap-4 mb-4">
                        <div>
                            <InputLabel class="after:content-['*'] after:text-red-500" value="Attachment" />
                            <input type="file" class="form-input" name="attachment"/>
                            <div class="mt-2 text-red-500" v-if="errors.attachment">
                                {{ errors.attachment }}
                            </div>
                           


                        </div>
                        <div>
                             <a
                            :href="'/media/'+ mediaItems.id +'/'+ mediaItems.file_name"
                            class="badge bg-info"
                            target="_blank">{{ mediaItems.file_name }} </a>
                        </div>
                    </div>
                    <div class="flex justify-end mt-4">
                        <button type="submit" class="btn btn-success">Submit</button
                        >&nbsp;&nbsp;
                        <Link
                            href="/notices"
                            class="btn btn-danger"
                            :class="{
                                active: $page.component === 'Notices/Index',
                            }"
                            >Cancel</Link>
                    </div>
                </div>
            </form>
        </div>
    </App>
</template>
