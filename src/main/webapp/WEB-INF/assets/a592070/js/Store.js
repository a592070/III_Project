Vue.use(Vuex);
const store = new Vuex.Store({
    state: {
        storeData: "HHHHello",
        travelSetDialog: false,
        travelSetSelectDialog: false,
        currentEditTravelSetInfo: {
            sn: 0,
            createdUser: '',
            name: '',
            description: '',
            createdTime: '',
            updateTime: '',
            priority: 0,
            status: false
        },
        currentEditTravelSetDetail: {
            info: {
                sn: 0,
                createdUser: '',
                name: '',
                description: '',
                createdTime: '',
                updateTime: '',
                priority: 0,
                status: false
            },
            travelEleAttractions: [
                {
                    sn: 0,
                    id: 0,
                    name: '',
                    time: ''
                }
            ],
            travelEleRestaurants: [
                {
                    sn: 0,
                    id: 0,
                    name: '',
                    time: ''
                }
            ],
            travelEleHotels: [
                {
                    sn: 0,
                    id: 0,
                    name: '',
                    time: ''
                }
            ],
            travelEleCars: [
                {
                    sn: 0,
                    id: 0,
                    name: '',
                    time: ''
                }
            ]
        },
        currentEditTravelSetSelectItem: {
            sn: 0,
            name: ''
        }
    },
    getters: {
        getTravelSetDialog: (state) => state.travelSetDialog,
        getTravelSetSelectDialog: (state) => state.travelSetSelectDialog,
        getTravelSetDetail: (state) => state.currentEditTravelSetDetail,
        getTravelSetSelectItem: (state) => state.currentEditTravelSetSelectItem,
        getTravelSetInfo: (state) => state.currentEditTravelSetInfo
    },
    mutations: {
        toggleTravelSetDialog(state){
            state.travelSetDialog = !state.travelSetDialog;
        },
        toggleTravelSetSelectDialog(state){
            state.travelSetSelectDialog = !state.travelSetSelectDialog;
        },
        setTravelSetDetail(state, newTravelSetDetail){
            state.currentEditTravelSetDetail = newTravelSetDetail;
        },
        setTravelSetSelectItem(state, newTravelSetSelectItem){
            state.currentEditTravelSetSelectItem = newTravelSetSelectItem;
        },
        setTravelSetInfo(state, newTravelSetInfo){
            state.currentEditTravelSetInfo = newTravelSetInfo;
        }
    }
})
export default store;