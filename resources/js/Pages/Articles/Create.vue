<script setup>
import { router } from "@inertiajs/vue3";
import App from "@/Layouts/app-layout.vue";
import InputLabel from "@/Components/InputLabel.vue";
import TextInput from "@/Components/TextInput.vue";
import SelectInput from "@/Components/SelectInput.vue";
import { Link, useForm } from "@inertiajs/vue3";
import { ref } from 'vue';
/*import { quillEditor } from 'vue3-quill';
import 'vue3-quill/lib/vue3-quill.css';
const options1 = ref({
    modules: {
        toolbar: [[{ header: [1, 2, false] }], ['bold', 'italic', 'underline', 'link'], [{ list: 'ordered' }, { list: 'bullet' }], ['clean']],
    },
    placeholder: '',
});*/

defineProps({errors: Object, sections: Object});

const form = useForm({
    topic: null,
    section_id: null,
    description: null,
    video_attachment: null,
    file_attachment_1: null,
    file_attachment_2: null,
    file_attachment_3: null
});

function submit() {
    router.post("/articles", form);
}
</script>

<template>
    <App>
        <ul class="flex space-x-2 rtl:space-x-reverse">
            <li>
                <Link href="/articles"
                    :class="{ active: $page.component === 'Articles/Index' }"
                    >Article</Link>
            </li>
        </ul>
        <div class="pt-5">
            <form class="space-y-5" enctype="multipart/form-data" @submit.prevent="submit">
                <div class="panel">
                    <div class="flex items-center justify-between mb-5">
                        <h5 class="font-semibold text-lg dark:text-white-light">
                            Create Article
                        </h5>
                    </div>
                    <div class="grid grid-cols-4 gap-4 mb-4">
                        <SelectInput  label="Section" v-model="form.section_id" :data="sections" :error="errors.section_id" />
                    </div>
                    <div class="grid grid-cols-1 gap-4 mb-4">
                        <TextInput type="text" label="Topic" :error="errors.topic" v-model="form.topic"/>
                    </div>
                    <div class="grid grid-cols-1 gap-4 mb-4">
                        <TextInput type="text" label="Description" :error="errors.description" v-model="form.description"/>
                        <!--<div class="mb-5">
                            <quillEditor ref="editor1" v-model:value="content1" :options="options1" style="min-height: 200px"></quillEditor>
                        </div>-->
                    </div>
                    <div class="grid grid-cols-4 gap-4 mb-4">
                        <div>
                            <InputLabel value="Video" />
                            <input type="file" class="form-input"  @input="form.video_attachment = $event.target.files[0]" />
                            <div class="mt-2 text-red-500" v-if="errors.video_attachment">
                                {{ errors.video_attachment }}
                            </div>
                        </div>                         
                    </div>
                    <div class="grid grid-cols-3 gap-4 mb-4">
                        <div>
                            <InputLabel value="File 1" />
                            <input type="file" class="form-input"  @input="form.file_attachment_1 = $event.target.files[0]"  accept="application/pdf"/>
                            <div class="mt-2 text-red-500" v-if="errors.file_attachment_1">
                                {{ errors.file_attachment_1 }}
                            </div>
                        </div> 
                        <div>
                            <InputLabel value="File 2" />
                            <input type="file" class="form-input"  @input="form.file_attachment_2 = $event.target.files[0]"  accept="application/pdf"/>
                            <div class="mt-2 text-red-500" v-if="errors.file_attachment_2">
                                {{ errors.file_attachment_2 }}
                            </div>
                        </div>  
                        <div>
                            <InputLabel value="File 3" />
                            <input type="file" class="form-input"  @input="form.file_attachment_3 = $event.target.files[0]"  accept="application/pdf"/>
                            <div class="mt-2 text-red-500" v-if="errors.file_attachment_3">
                                {{ errors.file_attachment_3 }}
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
