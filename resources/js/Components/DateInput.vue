<script setup>
import { onMounted, ref } from 'vue';
import "flatpickr/dist/flatpickr.css";
import flatPickr from "vue-flatpickr-component";

defineProps({
    modelValue: {
        type: String,
        required: true,
    },
    label: {
        type: String,
    },
    error: {
        type: String,
    },
    required: {
        bool: Boolean,
    },
});

const basic = ref({
    dateFormat: 'd/m/Y'
});

defineEmits(['update:modelValue']);

const input = ref(null);
</script>

<template>
    <div :class="{'has-error':error}">
        <label>
            <span v-if="label">{{ label }}</span>
            <span v-else><slot /></span>
            <span v-if="required" class="text-red-500"> *</span>
        </label>
        <flat-pickr class="form-input border-gray-300  rounded-md shadow-sm" 
        :config="basic" 
        :value="modelValue" 
        @input="$emit('update:modelValue', $event.target.value)"
        ref="input">
        </flat-pickr>
        
        <div class="mt-2 text-red-500" v-if="error">{{ error }}</div>
    </div>
</template>
