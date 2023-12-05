<script setup>
import { router } from "@inertiajs/vue3";
import App from "@/Layouts/app-layout.vue";
import InputLabel from "@/Components/InputLabel.vue";
import TextInput from "@/Components/TextInput.vue";
import DateInput from "@/Components/DateInput.vue";
import SelectInput from "@/Components/SelectInput.vue";
import { Link, useForm, usePage } from "@inertiajs/vue3";
import { ref, onMounted } from "vue";


defineProps({ errors: Object, departments: Object, designations: Object});

const form = useForm({
    sr_no: null,
    notice_date: null,
    notice: null,
    department_id: null,
    designation_id: null,
    attachment: null,
    description: null,
});

const basic = ref({
    dateFormat: 'd/m/Y',
});



function submit() {
    router.post("/notices", form);
}
</script>

<template>
    <App>
        <ul class="flex space-x-2 rtl:space-x-reverse">
            <li>
                <Link href="/notices"
                    :class="{ active: $page.component === 'Notices/Index' }"
                    >Notice</Link>
            </li>
        </ul>
        <div class="pt-5">
            <form class="space-y-5" enctype="multipart/form-data" @submit.prevent="submit">
                <div class="panel">
                    <div class="flex items-center justify-between mb-5">
                        <h5 class="font-semibold text-lg dark:text-white-light">
                            Create Notice
                        </h5>
                    </div>
                    <div class="grid grid-cols-4 gap-4 mb-4">
                        <!--class="form-input bg-gray-100 dark:bg-gray-700"-->                        
                        <TextInput type="text" label="Serial No" v-model="form.sr_no" readonly />
                        <DateInput label="Notice Date" v-model="form.notice_date" :error="errors.notice_date" />
                        <SelectInput  label="Department"  :required="true" v-model="form.department_id" :data="departments" :error="errors.department_id" />
                        <SelectInput  label="Designation"  :required="true" v-model="form.designation_id" :data="designations" :error="errors.designation_id" />                        
                    </div>
                    <div class="grid grid-cols-1 gap-4 mb-4">
                        <TextInput type="text" label="Notice" :error="errors.notice" :required="true" v-model="form.notice"/>
                    </div>
                    <div class="grid grid-cols-1 gap-4 mb-4">
                        <!--<TextInput type="text" label="Description" :error="errors.description" :required="true" v-model="form.description"/>-->
                        <div class="mb-5">
                            <label for="desc">Description</label>
                            <textarea
                                id="desc"
                                rows="3"
                                class="form-textarea resize-none min-h-[130px]"
                                v-model="form.description"
                            ></textarea>
                        </div>
                    </div>
                    <div class="grid grid-cols-4 gap-4 mb-4">
                        <div>
                            <InputLabel class="after:content-['*'] after:text-red-500" value="Attachment" />
                            <input type="file" class="form-input"  @input="form.attachment = $event.target.files[0]"  accept="application/pdf"/>
                            <div class="mt-2 text-red-500" v-if="errors.attachment">
                                {{ errors.attachment }}
                            </div>
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
