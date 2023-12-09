<script setup>
import { router } from "@inertiajs/vue3";
import App from "@/Layouts/app-layout.vue";
import InputLabel from "@/Components/InputLabel.vue";
import TextInput from "@/Components/TextInput.vue";
import SelectInput from "@/Components/SelectInput.vue";
import { Link, useForm} from "@inertiajs/vue3";

defineProps({ errors: Object, inductions: Object, departments: Object });

const form = useForm({
    induction_name: null,
    department_id: null,
});

function submit() {
    router.post("/inductions", form);
}
</script>

<template>
    <App>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Induction
            </h2>
        </template>
        <ul class="flex space-x-2 rtl:space-x-reverse">
            <li>
                <Link href="/induction"
                    :class="{ active: $page.component === 'Inductions/Index' }"
                    >Induction</Link>
            </li>
        </ul>
        <div class="pt-5">
            <form class="space-y-5" @submit.prevent="submit">
                <div class="panel">
                    <div class="flex items-center justify-between mb-5">
                        <h5 class="font-semibold text-lg dark:text-white-light">
                            Create Inductions
                        </h5>
                    </div>
                    <div class="grid grid-cols-4 gap-4 mb-4">
                        <TextInput type="text" label="Name" :error="errors.induction_name" :required="true" v-model="form.induction_name"/>
                        <SelectInput label="Department" :required="true" v-model="form.department_id" :data="departments" :error="errors.department_id" />
                    </div>
                    <div class="flex justify-end mt-4">
                      <button type="submit" class="btn btn-success">Submit</button
                      >&nbsp;&nbsp;
                      <Link
                          href="/inductions"
                          class="btn btn-danger"
                          :class="{
                              active: $page.component === 'Inductions/Index',
                          }">Cancel</Link>
                  </div>
                </div>
            </form>
        </div>
    </App>
</template>
