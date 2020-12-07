import store from './store.js';

Vue.use(httpVueLoader);
const AttractionInfo = new Vue({
    el: '#app',
    components: {
        'index': httpVueLoader(context+'/assets/a592070/font/js/components/attraction/main.vue')
    },
    store
})
export default AttractionInfo;