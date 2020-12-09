import store from './store.js';

Vue.use(httpVueLoader);
// Vue.use(vant);
// Vue.use(vant.Lazyload);
// Vue.use(vant.Swipe);
// Vue.use(vant.SwipeItem);
Vue.use(ELEMENT);
const AttractionInfo = new Vue({
    el: '#app',
    components: {
        'index': httpVueLoader(context+'/assets/a592070/font/js/components/attraction/main.vue'),
    },
    vuetify: new Vuetify(),
    store
})
export default AttractionInfo;