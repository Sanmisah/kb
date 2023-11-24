<template>
    <div class="flex items-center">
      <div class="flex w-full bg-white rounded shadow">    
     
        <input class="form-input focus:shadow-outline" autocomplete="off" type="text" name="search" placeholder="Search…" :value="modelValue" @input="$emit('update:modelValue', $event.target.value)" />
      </div>
      <button class="btn btn-primary ml-1 hover:text-gray-700 focus:text-indigo-500 text-sm" type="button" @click="$emit('update:modelValue', $event.target.value)">Reset</button>
    </div>
  </template>
  
  <script setup>
  defineProps({
      modelValue: String,
        maxWidth: {
          type: Number,
          default: 300,
        },
        emits: ['update:modelValue', 'reset'],
  });
 
  
  </script>
  