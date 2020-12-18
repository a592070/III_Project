Vue.use(Vuex);
const store = new Vuex.Store({
    state: {
        storeData: "HHHHello",
        travelSetInfoLoading: true,
        travelSetDialog: false,
        travelSetDetailLoading: true,
        travelSetInfo: [
            {sn: 0,
            createdUser: '',
            name: '',
            description: '',
            createdTime: '',
            updateTime: '',
            priority: 0,
            status: false}],
        currentEditTravelSetIndex: 0,
        travelSetSaved: false,
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
            travelSetAttractions: {data: []},
            travelSetRestaurants: {data: []},
            travelSetHotels: {data: []},
            // travelSetCars: {data: []}
        },
        currentEditTravelSetSelectItem: {
            sn: 0,
            name: ''
        },
        selectItemDialog: false,
        selectItemLoading: true,
        selectItemData: {index: 0, type: 0},
        saveAvailable: false
    },
    getters: {
        getTravelSetInfoLoading: (state) => state.travelSetInfoLoading,
        getTravelSetDialog: (state) => state.travelSetDialog,
        getTravelSetDetailLoading: (state) => state.travelSetDetailLoading,

        getCurrentTravelSetDetail: (state) => state.currentEditTravelSetDetail,
        getCurrentTravelSetSelectItem: (state) => state.currentEditTravelSetSelectItem,
        getCurrentTravelSetInfo: (state) => state.currentEditTravelSetInfo,
        getSaveAvailable: (state) => state.saveAvailable,
    },
    mutations: {
        toggleTravelSetInfoLoading(state, flag){
            state.travelSetInfoLoading = flag;
        },
        toggleTravelSetDialog(state, flag){
            state.travelSetDialog = flag;
        },
        toggleTravelSetDetailLoading(state, flag){
            state.travelSetDetailLoading = flag;
        },
        setTravelSetInfo(state, newData){
            state.travelSetInfo = newData
        },
        setCurrentEditTravelSetIndex(state, index){
            state.currentEditTravelSetIndex = index;
        },
        setTravelSetSaved(state, flag){
            state.travelSetSaved = flag;
        },

        setCurrentTravelSetInfo(state, newTravelSetInfo){
            state.currentEditTravelSetInfo = newTravelSetInfo;
        },
        setCurrentTravelSetDetail(state, newTravelSetDetail){
            state.currentEditTravelSetDetail = newTravelSetDetail;
        },
        setCurrentTravelSetSelectItem(state, newTravelSetSelectItem){
            state.currentEditTravelSetSelectItem = newTravelSetSelectItem;
        },
        toggleSelectItemDialog(state, flag){
            state.selectItemDialog = flag;
        },
        toggleSelectItemLoading(state, flag){
            state.selectItemLoading = flag;
        },
        setSelectItemData(state, data){
            state.selectItemData = data;
        },
        setTravelSetDetailSelectItem(state, data){
            let i = state.selectItemData.index;
            console.log(state.selectItemData);
            if(state.selectItemData.type == 0){
                state.currentEditTravelSetDetail.travelSetAttractions.data[i].attraction.sn = data.sn;
                state.currentEditTravelSetDetail.travelSetAttractions.data[i].attraction.name = data.name;

                console.log(state.currentEditTravelSetDetail.travelSetAttractions.data[i].attraction);
            }else if(state.selectItemData.type == 1){
                state.currentEditTravelSetDetail.travelSetRestaurants.data[i].restaurant.sn = data.sn;
                state.currentEditTravelSetDetail.travelSetRestaurants.data[i].restaurant.name = data.name;

                console.log(state.currentEditTravelSetDetail.travelSetRestaurants.data[i].restaurant);
            }else if(state.selectItemData.type == 2){
                state.currentEditTravelSetDetail.travelSetHotels.data[i].hotel.sn = data.sn;
                state.currentEditTravelSetDetail.travelSetHotels.data[i].hotel.name = data.name;

                console.log(state.currentEditTravelSetDetail.travelSetHotels.data[i].hotel);
            }
            // else if(state.selectItemData.type == 3){
            //     state.currentEditTravelSetDetail.travelSetCars.data[i].car.sn = data.sn;
            //     state.currentEditTravelSetDetail.travelSetCars.data[i].car.name = data.name;
            //
            //     console.log(state.currentEditTravelSetDetail.travelSetCars.data[i].car);
            // }
        },
        initTravelSteDetail(state){
            state.currentEditTravelSetDetail = {
                travelSetInfo: {
                    sn: 0,
                    createdUser: '',
                    name: '',
                    description: '',
                    createdTime: '',
                    updateTime: '',
                    priority: 0,
                    status: false},
                travelSetAttractions: {data: []},
                travelSetRestaurants: {data: []},
                travelSetHotels: {data: []},
                // travelSetCars: {data: []}
            }
        },
        initSelectItemData(state){
            state.selectItemData = {index: 0, type: 0};
        }

    },
    actions: {
        selectedTravelSetDetailData(state, sn){
            return axios.get(context+'/admin/travelSet/entity/'+sn)
                .then(response => {

                    let tmp = {
                        travelSetInfo: response.data.travelSetInfo,
                        travelSetAttractions: {
                            data: response.data.travelSetAttractions
                        },
                        travelSetHotels: {
                            data: response.data.travelSetHotels
                        },
                        travelSetRestaurants: {
                            data: response.data.travelSetRestaurants
                        }
                        // ,travelSetCars: {
                        //     data: response.data.travelSetCars
                        // },
                    }

                    state.commit("setCurrentTravelSetDetail", tmp);
                })
        },
        saveTravelSteDetailData(state, data){
            let url = context + '/admin/travelSet/save/'+data.travelSetInfo.sn
            let params = {
                travelSetInfo: JSON.stringify(data.travelSetInfo),
                travelSetAttractions: JSON.stringify(data.travelSetAttractions.data),
                travelSetHotels: JSON.stringify(data.travelSetHotels.data),
                travelSetRestaurants: JSON.stringify(data.travelSetRestaurants.data),
                // travelSetCars: JSON.stringify(data.travelSetCars.data)
            };
            return axios({
                method: 'put',
                url: url,
                data: params
            }).then( response => {
                console.log(response.data);
                if(response.data.message){
                    let tmp = {
                        travelSetInfo: response.data.travelSetInfo,
                        travelSetAttractions: {
                            data: response.data.travelSetAttractions
                        },
                        travelSetHotels: {
                            data: response.data.travelSetHotels
                        },
                        travelSetRestaurants: {
                            data: response.data.travelSetRestaurants
                        },
                        // travelSetCars: {
                        //     data: response.data.travelSetCars
                        // },
                    }

                    state.commit("setCurrentTravelSetDetail", tmp);
                    state.commit("setTravelSetSaved", true);
                    state.commit("setCurrentTravelSetInfo", response.data.travelSetInfo);
                }
                return response.data.message;
            })
        },
        handleUserAvailable(state, username){
            let url = context + '/admin/travelSet/checkuser/'+username;
            return axios.post(url)
                .then(response => {
                    return response.data;
                });
        }
    }
})
export default store;