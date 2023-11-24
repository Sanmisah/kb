<script setup>
import { onMounted, ref } from 'vue';
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
    type: {
        type: String,
        default: 'text',
    },
});



defineEmits(['update:modelValue']);

const input = ref(null);



onMounted(() => {
    if (input.value.hasAttribute('autofocus')) {
        input.value.focus();
    }
   
});

defineExpose({ focus: () => input.value.focus()});
</script>

<template>
    <div :class="{'has-error':error}">
        <label>
            <span v-if="label">{{ label }}</span>
            <span v-else><slot /></span>
            <span v-if="required" class="text-red-500"> *</span>
        </label>
        <input
            class="form-input border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm"
            :value="modelValue"
            @input="$emit('update:modelValue', $event.target.value)"
            ref="input"
        />
        <div class="mt-2 text-red-500" v-if="error">{{ error }}</div>
    </div>
</template>
