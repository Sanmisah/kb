<script setup>
import App from "@/Layouts/app-layout.vue";
import InputLabel from "@/Components/InputLabel.vue";
import TextInput from "@/Components/TextInput.vue";
import DateInput from "@/Components/DateInput.vue";
import SelectInput from "@/Components/SelectInput.vue";
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
    attachment: props.notice.attachment,
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
            <form class="space-y-5" method="post" enctype="multipart/form-data"  @submit.prevent="form.patch(route('notices.update', props.notice.id))">
                <div class="panel">
                    <div class="flex items-center justify-between mb-5">
                        <h5 class="font-semibold text-lg dark:text-white-light">Edit Notices</h5>
                    </div>
                    <div class="grid grid-cols-4 gap-4 mb-4">
                        <TextInput type="text" label="Serial No" v-model="form.sr_no" readonly />
                        <DateInput label="Notice Date" v-model="form.notice_date" :error="errors.notice_date" />
                        <SelectInput  label="Department"  :required="true" v-model="form.department_id" :data="departments" :error="errors.department_id" />
                        <SelectInput  label="Designation"  :required="true" v-model="form.designation_id" :data="designations" :error="errors.designation_id" />                        
                    </div>
                    <div class="grid grid-cols-1 gap-4 mb-4">
                        <TextInput type="text" label="Notice" :error="errors.notice" :required="true" v-model="form.notice"/>
                    </div>
                    <div class="grid grid-cols-1 gap-4 mb-4">
                        <TextInput type="text" label="Description" :error="errors.description" :required="true" v-model="form.description"/>
                    </div>
                    <div class="grid grid-cols-4 gap-4 mb-4">
                        <div>
                            <InputLabel class="after:content-['*'] after:text-red-500" value="Attachment" />
                            <input type="file" class="form-input"  @input="form.attachment = $event.target.files[0]"  accept="application/pdf"/>
                            <div class="mt-2 text-red-500" v-if="errors.attachment">
                                {{ errors.attachment }}
                            </div>
                        </div> 
                        <div>
                            <a v-if="mediaItems" :href="'/media/'+ mediaItems.id +'/'+ mediaItems.file_name" class="btn btn-info badge bg-info" target="_blank">{{ mediaItems.file_name }} </a>  
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
