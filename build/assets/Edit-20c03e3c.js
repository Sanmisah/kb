import{j,T as C,c as D,w as y,o as a,b as e,a as d,d as x,n as g,u as t,i as b,e as N,f as r,t as i,g as m,s as V,v as h,q as k,F as w}from"./app-ba0ee086.js";import{_ as E}from"./app-layout.vue_vue_type_script_setup_true_lang-3f91a0b5.js";import{_ as c,a as f}from"./TextInput-7cfc6ab3.js";import{C as U}from"./flatpickr-4317a439.js";import"./_plugin-vue_export-helper-c27b6911.js";const O={class:"flex space-x-2 rtl:space-x-reverse"},$=e("li",{class:"before:content-['/'] ltr:before:mr-1 rtl:before:ml-1"},[e("span",null,"Edit")],-1),B={class:"pt-5"},L={class:"panel"},S=e("div",{class:"flex items-center justify-between mb-5"},[e("h5",{class:"font-semibold text-lg dark:text-white-light"}," Personal Detail ")],-1),F={class:"grid grid-cols-3 gap-4 mb-4"},A=e("br",null,null,-1),M={key:0,class:"mt-2 text-red-500"},P=e("br",null,null,-1),I={key:0,class:"mt-2 text-red-500"},T=e("br",null,null,-1),q={key:0,class:"mt-2 text-red-500"},z={class:"grid grid-cols-3 gap-4 mb-4"},J=e("br",null,null,-1),Y={key:0,class:"mt-2 text-red-500"},G=e("br",null,null,-1),H={key:0,class:"mt-2 text-red-500"},K=e("br",null,null,-1),Q={key:0,class:"mt-2 text-red-500"},R={class:"grid grid-cols-3 gap-4 mb-4"},W=["value","textContent"],X={key:0,class:"mt-2 text-red-500"},Z=["value","textContent"],ee={key:0,class:"mt-2 text-red-500"},te={class:"panel"},le=e("div",{class:"flex items-center justify-between mb-5"},[e("h5",{class:"font-semibold text-lg dark:text-white-light"}," Address Detail ")],-1),se={class:"grid grid-cols-1 gap-4 mb-4"},oe=e("br",null,null,-1),ne={key:0,class:"mt-2 text-red-500"},de={class:"grid grid-cols-1 gap-4 mb-4"},ae=e("br",null,null,-1),re={key:0,class:"mt-2 text-red-500"},ie={class:"grid grid-cols-4 gap-4 mb-4"},ue=e("br",null,null,-1),me={key:0,class:"mt-2 text-red-500"},ce=e("br",null,null,-1),fe={key:0,class:"mt-2 text-red-500"},_e=e("br",null,null,-1),ve={key:0,class:"mt-2 text-red-500"},ye=e("br",null,null,-1),xe={key:0,class:"mt-2 text-red-500"},pe={class:"panel"},ge=e("div",{class:"flex items-center justify-between mb-5"},[e("h5",{class:"font-semibold text-lg dark:text-white-light"}," Login Detail ")],-1),be={class:"grid grid-cols-3 gap-4 mb-4"},Ve=e("br",null,null,-1),he={key:0,class:"mt-2 text-red-500"},ke=e("br",null,null,-1),we={key:0,class:"mt-2 text-red-500"},Ue={class:"flex justify-end mt-4"},je=e("button",{type:"submit",class:"btn btn-success"},"Submit",-1),$e={__name:"Edit",props:{designations:Object,departments:Object,employee:Object,errors:Object},setup(s){const u=s,p=j({dateFormat:"d/m/Y"}),n=C({first_name:u.employee.first_name,middle_name:u.employee.middle_name,last_name:u.employee.last_name,email:u.employee.email,contact_no:u.employee.contact_no,address_line_1:u.employee.address_line_1,address_line_2:u.employee.address_line_2,department_id:u.employee.department_id,designation_id:u.employee.designation_id,date_of_joining:u.employee.date_of_joining,country:u.employee.country,state:u.employee.state,city:u.employee.city,pincode:u.employee.pincode,dob:u.employee.dob});return(v,o)=>(a(),D(E,null,{default:y(()=>[e("ul",O,[e("li",null,[d(t(b),{href:"/employees",class:g({active:v.$page.component==="Employees/Index"})},{default:y(()=>[x("Employee")]),_:1},8,["class"])]),$]),e("div",B,[e("form",{class:"space-y-5",onSubmit:o[16]||(o[16]=N(l=>t(n).patch(v.route("employees.update",u.employee.id)),["prevent"]))},[e("div",L,[S,e("div",F,[e("div",null,[d(c,{class:"after:content-['*'] after:text-red-500",value:"First Name"}),d(f,{type:"text",class:"form-input",modelValue:t(n).first_name,"onUpdate:modelValue":o[0]||(o[0]=l=>t(n).first_name=l)},null,8,["modelValue"]),A,s.errors.first_name?(a(),r("div",M,i(s.errors.first_name),1)):m("",!0)]),e("div",null,[d(c,{class:"after:content-['*'] after:text-red-500",value:"Middle Name"}),d(f,{type:"text",class:"form-input",modelValue:t(n).middle_name,"onUpdate:modelValue":o[1]||(o[1]=l=>t(n).middle_name=l)},null,8,["modelValue"]),P,s.errors.middle_name?(a(),r("div",I,i(s.errors.middle_name),1)):m("",!0)]),e("div",null,[d(c,{class:"after:content-['*'] after:text-red-500",value:"Last Name"}),d(f,{type:"text",class:"form-input",modelValue:t(n).last_name,"onUpdate:modelValue":o[2]||(o[2]=l=>t(n).last_name=l)},null,8,["modelValue"]),T,s.errors.last_name?(a(),r("div",q,i(s.errors.last_name),1)):m("",!0)])]),e("div",z,[e("div",null,[d(c,{class:"after:content-['*'] after:text-red-500",value:"Contact No"}),d(f,{type:"text",class:"form-input",modelValue:t(n).contact_no,"onUpdate:modelValue":o[3]||(o[3]=l=>t(n).contact_no=l)},null,8,["modelValue"]),J,s.errors.contact_no?(a(),r("div",Y,i(s.errors.contact_no),1)):m("",!0)]),e("div",null,[d(c,{value:"Date Of Birth"}),d(t(U),{class:"form-input",config:p.value,modelValue:t(n).dob,"onUpdate:modelValue":o[4]||(o[4]=l=>t(n).dob=l)},null,8,["config","modelValue"]),G,s.errors.dob?(a(),r("div",H,i(s.errors.dob),1)):m("",!0)]),e("div",null,[d(c,{value:"Date Of Joining"}),d(t(U),{class:"form-input",config:p.value,modelValue:t(n).date_of_joining,"onUpdate:modelValue":o[5]||(o[5]=l=>t(n).date_of_joining=l)},null,8,["config","modelValue"]),K,s.errors.date_of_joining?(a(),r("div",Q,i(s.errors.date_of_joining),1)):m("",!0)])]),e("div",R,[e("div",null,[d(c,{class:"after:content-['*'] after:text-red-500",value:"Department"}),V(e("select",{class:"form-select text-dark","onUpdate:modelValue":o[6]||(o[6]=l=>t(n).department_id=l)},[(a(!0),r(w,null,k(s.departments,(l,_)=>(a(),r("option",{key:_,value:_,textContent:i(l)},null,8,W))),128))],512),[[h,t(n).department_id]]),s.errors.department_id?(a(),r("div",X,i(s.errors.department_id),1)):m("",!0)]),e("div",null,[d(c,{class:"after:content-['*'] after:text-red-500",value:"Designation"}),V(e("select",{class:"form-select text-dark","onUpdate:modelValue":o[7]||(o[7]=l=>t(n).designation_id=l)},[(a(!0),r(w,null,k(s.designations,(l,_)=>(a(),r("option",{key:_,value:_,textContent:i(l)},null,8,Z))),128))],512),[[h,t(n).designation_id]]),s.errors.designation_id?(a(),r("div",ee,i(s.errors.designation_id),1)):m("",!0)])])]),e("div",te,[le,e("div",se,[e("div",null,[d(c,{class:"after:content-['*'] after:text-red-500",value:"Address Line 1"}),d(f,{type:"text",class:"form-input",modelValue:t(n).address_line_1,"onUpdate:modelValue":o[8]||(o[8]=l=>t(n).address_line_1=l)},null,8,["modelValue"]),oe,s.errors.address_line_1?(a(),r("div",ne,i(s.errors.address_line_1),1)):m("",!0)])]),e("div",de,[e("div",null,[d(c,{value:"Address Line 2"}),d(f,{type:"text",class:"form-input",modelValue:t(n).address_line_2,"onUpdate:modelValue":o[9]||(o[9]=l=>t(n).address_line_2=l)},null,8,["modelValue"]),ae,s.errors.address_line_2?(a(),r("div",re,i(s.errors.address_line_2),1)):m("",!0)])]),e("div",ie,[e("div",null,[d(c,{class:"after:content-['*'] after:text-red-500",value:"Country"}),d(f,{type:"text",class:"form-input",modelValue:t(n).country,"onUpdate:modelValue":o[10]||(o[10]=l=>t(n).country=l)},null,8,["modelValue"]),ue,s.errors.country?(a(),r("div",me,i(s.errors.country),1)):m("",!0)]),e("div",null,[d(c,{class:"after:content-['*'] after:text-red-500",value:"State"}),d(f,{type:"text",class:"form-input",modelValue:t(n).state,"onUpdate:modelValue":o[11]||(o[11]=l=>t(n).state=l)},null,8,["modelValue"]),ce,s.errors.state?(a(),r("div",fe,i(s.errors.state),1)):m("",!0)]),e("div",null,[d(c,{class:"after:content-['*'] after:text-red-500",value:"City"}),d(f,{type:"text",class:"form-input",modelValue:t(n).city,"onUpdate:modelValue":o[12]||(o[12]=l=>t(n).city=l)},null,8,["modelValue"]),_e,s.errors.city?(a(),r("div",ve,i(s.errors.city),1)):m("",!0)]),e("div",null,[d(c,{class:"after:content-['*'] after:text-red-500",value:"Pincode"}),d(f,{type:"text",class:"form-input",modelValue:t(n).pincode,"onUpdate:modelValue":o[13]||(o[13]=l=>t(n).pincode=l)},null,8,["modelValue"]),ye,s.errors.pincode?(a(),r("div",xe,i(s.errors.pincode),1)):m("",!0)])])]),e("div",pe,[ge,e("div",be,[e("div",null,[d(c,{class:"after:content-['*'] after:text-red-500",value:"Email"}),d(f,{type:"text",class:"form-input",modelValue:t(n).email,"onUpdate:modelValue":o[14]||(o[14]=l=>t(n).email=l)},null,8,["modelValue"]),Ve,s.errors.email?(a(),r("div",he,i(s.errors.email),1)):m("",!0)]),e("div",null,[d(c,{value:"Password"}),d(f,{type:"password",class:"form-input",modelValue:t(n).password,"onUpdate:modelValue":o[15]||(o[15]=l=>t(n).password=l)},null,8,["modelValue"]),ke,s.errors.password?(a(),r("div",we,i(s.errors.password),1)):m("",!0)])]),e("div",Ue,[je,x("   "),d(t(b),{href:"/employees",class:g(["btn btn-danger",{active:v.$page.component==="Employees/Index"}])},{default:y(()=>[x("Cancel")]),_:1},8,["class"])])])],32)])]),_:1}))}};export{$e as default};
