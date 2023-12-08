<script setup>
import Pagination from "@/Components/Pagination.vue";
import Search from "@/Components/SearchFilter.vue";
import { watch } from "vue";
import { router } from '@inertiajs/vue3';
import App from '@/Layouts/app-layout.vue';
import { Link } from '@inertiajs/vue3';
import { ref } from 'vue';

const props = defineProps({
    employees: {
        type: Object,
        default: () => ({}),
    },
    filters: {
        type: Object,
        default: () => ({}),
    },
});

let search = ref(props.filters.search);

watch(search, (value) => {
  router.get(
        "/employees",
        { search: value },
        {
          preserveState: true,
          replace: true,
        }
    );
});

</script>
<template>
    <App>
      <div class="p-4 sm:p-8 bg-white shadow sm:rounded-lg">
          <header>
              <h5 class="font-semibold text-lg dark:text-white-light">Employee</h5>
          </header> <br>
          <div class="grid justify-items-stretch grid-cols-2 gap-4">
            <div>
              <Search v-model="search" class="mr-4 w-full max-w-md">
              </Search>
            </div>
            <div class="justify-self-end">
              <Link :href="'/employees/create'" class="btn btn-primary btn-sm ">
                <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24px"
                    height="24px"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="1.5"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    class="w-5 h-5"
                >
                    <line x1="12" y1="5" x2="12" y2="19"></line>
                    <line x1="5" y1="12" x2="19" y2="12"></line>
                </svg>
                Add New</Link>
            </div> <br>
          </div>
          <div class="table-responsive">
            <table>
              <thead>
                <tr>
                  <th>#</th>
                  <th>Name</th>
                  <th>Email</th>
                  <th>Contact No</th>
                  <th>Department</th>
                  <th>Designation</th>
                  <th>Active</th>
                  <th style="text-align: right;">Action</th>
                </tr>
              </thead>
              <tbody v-for="(employee,index) in employees.data">
                <tr>
                  <td>{{ index+1 }}</td>
                  <td>{{ employee.first_name }}&nbsp;{{ employee.middle_name }}&nbsp;{{ employee.last_name }}</td>
                  <td>{{ employee.email }}</td>
                  <td>{{ employee.contact_no }}</td>
                  <td>{{ employee.department_name }}</td>
                  <td>{{ employee.designation_name }}</td>
                  <td>
                      <Link :href="'/employees/' + employee.id " v-if="employee.active" class="badge badge-outline-success" v-tippy:show>Active</Link>
                      <Link :href="'/employees/' + employee.id " v-else class="badge badge-outline-danger" v-tippy:show>Inactive</Link>
                      <tippy target="show">Show</tippy>
                  </td>
                  <td style="float: right;">
                    <div class="flex gap-4">
                      <Link :href="'/employees/' + employee.id +'/edit'" method="get" v-tippy:edit>
                          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="w-4.5 h-4.5">
                              <path
                                  d="M15.2869 3.15178L14.3601 4.07866L5.83882 12.5999L5.83881 12.5999C5.26166 13.1771 4.97308 13.4656 4.7249 13.7838C4.43213 14.1592 4.18114 14.5653 3.97634 14.995C3.80273 15.3593 3.67368 15.7465 3.41556 16.5208L2.32181 19.8021L2.05445 20.6042C1.92743 20.9852 2.0266 21.4053 2.31063 21.6894C2.59466 21.9734 3.01478 22.0726 3.39584 21.9456L4.19792 21.6782L7.47918 20.5844L7.47919 20.5844C8.25353 20.3263 8.6407 20.1973 9.00498 20.0237C9.43469 19.8189 9.84082 19.5679 10.2162 19.2751C10.5344 19.0269 10.8229 18.7383 11.4001 18.1612L11.4001 18.1612L19.9213 9.63993L20.8482 8.71306C22.3839 7.17735 22.3839 4.68748 20.8482 3.15178C19.3125 1.61607 16.8226 1.61607 15.2869 3.15178Z"
                                  stroke="currentColor"
                                  stroke-width="1.5"/>
                              <path
                                  opacity="0.5"
                                  d="M14.36 4.07812C14.36 4.07812 14.4759 6.04774 16.2138 7.78564C17.9517 9.52354 19.9213 9.6394 19.9213 9.6394M4.19789 21.6777L2.32178 19.8015"
                                  stroke="currentColor"
                                  stroke-width="1.5"/>
                          </svg>
                      </Link>
                      <tippy target="edit">Edit</tippy>
                      <Link :href="'/employees/' + employee.id " method="delete"  as="button" v-tippy:delete>
                          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="w-5 h-5">
                              <circle opacity="0.5" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="1.5" />
                              <path d="M14.5 9.50002L9.5 14.5M9.49998 9.5L14.5 14.5" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                          </svg>
                      </Link>
                      <tippy  target="delete">Delete</tippy>
                    </div>
                  </td>
                </tr>       
              </tbody>
            </table>
          </div>
      </div>
      <Pagination :data="employees"/>
    </App>
</template>