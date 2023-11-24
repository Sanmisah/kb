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
    data: {
        type: Object,
    },
});



defineEmits(['update:modelValue']);

const input = ref(null);



onMounted(() => {
    if (input.value.hasAttribute('autofocus')) {
        input.value.focus();
    }

    if (input.value.hasAttribute('select')) {
        input.value.select();
    }
   
});

defineExpose({ focus: () => input.value.focus(), select: () => input.value.select()});
</script>

<template>
    <div :class="{'has-error':error}">
        <label>
            <span v-if="label">{{ label }}</span>
            <span v-else><slot /></span>
            <span v-if="required" class="text-red-500"> *</span>
        </label>
        <select class="form-select" :value="modelValue">
            <template v-for="(recored, id) in data" :key="id">
                <option :value="id" v-text="recored"></option>
            </template>
        </select>                            
        <div class="mt-2 text-red-500" v-if="error">{{ error }}</div>
    </div>
</template>
