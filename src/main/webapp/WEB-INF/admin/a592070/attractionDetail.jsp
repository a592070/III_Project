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
    <title>Title</title>
    <script src="//vuejs.org/js/vue.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="//unpkg.com/element-ui"></script>
    <script src="//unpkg.com/element-ui/lib/umd/locale/en.js"></script>

    <script>
        ELEMENT.locale(ELEMENT.lang.en);
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


                        <div class="gotop-index" v-show="btnFlag">
                            <div class="gotop-a" style="right: 25px; bottom: 150px;">
                                <a href="javascript:;" class="el-icon-caret-top" @click="backTop"></a>
                            </div>
                        </div>

<%--                        <div style="height: 100%; overflow: scroll;"></div>--%>
<%--                        <el-backtop @back="goBack" target=".content .row .col-12"></el-backtop>--%>



                        <el-form label-width="180px" :model="attractionData" ref="attractionData" >
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
                            <el-form-item label="Px 經度" prop="px">
                                <el-input v-model="attractionData.px"></el-input>
                            </el-form-item>
                            <el-form-item label="Py 緯度" prop="py">
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
                                <el-input v-model="attractionData.remarks" type="textarea"></el-input>
                            </el-form-item>
                            <el-form-item label="評分" prop="rating">
                                <el-input v-model="attractionData.rating"></el-input>
                            </el-form-item>
                            <el-form-item label="開放時間" prop="openTime">
                                <el-input v-model="attractionData.openTime" type="textarea"></el-input>
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
                dialogVisible: false

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
            }
        }
    });
</script>

</body>
</html>
