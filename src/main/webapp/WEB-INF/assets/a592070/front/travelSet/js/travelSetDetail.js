import store from './travelSetStore.js';

Vue.use(httpVueLoader);
Vue.use(ELEMENT);
const TravelSetDetail = new Vue({
    el: '#app',
    components: {
        'index': httpVueLoader(context+'/assets/a592070/front/travelSet/components/travelSetDetail.vue'),
    },
    vuetify: new Vuetify(),
    store
})
export default TravelSetDetail;