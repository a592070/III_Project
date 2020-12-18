Vue.use(Vuex);
const travelSetStore = new Vuex.Store({
    state: {
        selectRegion: '全部',
        regions: ['全部'],
        selectItemType: 0,
        itemType: [
            { text: '景點', value: 0},
            { text: '餐廳', value: 1},
            { text: '旅館', value: 2},
        ],
        itemList: [
            {
                sn: 0,
                name: '',
                rating: 0,
                description: '',
                address: '',
                images: ['']
            }
        ],
        pageData: {
            currentPage: 1,
            pageSize: 1,
            totalSize: 1,
            totalPageCount: 1
        },
        selectItemDialog: false,
        selectListLoading: true,

        selectItem: {
            sn: 0,
            name: '',
            description: '',
            time: null
        }
    },
    getters: {
        getSelectRegion: (state) => state.selectRegion,
        getRegions: (state) => state.regions,
        getSelectItemType: (state) => state.selectItemType,
        getItemType: (state) => state.itemType,
        getSelectListLoading: (state) => state.selectListLoading,
        getSelectItemDialog: (state) => state.selectItemDialog,
        getItemList: (state) => state.itemList,
        getPageData: (state) => state.pageData,

        getSelectItem: (state) => state.selectItem,

    },
    mutations: {
        setSelectRegion(state, data){
            state.selectRegion = data;
        },
        setRegions(state, data){
            state.regions = data;
            state.regions.unshift('全部');
        },
        setSelectItemType(state, data){
            state.selectItemType = data;
        },
        setItemType(state, data){
            state.itemType = data;
        },
        setItemList(state, data){
            state.itemList = data;
        },
        addItemList(state, data){
            // data = []
            for (let i = 0; i < data.length; i++) {
                state.itemList.push(data[i]);
            }
        },
        setPageData(state, data){
            state.pageData = data;
        },
        addPage(state){
            state.pageData.currentPage += 1;
        },
        toggleSelectListLoading(state, flag){
            state.selectListLoading = flag;
        },
        toggleSelectItemDialog(state, flag){
            state.selectItemDialog = flag;
        },


        setSelectItem(state, data){
            state.selectItem.sn = data.sn;
            state.selectItem.name = data.name;
            state.selectItem.description = data.description;
        }



    },
    actions: {
        initItemListData(state){
            let type = state.getters.getSelectItemType;
            let url = context+'/travelSet/'+type+'/1';

            let region = state.getters.getSelectRegion;
            console.log(region);
            if(region && region !== '全部'){
                url += '/'+region;
            }
            console.log(url);
            return axios.get(url)
                .then(response => {
                    if(response.data) {
                        state.commit('setItemList', response.data.tableData);
                        state.commit('setPageData', response.data.pageData);
                    }
                    return true;
                })
                .catch(() => {
                    return false;
                });
        },
        initRegionsData(state){
            let url = context+'/list.Region';
            axios.get(url)
                .then(response => {
                    state.commit('setRegions', response.data);
                });
        },
        selectedItemListData(state, {region, keyword}){
            let url;
            console.log(region, keyword);
            let type = state.getters.getSelectItemType;

            if(!region || region === "全部") region = "all";

            if(keyword && keyword !== ''){
                url = context+'/travelSet/'+type+'/1/'+region+'/'+keyword;
            }else{
                url = context+'/travelSet/'+type+'/1/'+region;
            }
            console.log(url);
            return axios.get(url)
                .then(response => {
                    state.commit('setItemList', response.data.tableData);
                    state.commit('setPageData', response.data.pageData);
                    return true;
                })
                .catch(() => {
                    return false;
                });
        },
        appendItemListData(state, {region, keyword}){
            let type = state.getters.getSelectItemType;

            let url;
            if(!region || region === "全部"){
                region = "all";
            }
            let pageData = state.getters.getPageData;
            if(!keyword || keyword === ''){
                url = context+'/travelSet/'+type+'/'+pageData.currentPage+'/'+region;
            }else{
                url = context+'/travelSet/'+type+'/'+pageData.currentPage+'/'+region+'/'+keyword;
            }
            console.log(url);
            return axios.get(url)
                .then(response => {
                    state.commit('addItemList', response.data.tableData);
                    state.commit('setPageData', response.data.pageData);
                });
        },
    }
})
export default travelSetStore;