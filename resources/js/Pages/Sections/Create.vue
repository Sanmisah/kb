<script setup>
import { router } from "@inertiajs/vue3";
import App from "@/Layouts/app-layout.vue";
import InputError from "@/Components/InputError.vue";
import InputLabel from "@/Components/InputLabel.vue";
import TextInput from "@/Components/TextInput.vue";
import { Link, useForm, usePage } from "@inertiajs/vue3";
import { ref, onMounted } from "vue";
import { useAppStore } from "@/stores/index";

defineProps({ errors: Object,  sections: Object });

const form = useForm({
    section_name: null,
});

function submit() {
    router.post("/sections", form);
}
</script>

<template>
    <App>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Section
            </h2>
        </template>
        <ul class="flex space-x-2 rtl:space-x-reverse">
            <li>
                <Link href="/sections"
                    :class="{ active: $page.component === 'Sections/Index' }"
                    >Section</Link>
            </li>
        </ul>
        <div class="pt-5">
            <form class="space-y-5" @submit.prevent="submit">
                <div class="panel">
                    <div class="flex items-center justify-between mb-5">
                        <h5 class="font-semibold text-lg dark:text-white-light">
                            Create Sections
                        </h5>
                    </div>
                    <div class="grid grid-cols-4 gap-4 mb-4">
                        <div>
                            <InputLabel
                                class="after:content-['*'] after:text-red-500"
                                value="Name"
                            />
                            <TextInput
                                type="text"
                                class="form-input"
                                v-model="form.section_name"/>
                            <br />
                            <div class="mt-2 text-red-500" v-if="errors.section_name">{{ errors.section_name }}</div>
                        </div>
                    </div>
                    <div class="flex justify-end mt-4">
                      <button type="submit" class="btn btn-success">Submit</button
                      >&nbsp;&nbsp;
                      <Link
                          href="/sections"
                          class="btn btn-danger"
                          :class="{
                              active: $page.component === 'Sections/Index',
                          }"
                          >Cancel</Link>
                  </div>
                </div>
            </form>
        </div>
    </App>
</template>
