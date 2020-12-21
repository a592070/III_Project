import store from './travelSetStore.js';

Vue.use(httpVueLoader);
Vue.use(ELEMENT);
const TravelSetInfo = new Vue({
    el: '#app',
    components: {
        // 'index': httpVueLoader(context+'/assets/a592070/front/travelSet/components/travelSetInfo.vue'),
        'index': httpVueLoader(context+'/assets/a592070/front/travelSet/components/main.vue'),
    },
    vuetify: new Vuetify(),
    store
})
export default TravelSetInfo;