<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2020/11/7
  Time: 上午 09:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FUN x TAIWAN</title>
<%--    <script src="//vuejs.org/js/vue.min.js"></script>--%>
<%--    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>--%>
<%--    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">--%>
<%--    <script src="//unpkg.com/element-ui"></script>--%>
<%--    <script src="//unpkg.com/element-ui/lib/umd/locale/en.js"></script>--%>

    <script>
        // ELEMENT.locale(ELEMENT.lang.en);
        <%--var attractionOrigin;--%>
        <%--axios.get("${pageContext.servletContext.contextPath}/admin/attraction/detail/4512")--%>
        <%--    .then(response => {--%>
        <%--        attractionOrigin = response.data;--%>
        <%--    });--%>
        <%--var regioinOrigin;--%>
        <%--axios.get('${pageContext.servletContext.contextPath}/admin/list.Region')--%>
        <%--    .then(response => {--%>
        <%--        regioinOrigin =  response.data;--%>
        <%--    });--%>
    </script>

    <style>
        .avatar-uploader .el-upload {
            border: 1px dashed #d9d9d9;
            border-radius: 6px;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }
        .avatar-uploader .el-upload:hover {
            border-color: #409EFF;
        }
        .avatar-uploader-icon {
            font-size: 28px;
            color: #8c939d;
            width: 178px;
            height: 178px;
            line-height: 178px;
            text-align: center;
        }
        .avatar {
            /*width: 300px;*/
            /*height: 300px;*/
            display: block;
        }
        .gotop-index {
            /*position: fixed;*/
            /*right: 2.5rem;*/
            /*bottom: 4rem;*/
            /*display: block;*/
            /*width: 1em;*/
            /*height: 1em;*/
            /*font-size: 35px;*/
            /*background: #fff;*/
            /*box-shadow: 0px 0px 4px #acbdd7;*/
            /*display: flex;*/
            /*border-radius: 50%;*/
            /*z-index: 999;*/

        }
        .gotop-a {
            /*display: block;*/
            /*width: 1.5rem;*/
            /*height: 5rem;*/
            /*!*background: url(~@/assets/images/icon-top.gif) no-repeat 0 0;*!*/
            /*background-size: 0.5rem;*/
            /*margin: auto;*/

            position: fixed;
            background-color: #fff;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            color: #409eff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            box-shadow: 0 0 6px rgba(0,0,0,.12);
            cursor: pointer;
            z-index: 5;
        }

    </style>
    <c:import url="/WEB-INF/admin/fragment/ref.jsp"/>
</head>
<body class="sidebar-fixed sidebar-dark header-light header-fixed" id="body">
<div class="wrapper">
    <%--import sidebar--%>
    <c:import url="/WEB-INF/admin/fragment/sidebar.jsp"/>
    <div class="page-wrapper">
        <%--import header--%>
        <c:import url="/WEB-INF/admin/fragment/header.jsp"/>

        <%--CONTENT--%>
        <div class="content-wrapper" id="app">
            <el-page-header  @back="goBack" v-if="isInsert" content="新 增 頁 面" style="position: fixed;">
            </el-page-header>
            <el-page-header @back="goBack" v-else content="修 改 頁 面" style="position: fixed;">
            </el-page-header>



            <div class="content">
                <div class="row">
                    <div class="col-12">
                        <el-button type="info" round v-if="isInsert" v-on:click="handleInjectData">匯入資料</el-button>

                        <div class="gotop-index" v-show="btnFlag">
                            <div class="gotop-a" style="right: 25px; bottom: 150px;">
                                <a href="javascript:;" class="el-icon-caret-top" @click="backTop"></a>
                            </div>
                        </div>

