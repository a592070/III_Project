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
            width: 178px;
            height: 178px;
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

                        <el-form label-width="80px" :model="attractionData" ref="attractionData">
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
                            <el-form-item label="picture_url" prop="picture_url">
                                <el-input v-model="attractionData.picture_url"></el-input>
                            </el-form-item>
                            <el-form-item label="picture" prop="picture">
                                <el-image
                                        style="width: 100px; height: 100px"
                                        :src="picture"
                                        :preview-src-list="[picture]">
                                </el-image>
                                <el-upload
                                        class="avatar-uploader"
                                        action="url"
                                        :show-file-list="false"
                                        :on-success="handleAvatarSuccess"
                                        :before-upload="beforeAvatarUpload">
                                    <img v-if="imageUrl" :src="imageUrl" class="avatar">
                                    <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                                </el-upload>
                            </el-form-item>
                            <el-form-item label="詳細描述" prop="tolDescription">
                                <el-input v-model="attractionData.tolDescription"
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
                                <el-input v-model="attractionData.remarks"></el-input>
                            </el-form-item>
                            <el-form-item label="rating" prop="rating">
                                <el-input v-model="attractionData.rating"></el-input>
                            </el-form-item>
                            <el-form-item label="openTime" prop="openTime">
                                <el-input v-model="attractionData.openTime"></el-input>
                            </el-form-item>
                            <el-form-item>
                                <el-button type="primary" v-on:click="submitForm('attractionData')">立即更新</el-button>
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
                attractionData: {},
                region: [],
                imageUrl: '',
                picture: '',
                url: ''

                // region: ["全部", "臺北市", "新北市", "桃園市", "臺中市", "高雄市"],
                // attractionData: {
                //     sn: 4515,
                //     name: '錦吉昆蟲館',
                //     tel: '886-49-2920029',
                //     address: '埔里鎮中山路一段21號',
                //     region: '南投縣',
                //     px: '121.0420900',
                //     py: '23.9982700',
                //     picture_url: 'http://travel.nantou.gov.tw/manasystem/files/scenic/20120513170853_food_food_0428.jpg',
                //     picture: '',
                //     tolDescription: '木生昆蟲館位於埔里愛蘭橋附近，錦吉昆蟲館位於觀音瀑布附近，全都收藏了世界各地之昆蟲標本約十幾萬種，是自然科學最佳學習場所。',
                //     description: '',
                //     travellingInfo: '＊開車路線 (以埔里為目的地)1.從北部出發:國道3號→草屯交流道→台14→經過愛蘭橋→往霧社方向中途路旁→錦吉昆蟲館2.從南部出發:國道3號→草屯交流道→台14→經過愛蘭橋→往霧社方向中途路旁→錦吉昆蟲館＊大眾運輸1.可至台中干城車站搭往埔里之客運→至埔里市區轉搭往霧社或奧萬大或松岡公車→錦吉昆蟲館',
                //     ticketInfo: '',
                //     keywords: '',
                //     remarks: '',
                //     rating: '3.3',
                //     openTime: '上班時間AM08:00~PM06:00'
                // }

            }
        },
        created: function () {
            this.getAttractionData(this)
            this.getRegionData()
        },
        methods: {
            getAttractionData(obj){
                $.get({
                    url: '${pageContext.servletContext.contextPath}/admin/attraction/detail/4512',
                    async: false,
                    success: function (response) {
                        obj.attractionData = response;
                        obj.picture = "${pageContext.servletContext.contextPath}/admin/attraction/pic/"+response.sn;
                        obj.url = "${pageContext.servletContext.contextPath}/admin/attraction/posts/"+response.sn;
                    }
                });

                <%--axios.get("${pageContext.servletContext.contextPath}/admin/attraction/detail/4512")--%>
                <%--    .then(response => {--%>
                <%--        this.attractionData = response.data;--%>
                <%--    });--%>
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
                JSON.stringify(this.$refs.formName)
            },
            handleAvatarSuccess(res, file) {
                this.imageUrl = URL.createObjectURL(file.raw);
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
            }
        }
    });
</script>

</body>
</html>
