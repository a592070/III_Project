const App = new Vue({
    el: '#app',
    components: {
        'app-world': httpVueLoader(context+'/assets/a592070/js/components/myComponent.vue')
    },
})
// export default App;