Vue.use(Vuex);
const store = new Vuex.Store({
    state: {
        regions: ['全部'],
        attractionList: [
            {
                sn: 0,
                name: '',
                rating: 0,
                description: '',
                address: '',
                images: ['']
            }
        ],
        selectListLoading: true,
        pageData: {
            currentPage: 1,
            pageSize: 1,
            totalSize: 1,
            totalPageCount: 1
        },

        selectDetailLoading: true,
        initAttractionData: {
            sn: 0,
            name: '暫時沒有資訊',
            toldescribe: '暫時沒有資訊',
            description: '暫時沒有資訊',
            tel: '暫時沒有資訊',
            address: '台灣',
            px: 0,
            py: 0,
            openTime: '暫時沒有資訊',
            ticketInfo: '暫時沒有資訊',
            travellingInfo: '暫時沒有資訊',
            keywords: '暫時沒有資訊',
            remarks: '暫時沒有資訊',
            rating: 1,
            region: '暫時沒有資訊'
        },
        attractionData: {
            sn: 0,
            name: '暫時沒有資訊',
            toldescribe: '暫時沒有資訊',
            description: '暫時沒有資訊',
            tel: '暫時沒有資訊',
            address: '暫時沒有資訊',
            px: 0,
            py: 0,
            openTime: '暫時沒有資訊',
            ticketInfo: '暫時沒有資訊',
            travellingInfo: '暫時沒有資訊',
            keywords: '暫時沒有資訊',
            remarks: '暫時沒有資訊',
            rating: 0,
            region: '暫時沒有資訊'
        },
        attractionPic: [
            {
                id: 0,
                filename: '',
                dest: ''
            }
        ]
    },
    getters: {
        getAttractionList: (state) => state.attractionList,
        getSelectListLoading: (state) => state.selectListLoading,
        getPageData: (state) => state.pageData,
        getRegions: (state) => state.regions,

        getSelectDetailLoading: (state) => state.selectDetailLoading,
        getAttractionData: (state) => state.attractionData,
        getAttractionPic: (state) => state.attractionPic,
    },
    mutations: {
        setAttractionList(state, data){
            state.attractionList = data;
        },
        addAttractionList(state, data){
            // data = []
            for (let i = 0; i < data.length; i++) {
                state.attractionList.push(data[i]);
            }
        },
        toggleSelectListLoading(state, flag){
            state.selectListLoading = flag;
        },
        setPageData(state, data){
            state.pageData = data;
        },
        addPage(state){
            state.pageData.currentPage += 1;
        },
        setRegions(state, data){
            state.regions = data;
            state.regions.unshift('全部');
        },



        toggleSelectDetailLoading(state, flag){
            state.selectDetailLoading = flag;
        },
        setAttractionData(state, data){
            state.attractionData = state.initAttractionData;
            if(data.sn) state.attractionData.sn = data.sn;
            if(data.name) state.attractionData.name = data.name;
            if(data.toldescribe) state.attractionData.toldescribe = data.toldescribe;
            if(data.description) state.attractionData.description = data.description;
            if(data.tel) state.attractionData.tel = data.tel;
            if(data.address) state.attractionData.address = data.address;
            if(data.px) state.attractionData.px = data.px;
            if(data.py) state.attractionData.py = data.py;
            if(data.openTime) state.attractionData.openTime = data.openTime;
            if(data.ticketInfo) state.attractionData.ticketInfo = data.ticketInfo;
            if(data.travellingInfo) state.attractionData.travellingInfo = data.travellingInfo;
            if(data.keywords) state.attractionData.keywords = data.keywords;
            if(data.remarks) state.attractionData.remarks = data.remarks;
            if(data.rating) state.attractionData.rating = data.rating;
            if(data.region) state.attractionData.region = data.region;
        },
        setAttractionPic(state, data){
            state.attractionPic = data;
            console.log(state.attractionPic);
        }

    },
    actions: {
        initAttractionListData(state){
            state.commit('toggleSelectListLoading', true);
            let url = context+'/attraction/list/1';
            axios.get(url)
                .then(response => {
                    state.commit('setAttractionList', response.data.tableData);
                    state.commit('setPageData', response.data.pageData);
                    state.commit('toggleSelectListLoading', false);
                });
        },
        initRegionsData(state){
            let url = context+'/list.Region';
            axios.get(url)
                .then(response => {
                    state.commit('setRegions', response.data);
                });
        },
        selectedAttractionListData(state, {region, keyword}){
            state.commit('toggleSelectListLoading', true);
            let url;
            console.log(region, keyword);

            if(!region || region == "全部") region = "all";

            if(keyword && keyword != ''){
                url = context+'/attraction/list/1/'+region+'/'+keyword;
            }else{
                url = context+'/attraction/list/1/'+region;
            }
            return axios.get(url)
                .then(response => {
                    state.commit('setAttractionList', response.data.tableData);
                    state.commit('setPageData', response.data.pageData);
                    state.commit('toggleSelectListLoading', false);
                });
        },
        appendAttractionListData(state, {region, keyword}){

            let url;
            if(!region || region == "全部"){
                region = "all";
            }
            let pageData = state.getters.getPageData;
            if(!keyword || keyword == ''){
                url = context+'/attraction/list/'+pageData.currentPage+'/'+region;
            }else{
                url = context+'/attraction/list/'+pageData.currentPage+'/'+region+'/'+keyword;
            }
            return axios.get(url)
                .then(response => {
                    state.commit('addAttractionList', response.data.tableData);
                    state.commit('setPageData', response.data.pageData);
                });
        },

        initAttractionData(state, id){
            state.commit('toggleSelectDetailLoading', true);
            let url = context+'/attraction/entity/'+id;
            axios.get(url)
                .then(response => {
                    state.commit('setAttractionData', response.data.attractionData);
                    state.commit('setAttractionPic', response.data.attractionPic);
                    state.commit('toggleSelectDetailLoading', false);
                });
        }
    }
})
export default store;