<%--                        <div style="height: 100%; overflow: scroll;"></div>--%>
<%--                        <el-backtop @back="goBack" target=".content .row .col-12"></el-backtop>--%>



                        <el-form label-width="180px" :model="attractionData" ref="attractionData" :rules="rules">
                            <el-form-item label="ID" prop="sn" v-bind:hidden="isInsert">
                                <el-input v-model="attractionData.sn" disabled></el-input>
                            </el-form-item>
                            <el-form-item label="名稱" prop="name">
                                <el-input v-model="attractionData.name"></el-input>
                            </el-form-item>
                            <el-form-item label="電話" prop="tel">
                                <el-input v-model="attractionData.tel"></el-input>
                            </el-form-item>
                            <el-form-item label="地址" prop="address">
                                <el-input v-model="attractionData.address"></el-input>
                            </el-form-item>
                            <el-form-item label="地區" prop="region">
                                <el-select v-model="attractionData.region" placeholder="選擇地區" >
                                    <el-option label="--請選擇--" disabled></el-option>
                                    <el-option v-for="ele in region" v-bind:key="ele" :value="ele"></el-option>
                                </el-select>
                            </el-form-item>
                            <el-form-item
                                    label="Px 經度"
                                    prop="px"
                                    >
                                <el-input v-model="attractionData.px"></el-input>
                            </el-form-item>
                            <el-form-item
                                    label="Py 緯度"
                                    prop="py"
                                    >
                                <el-input v-model="attractionData.py"></el-input>
                            </el-form-item>
<%--                            <el-form-item label="picture_url" prop="pictureUrl">--%>
<%--                                <el-input v-model="attractionPic.picUrl"></el-input>--%>
<%--                            </el-form-item>--%>
                            <el-form-item label="圖片" prop="picture">
                                <el-tag type="warning">限制 {{pictureLimit}} 張圖片</el-tag>
