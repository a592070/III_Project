<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
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
            <div class="content">
                <div class="row">
                    <div class="col-12">
                        <el-page-header @back="goBack" content="詳細頁面">
                        </el-page-header>

                        <el-form label-width="180px" :model="attractionData" ref="attractionData" >
                            <el-form-item label="ID" prop="sn">
                                <el-input v-model="attractionData.sn" disabled ></el-input>
                            </el-form-item>
                            <el-form-item label="名稱" prop="name">
                                <el-input v-model="attractionData.name"></el-input>
                            </el-form-item>
                            <el-form-item label="tel" prop="tel">
                                <el-input v-model="attractionData.tel"></el-input>
                            </el-form-item>
                            <el-form-item label="address" prop="address">
                                <el-input v-model="attractionData.address"></el-input>
                            </el-form-item>
                            <el-form-item label="region" prop="region">
                                <el-select v-model="attractionData.region" placeholder="選擇地區" >
                                    <el-option label="--請選擇--" disabled></el-option>
                                    <el-option v-for="ele in region" v-bind:key="ele" :value="ele"></el-option>
                                </el-select>
                            </el-form-item>
                            <el-form-item label="px" prop="px">
                                <el-input v-model="attractionData.px"></el-input>
                            </el-form-item>
                            <el-form-item label="py" prop="py">
                                <el-input v-model="attractionData.py"></el-input>
                            </el-form-item>
                            <el-form-item label="picture_url" prop="pictureUrl">
                                <el-input v-model="attractionData.pictureUrl"></el-input>
                            </el-form-item>
                            <el-form-item label="picture" prop="picture">
                                <el-image
                                        style="width: 300px; height: 300px"
                                        :src="picture"
                                        :preview-src-list="[picture]"
                                        onerror="this.src='${pageContext.servletContext.contextPath}/assets/nopic.jpg'">
                                </el-image>
                                <el-upload
                                        action=""
                                        list-type="picture-card"
                                        :on-preview="handlePictureCardPreview"
                                        :on-success="handleAvatarSuccess"
                                        :before-upload="beforeAvatarUpload"
                                        :on-remove="handleRemove"
                                        :limit="1">
                                    <i class="el-icon-plus"></i>
                                </el-upload>
                                <el-dialog :visible.sync="dialogVisible">
                                    <img width="100%" :src="imageUrl" alt="">
                                </el-dialog>
                            </el-form-item>
                            <el-form-item label="詳細描述" prop="toldescribe">
                                <el-input v-model="attractionData.toldescribe"
                                          type="textarea"
                                          :autosize="{ minRows: 2}"></el-input>
                            </el-form-item>
                            <el-form-item label="description" prop="description">
                                <el-input v-model="attractionData.description"
                                          type="textarea"
                                          :autosize="{ minRows: 2}"></el-input>
                            </el-form-item>
                            <el-form-item label="travellingInfo" prop="travellingInfo">
                                <el-input v-model="attractionData.travellingInfo"
                                          type="textarea"
                                          :autosize="{ minRows: 2}"></el-input>
                            </el-form-item>
                            <el-form-item label="ticketInfo" prop="ticketInfo">
                                <el-input v-model="attractionData.ticketInfo"
                                          type="textarea"
                                          :autosize="{ minRows: 2}"></el-input>
                            </el-form-item>
                            <el-form-item label="keywords" prop="keywords">
                                <el-input v-model="attractionData.keywords"></el-input>
                            </el-form-item>
                            <el-form-item label="remarks" prop="remarks">
                                <el-input v-model="attractionData.remarks" type="textarea"></el-input>
                            </el-form-item>
                            <el-form-item label="rating" prop="rating">
                                <el-input v-model="attractionData.rating"></el-input>
                            </el-form-item>
                            <el-form-item label="openTime" prop="openTime">
                                <el-input v-model="attractionData.openTime" type="textarea"></el-input>
                            </el-form-item>
                            <el-form-item>
                                <el-button type="primary" v-on:click="submitForm">立即更新</el-button>
                                <el-button v-on:click="resetDataForm('attractionData')">取消</el-button>
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
                    openTime: ''
                },
                region: [],
                imageUrl: '',
                picture: '',
                param: new FormData(),
                dialogVisible: false

            }
        },
        created: function () {
            this.getAttractionData(this)
            this.getRegionData()
        },
        methods: {
            getAttractionData(obj){
                $.get({
                    url: '${pageContext.servletContext.contextPath}/admin/attraction/entity/${id}',
                    async: false,
                    success: function (response) {
                        obj.attractionData = response;
                        obj.picture = "${pageContext.servletContext.contextPath}/admin/attraction/pic/"+response.sn;
                        obj.url = "${pageContext.servletContext.contextPath}/admin/attraction/"+response.sn;
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
                let url='${pageContext.servletContext.contextPath}/admin/attraction/update/'+this.attractionData.sn
                console.log(this.name);
                this.param.append('attractionData', JSON.stringify(this.attractionData));
                let config = {
                   header: {
                       'Content-Type': 'multipart/form-data',
                       "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE",
                       'crossdomain': true
                   }
                }
                axios.post(
                    url,
                    this.param,
                    config
                ).then(function (response) {
                    console.log(response);
                    if(response.data == true){
                        alert("更新成功")
                        window.location.reload();
                    }else{
                        alert("更新失敗")
                    }
                })
            },
            handleAvatarSuccess(res, file) {
                this.imageUrl = URL.createObjectURL(file.raw);
                // this.imageUrl = URL.createObjectURL(file);
                // this.param = new FormData();
                this.param.append('file', file.raw, file.raw.name);
            },
            handlePictureCardPreview(file) {
                // this.imageUrl = file.url;
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
                console.log(file, fileList);
                this.param.delete('file');
            },
            goBack() {
                console.log('go back');
            }

        }
    });
</script>

</body>
</html>
