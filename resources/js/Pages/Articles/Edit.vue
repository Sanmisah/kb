<script setup>
import App from "@/Layouts/app-layout.vue";
import InputLabel from "@/Components/InputLabel.vue";
import TextInput from "@/Components/TextInput.vue";
import SelectInput from "@/Components/SelectInput.vue";
import { Link, useForm } from "@inertiajs/vue3";
import { ref } from "vue";

const props = defineProps({ sections: Object, errors: Object, article: Object, file_1: Object, file_2: Object, file_3: Object, video: Object});

const form = useForm({
    _method: 'patch',
    section_id: props.article.section_id,
    topic: props.article.topic,
    description: props.article.description,
    video_attachment: props.article.video,
    file_attachment_1: props.article.file_1,
    file_attachment_2: props.article.file_2,
    file_attachment_3: props.article.file_3,
});

</script>
<template>    
    <App>
        <ul class="flex space-x-2 rtl:space-x-reverse">
            <li>
                <Link href="/articles" :class="{ 'active': $page.component === 'Articles/Index' }">Article</Link>
            </li>
        </ul>
        <div class="pt-5">
            <form class="space-y-5" method="post" enctype="multipart/form-data"  @submit.prevent="form.patch(route('articles.update', props.article.id))">
                <div class="panel">
                    <div class="flex items-center justify-between mb-5">
                        <h5 class="font-semibold text-lg dark:text-white-light">Edit Section</h5>
                    </div>
                    <div class="grid grid-cols-4 gap-4 mb-4">                        
                        <SelectInput  label="Section"  :required="true" v-model="form.section_id" :data="sections" :error="errors.section_id" />                        
                    </div>
                    <div class="grid grid-cols-1 gap-4 mb-4">
                        <TextInput type="text" label="Topic" :error="errors.topic" v-model="form.topic"/>
                    </div>
                    <div class="grid grid-cols-1 gap-4 mb-4">
                        <TextInput type="text" label="Description" :error="errors.description" v-model="form.description"/>
                    </div>
                    <div class="grid grid-cols-4 gap-4 mb-4">
                        <div>
                            <InputLabel value="Video" />
                            <input type="file" class="form-input"  @input="form.video_attachment = $event.target.files[0]" />
                            <br />
                            <a v-if="video" :href="'/media/'+ video.id +'/'+ video.file_name" class="btn btn-info badge bg-info" target="_blank">{{ video.file_name }} </a> 
                        </div>                         
                    </div>
                    <div class="grid grid-cols-3 gap-4 mb-4">
                        <div>
                            <InputLabel value="File 1" />
                            <input type="file" class="form-input" @input="form.file_attachment_1 = $event.target.files[0]"/>
                            <br />
                            <a v-if="file_1" :href="'/media/'+ file_1.id +'/'+ file_1.file_name" class="btn btn-info badge bg-info" target="_blank">{{ file_1.file_name }} </a>  
                        </div>
                        <div>
                            <InputLabel value="File 2" />
                            <input type="file" class="form-input" @input="form.file_attachment_2 = $event.target.files[0]"/>
                            <br />
                            <a v-if="file_2" :href="'/media/'+ file_2.id +'/'+ file_2.file_name" class="btn btn-info badge bg-info" target="_blank">{{ file_2.file_name }} </a>  
                        </div>      
                        <div>
                            <InputLabel value="File 3" />
                            <input type="file" class="form-input" @input="form.file_attachment_3 = $event.target.files[0]"/>
                            <br />
                            <a v-if="file_3" :href="'/media/'+ file_3.id +'/'+ file_3.file_name" class="btn btn-info badge bg-info" target="_blank">{{ file_3.file_name }} </a>  
                        </div>                                                      
                    </div>
                    <div class="flex justify-end mt-4">
                        <button type="submit" class="btn btn-success">Submit</button
                        >&nbsp;&nbsp;
                        <Link
                            href="/articles"
                            class="btn btn-danger"
                            :class="{
                                active: $page.component === 'Articles/Index',
                            }"
                            >Cancel</Link>
                    </div>
                </div>
            </form>
        </div>
    </App>
</template>