<%--                                <el-image--%>
<%--                                        style="width: 300px; height: 300px"--%>
<%--                                        :src="picture[0]"--%>
<%--                                        :preview-src-list="picture"--%>
<%--                                        onerror="this.src='${pageContext.servletContext.contextPath}/assets/nopic.jpg'">--%>
<%--                                </el-image>--%>
                                <el-upload
                                        ref="upload"
                                        action=""
                                        list-type="picture-card"
                                        :file-list="fileList"
                                        :on-preview="handlePictureCardPreview"
                                        :on-success="handleAvatarSuccess"
                                        :before-upload="beforeAvatarUpload"
                                        :on-remove="handleRemove"
                                        :limit="pictureLimit">
                                    <i class="el-icon-plus"></i>
                                </el-upload>
                                <el-dialog :visible.sync="dialogVisible">
                                    <el-image width="100%" :src="imageUrl" alt="" lazy></el-image>
                                </el-dialog>
                            </el-form-item>
                            <el-form-item label="詳細描述" prop="toldescribe">
                                <el-input v-model="attractionData.toldescribe"
                                          type="textarea"
                                          :autosize="{ minRows: 2}"></el-input>
                            </el-form-item>
                            <el-form-item label="簡述" prop="description">
                                <el-input v-model="attractionData.description"
                                          type="textarea"
                                          :autosize="{ minRows: 2}"></el-input>
                            </el-form-item>
                            <el-form-item label="旅遊資訊" prop="travellingInfo">
                                <el-input v-model="attractionData.travellingInfo"
                                          type="textarea"
                                          :autosize="{ minRows: 2}"></el-input>
                            </el-form-item>
                            <el-form-item label="門票資訊" prop="ticketInfo">
                                <el-input v-model="attractionData.ticketInfo"
                                          type="textarea"
                                          :autosize="{ minRows: 2}"></el-input>
                            </el-form-item>
                            <el-form-item label="關鍵字" prop="keywords">
                                <el-input v-model="attractionData.keywords"></el-input>
                            </el-form-item>
                            <el-form-item label="備註" prop="remarks">
                                <el-input v-model="attractionData.remarks"
                                          type="textarea"
                                          :autosize="{ minRows: 2}"></el-input>
                            </el-form-item>

                            <el-form-item label="評分"
                                          prop="rating"
                            >
                                <template>
                                    <el-row>
                                        <el-col :span="4">
                                            <el-input v-model="attractionData.rating"></el-input>
                                        </el-col>
                                        <el-col :span="4"></el-col>
                                        <el-col :span="4">
                                            <el-rate
                                                    v-model="attractionData.rating"
                                                    :colors="['#99A9BF', '#F7BA2A', '#FF9900']"
                                                    :allow-half="true"
                                                    show-score
                                                    text-color="#ff9900"
                                                    score-template="{value}">
                                            </el-rate>
                                        </el-col>
                                        <el-col :span="12"></el-col>
                                    </el-row>
                                </template>
                            </el-form-item>

                            <el-form-item label="開放時間" prop="openTime">
                                <el-input v-model="attractionData.openTime"
                                          type="textarea"
                                          :autosize="{ minRows: 2}"></el-input>
                            </el-form-item>
                            <el-form-item label="啟用狀態" prop="status">
                                <label class="switch switch-text switch-success switch-pill form-control-label">
                                    <input type="checkbox" class="switch-input form-check-input" v-bind:checked="attractionData.status" v-on:click="()=>attractionData.status=!attractionData.status">
                                    <span class="switch-label" data-on="啟用" data-off="禁用"></span>
                                    <span class="switch-handle"></span>
                                </label>
                            </el-form-item>
                            <el-form-item>
                                <el-button type="primary" v-on:click="submitForm">立即更新</el-button>
                                <el-button v-on:click="resetDataForm('attractionData')">重 置</el-button>
                            </el-form-item>
                        </el-form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    var vm = new Vue({
        el: '#app',
        data() {
            var checkRating = (rule, value, callback) => {
                if (!Number(value)) {
                    callback(new Error('輸入評分'));
                } else {
                    if (value <= 0 || value >= 5) {
                        callback(new Error('評分必須0-5'));
                    } else {
                        callback();
                    }
                }
            };
            var checkDouble = (rule, value, callback) => {
                if (!Number(value)) {
                    callback(new Error('輸入數字'));
                }
            };

            return {
                btnFlag: false,
                isInsert: true,
                attractionData: {
                    sn: '',
                    name: '',
                    tel: '',
                    address: '',
                    region: '',
                    px: '',
                    py: '',
                    pictureUrl: '',
                    toldescribe: '',
                    description: '',
                    travellingInfo: '',
                    ticketInfo: '',
                    keywords: '',
                    remarks: '',
                    rating: '',
                    openTime: '',
                    status: false
                },
                attractionPic: [{id: '', filename: '', dest: ''}],
                region: [],
                imageUrl: '',
                picture: [],
                fileList: [],
                pictureLimit: 3,
                param: new FormData(),
                removePicId: [],
                dialogVisible: false,
                iconClasses: ['icon-rate-face-1', 'icon-rate-face-2', 'icon-rate-face-3'],

                rules: {
                    rating: [
                        { validator: checkRating, trigger: 'change' }
                    ],
                    px: [
                        { validator: checkDouble, trigger: 'change' }
                    ],
                    py: [
                        { validator: checkDouble, trigger: 'change' }
                    ]
                }

            }
        },
        created: function () {
            <c:if test="${not empty id}">
            this.isInsert = false;
            this.attractionData.sn = ${id};
            </c:if>
            if(!this.isInsert) this.getAttractionData(this);
            this.getRegionData()
        },
        computed: {
            validateRating(){
                return this.attractionData.rating >=0 && this.attractionData.rating <=5
            }
        },
        mounted(){
            window.addEventListener("scroll", this.scrollToTop, true);
        },
        destroyed(){
            window.removeEventListener("scroll", this.scrollToTop, true);
        },
        methods: {
            initData(){
                this.attractionData = {};
                this.attractionPic = [];
                this.imageUrl = '';
                this.picture= [];
                this.fileList = [];
                this.param= new FormData();
                this.removePicId= [];
                this.dialogVisible= false;
            },
            getAttractionData(obj){
                $.get({
                    url: '${pageContext.servletContext.contextPath}/admin/attraction/entity/'+obj.attractionData.sn,
                    async: false,
                    success: function (response) {
                        obj.attractionData = response.attractionData;
                        obj.attractionPic = response.attractionPic;
                        obj.fileList = [];
                        for (let i = 0; i < obj.attractionPic.length; i++) {
                            <%--let sId = "${pageContext.servletContext.contextPath}/admin/attraction/pic/"+obj.attractionData.sn+"/"+i;--%>
                            <%--obj.fileList.push({name:response.attractionPic[i].id, url:sId});--%>

                            let pic = response.attractionPic[i];
                            obj.fileList.push({id:pic.id, name:pic.filename, url:"${pageContext.servletContext.contextPath}/attraction/pic/"+obj.attractionData.sn+"/"+pic.filename});
                        }
                        <%--obj.picture = "${pageContext.servletContext.contextPath}/admin/attraction/pic/"+response.sn;--%>
                        <%--obj.url = "${pageContext.servletContext.contextPath}/admin/attraction/"+response.sn;--%>
                    }
                });
            },
            getRegionData(){
                axios.get('${pageContext.servletContext.contextPath}/admin/list.Region')
                    .then(response => {
                        this.region = response.data;
                    });
            },
            resetDataForm(formName) {
                console.log(this.$refs[formName]);
                this.$refs[formName].resetFields();
            },
            submitForm(){
                let url='${pageContext.servletContext.contextPath}/admin/attraction/save/'+this.attractionData.sn
                if(this.isInsert) url = '${pageContext.servletContext.contextPath}/admin/attraction/save';

                this.param.append('attractionData', JSON.stringify(this.attractionData));
                this.param.append('removePicId', JSON.stringify(this.removePicId));
                let config = {
                   header: {
                       'Content-Type': 'multipart/form-data'
                   }
                }
                axios.post(
                    url,
                    this.param,
                    config
                ).then(response =>  {
                    console.log(response);
                    if(response.data.message){
                        this.$message({
                            type: 'success',
                            message: '更新成功!!'
                        });
                        // this.isInsert = false;
                        // this.attractionData.sn = response.data.attractionData.sn;
                        // window.location.reload();

                        this.initData();
                        <%--// this.$refs.upload.clearFiles();--%>
                        this.attractionData = response.data.attractionData;
                        this.attractionPic = response.data.attractionPic;
                        this.isInsert = false;
                        console.log(this.fileList);
                        <%--// this.fileList.splice();--%>
                        <%--console.log(this.fileList);--%>

                        for (let i = 0; i < this.attractionPic.length; i++) {
                            let pic = this.attractionPic[i];
                            this.fileList.push({id:pic.id, name:pic.filename, url:"${pageContext.servletContext.contextPath}/attraction/pic/"+this.attractionData.sn+"/"+pic.filename});
                            this.imageUrl = this.fileList[i].url;
                        }
                    }else{
                        this.$message({
                            type: 'info',
                            message: '更新失敗!!'
                        });
                    }
                })
                this.$forceUpdate();
            },
            handleAvatarSuccess(res, file) {
                this.imageUrl = URL.createObjectURL(file.raw);
                // this.imageUrl = URL.createObjectURL(file);
                // this.param = new FormData();
                this.param.append('file', file.raw, file.raw.name);

            },
            handlePictureCardPreview(file) {
                this.imageUrl = file.url;
                this.dialogVisible = true;
            },
            beforeAvatarUpload(file) {
                const isPIC = (file.type == 'image/jpeg' || file.type=='image/png');
                const isLt2M = file.size / 1024 / 1024 < 4;

                if (!isPIC) {
                    this.$message.error('只能是JPEG、PNG');
                }
                if (!isLt2M) {
                    this.$message.error('不能超過4MB');
                }
                return isPIC && isLt2M;
            },
            handleRemove(file, fileList) {
                this.param.delete('file');
                if(file.id){
                    console.log(file.id)
                    this.removePicId.push(file.id);
                }
            },
            goBack() {
                console.log('go back');
                window.location.href = "${pageContext.servletContext.contextPath}/admin/attraction";
            },
            backTop() {
                const that = this;
                let timer = setInterval(() => {
                    let ispeed = Math.floor(-that.scrollTop / 5);
                    document.documentElement.scrollTop = document.body.scrollTop =
                        that.scrollTop + ispeed;
                    if (that.scrollTop === 0) {
                        clearInterval(timer);
                    }
                }, 16);
            },
            // 为了计算距离顶部的高度，当高度大于60显示回顶部图标，小于60则隐藏
            scrollToTop() {
                console.log(123);
                const that = this;
                let scrollTop =
                    window.pageYOffset ||
                    document.documentElement.scrollTop ||
                    document.body.scrollTop;
                that.scrollTop = scrollTop;
                if (that.scrollTop > 30) {
                    that.btnFlag = true;
                } else {
                    that.btnFlag = false;
                }
            },
            handleInjectData(){
                this.attractionData =
                {
                    sn: 0,
                    name: '臺北龍山寺',
                    tel: '02-2302-5162',
                    address: '臺北市萬華區廣州街211號',
                    region: '臺北市',
                    px: 121.49990,
                    py: 25.037162,
                    pictureUrl: '',
                    description: '龍山寺坐北朝南，面呈回字形，為中國古典三進四合院之宮殿式建築，由前殿、正殿、後殿及左右護龍構成。前殿為11開間，分為三川殿、龍門廳、虎門廳。三川殿前有一對全臺僅見之銅鑄蟠龍柱，正面牆堵則由花崗石與青斗石混合組構而成，牆上故事多出自三國演義和封神榜，富於教育意義。正殿屋頂採歇山重簷式，四面走馬廊共42根柱子構成，殿外牆堵留有多幅著名書法家石刻，殿內的螺旋藻井不費一釘一鐵，全由斗栱相嵌築構而成。後殿屋頂採歇山重簷式，為典型儒、道教諸神佛供奉處。左右護龍各配有鐘樓與鼓樓，晨鐘暮鼓，其轎頂式扁六角形的屋頂，造形獨特。全寺屋頂脊帶和飛簷由龍鳳、麒麟等吉祥物造形，飾以剪黏和交趾陶，色彩瑰麗，堪稱臺灣剪黏藝術之精華。',
                    travellingInfo: '自行開車：\n' +
                        '國道1號-環北交流道下-環河快速道路-桂林路-西園路一段-廣州街。\n' +
                        '國道3號-中和交流道下-市道106甲線-鄉道北91線-市道114線-光復橋-西園路二段至一段-廣州街。\n' +
                        '大眾運輸：\n' +
                        '搭高鐵或臺鐵至臺北站下-轉搭臺北捷運至龍山寺站下。\n' +
                        '搭臺鐵至萬華站下。\n' +
                        '搭臺北市雙層觀光巴士紅線至捷運龍山寺站下。',
                    ticketInfo: '免費參觀',
                    keywords: '#寺廟祈福#打卡熱點#古蹟巡禮',
                    remarks: '無障礙設施 公廁 失物招領 廣播服務',
                    rating: 4.4,
                    openTime:
                        '星期日\t06:00 - 22:00\n' +
                        '星期一\t06:00 - 22:00\n' +
                        '星期二\t06:00 - 22:00\n' +
                        '星期三\t06:00 - 22:00\n' +
                        '星期四\t06:00 - 22:00\n' +
                        '星期五\t06:00 - 22:00\n' +
                        '星期六\t06:00 - 22:00',
                    status: false,
                    toldescribe: '艋舺，今名萬華，為臺北市發源地，其最古老市街在紗帽廚社的故址大溪口，即今貴陽街與環河南路口。清康熙四十八年（西元1709年）陳賴章墾號請墾大佳臘，福建泉州之晉江、南安、惠安三邑人士渡海來此而漸成聚落，當時平埔族人以獨木舟自淡水河上游載運蕃薯等農產品與漢人交易，時稱蕃薯市；而獨木舟在平埔族語言中之發音為Banka，漢人乃音譯為「艋舺」。\n' +
                        '\n' +
                        '早年臺灣北部為一蠻煙瘴癘之地，俗諺「三在六亡一回頭」，環境十分險惡，漢人前來墾植時為求神佑，多攜帶家鄉廟宇香火以為庇護，後因漢人聚落漸增，三邑人士遂於清乾隆三年（西元1738年）合資興建龍山寺，並迎請福建省晉江縣安海龍山寺觀世音菩薩分靈來臺。龍山寺不僅是居民信仰中心，舉凡議事、訴訟等均祈求神靈公斷。光緒十年（西元1884年）中法戰爭中，法軍侵占基隆獅球嶺，當地居民乃組織義軍，以龍山寺印行文官署，協助擊退法軍，獲光緒皇帝賜「慈暉遠蔭」匾額。\n' +
                        '\n' +
                        '初創之龍山寺，規模雄偉，雕塑精緻，歷經嘉慶二十年（西元1815年）大地震重修，同治六年（西元1867年）暴風雨侵襲再行修築，至民國八年棟樑遭白蟻蛀蝕，當時住持福智大師率先捐出一生積蓄七千餘元，集資修復，奠定今日龍山寺之規模。民國卅四年於第二次世界大戰期間受空襲摧殘，中殿全毀，惟觀世音菩薩聖像仍端坐蓮臺，寶相莊嚴；以往遇有空襲，居民皆以觀世音菩薩蓮座下為避難所，然此次空襲前夕，避難居民因不堪兇蚊肆虐紛紛返家，以致中殿受毀時無人受難，居民相信是觀世音菩薩庇護而奔相走告，此一神蹟更使得觀世音菩薩成為艋舺居民一大精神支柱。\n' +
                        '\n' +
                        '龍山寺坐北朝南，面呈回字形，為中國古典三進四合院之宮殿式建築，由前殿、正殿、後殿及左右護龍構成。前殿為11開間，分為三川殿、龍門廳、虎門廳。三川殿前有一對全臺僅見之銅鑄蟠龍柱，正面牆堵則由花崗石與青斗石混合組構而成，牆上故事多出自三國演義和封神榜，富於教育意義。正殿屋頂採歇山重簷式，四面走馬廊共42根柱子構成，殿外牆堵留有多幅著名書法家石刻，殿內的螺旋藻井不費一釘一鐵，全由斗栱相嵌築構而成。後殿屋頂採歇山重簷式，為典型儒、道教諸神佛供奉處。左右護龍各配有鐘樓與鼓樓，晨鐘暮鼓，其轎頂式扁六角形的屋頂，造形獨特。全寺屋頂脊帶和飛簷由龍鳳、麒麟等吉祥物造形，飾以剪黏和交趾陶，色彩瑰麗，堪稱臺灣剪黏藝術之精華。\n' +
                        '\n' +
                        '民國七十四年政府公告艋舺龍山寺為國家保護之二級古蹟，與國立故宮博物院、中正紀念堂並列為國際觀光客來臺旅遊的三大名勝。龍山寺並於板橋文化路興建文化廣場大樓，民國九十四年落成啟用後，辦理多項課程與講座，以善盡弘揚佛法、提倡社教的文化價值。艋舺龍山寺每年定期舉辦節慶祭典及民俗活動，如農曆正月花燈展覽、四月浴佛節、七月盂蘭盆勝會等，民眾來到艋舺龍山寺除了欣賞臺灣寺廟建築藝術之美，亦可以感受傳統民俗文化的樂趣。'
                };
            }
        }
    });
</script>

</body>
</html>
