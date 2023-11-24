<script setup>
import { router } from "@inertiajs/vue3";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import App from "@/Layouts/app-layout.vue";
import InputError from "@/Components/InputError.vue";
import InputLabel from "@/Components/InputLabel.vue";
import PrimaryButton from "@/Components/PrimaryButton.vue";
import TextInput from "@/Components/TextInput.vue";
import { Link, useForm, usePage } from "@inertiajs/vue3";
import { ref, onMounted } from "vue";
import { useAppStore } from "@/stores/index";

defineProps({ errors: Object,  designations: Object });

const form = useForm({
    designation_name: null,
});

function submit() {
    router.post("/designations", form);
}
</script>

<template>
    <App>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Designation
            </h2>
        </template>
        <ul class="flex space-x-2 rtl:space-x-reverse">
            <li>
                <Link href="/designations"
                    :class="{ active: $page.component === 'Designations/Index' }"
                    >Designation</Link>
            </li>
        </ul>
        <div class="pt-5">
            <form class="space-y-5" @submit.prevent="submit">
                <div class="panel">
                    <div class="flex items-center justify-between mb-5">
                        <h5 class="font-semibold text-lg dark:text-white-light">
                            Create Designations
                        </h5>
                    </div>
                    <div class="grid grid-cols-4 gap-4 mb-4">
                        <TextInput type="text" label="Name" :error="errors.designation_name" :required="true" v-model="form.designation_name"/>
                    </div>
                    <div class="flex justify-end mt-4">
                        <button type="submit" class="btn btn-success">Submit</button>&nbsp;&nbsp;
                        <Link
                          href="/designations"
                          class="btn btn-danger"
                          :class="{
                              active: $page.component === 'Designations/Index',
                          }"
                          >Cancel</Link>
                  </div>
                </div>
            </form>
        </div>
    </App>
</template>
