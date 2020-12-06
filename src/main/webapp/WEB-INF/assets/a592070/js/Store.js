Vue.use(Vuex);
const store = new Vuex.Store({
    state: {
        storeData: "HHHHello",
        travelSetInfoLoading: true,
        travelSetDialog: false,
        travelSetDetailLoading: true,
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
            travelSetInfo: {},
            travelSetAttractions: [],
            travelSetRestaurants: [],
            travelSetHotels: [],
            travelSetCars: []
        },
        currentEditTravelSetSelectItem: {
            sn: 0,
            name: ''
        }
    },
    getters: {
        getTravelSetInfoLoading: (state) => state.travelSetInfoLoading,
        getTravelSetDialog: (state) => state.travelSetDialog,
        getTravelSetDetailLoading: (state) => state.travelSetDetailLoading,

        getCurrentTravelSetDetail: (state) => state.currentEditTravelSetDetail,
        getCurrentTravelSetSelectItem: (state) => state.currentEditTravelSetSelectItem,
        getCurrentTravelSetInfo: (state) => state.currentEditTravelSetInfo
    },
    mutations: {
        toggleTravelSetInfoLoading(state){
            state.travelSetInfoLoading = !state.travelSetInfoLoading;
        },
        toggleTravelSetDialog(state){
            console.log(state.travelSetDialog);
            state.travelSetDialog = !state.travelSetDialog;
            console.log(state.travelSetDialog);
        },
        toggleTravelSetDetailLoading(state){
            state.travelSetDetailLoading = !state.travelSetDetailLoading;
        },

        setCurrentTravelSetInfo(state, newTravelSetInfo){
            state.currentEditTravelSetInfo = newTravelSetInfo;
        },
        setCurrentTravelSetDetail(state, newTravelSetDetail){
            state.currentEditTravelSetDetail={
                travelSetInfo: newTravelSetDetail.travelSetInfo,
                travelSetAttractions: newTravelSetDetail.travelSetAttractions,
                travelSetCars: newTravelSetDetail.travelSetCars,
                travelSetHotels: newTravelSetDetail.travelSetHotels,
                travelSetRestaurants: newTravelSetDetail.travelSetRestaurants
            }
            // state.currentEditTravelSetDetail.travelSetInfo = newTravelSetDetail.travelSetInfo;
            // state.currentEditTravelSetDetail.travelSetAttractions = newTravelSetDetail.travelSetAttractions;
            // state.currentEditTravelSetDetail.travelSetCars = newTravelSetDetail.travelSetCars;
            // state.currentEditTravelSetDetail.travelSetHotels = newTravelSetDetail.travelSetHotels;
            // state.currentEditTravelSetDetail.travelSetRestaurants = newTravelSetDetail.travelSetRestaurants;
            // Vue.set(state.currentEditTravelSetDetail, travelSetInfo, newTravelSetDetail.travelSetInfo);
            // state.currentEditTravelSetDetail = newTravelSetDetail
        },
        setCurrentTravelSetSelectItem(state, newTravelSetSelectItem){
            state.currentEditTravelSetSelectItem = newTravelSetSelectItem;
        }

    },
    actions: {
        selectedTravelSetDetailData(state, sn){
            return fetch(context+'/admin/travelSet/entity/'+sn)
                .then(response => response.json())
                .then(data =>{
                    console.log(data);
                    let detail = {
                        travelSetInfo: data.travelSetInfo,
                        travelSetAttractions: data.travelSetAttractions,
                        travelSetCars: data.travelSetCars,
                        travelSetHotels: data.travelSetHotels,
                        travelSetRestaurants: data.travelSetRestaurants}
                    state.commit("setCurrentTravelSetDetail", data);
                    console.log(state.getters.getCurrentTravelSetDetail);
                });
        }
    }
})
export default store;