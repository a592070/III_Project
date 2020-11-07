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
        ELEMENT.locale(ELEMENT.lang.en)
    </script>
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

                        <el-form :label-position="right" label-width="80px" :model="formLabelAlign">
                            <el-form-item label="ID">
                                <el-input v-model="formLabelAlign.sn"></el-input>
                            </el-form-item>
                            <el-form-item label="名稱">
                                <el-input v-model="formLabelAlign.name"></el-input>
                            </el-form-item>
                            <el-form-item label="tel">
                                <el-input v-model="formLabelAlign.tel"></el-input>
                            </el-form-item>
                            <el-form-item label="address">
                                <el-input v-model="formLabelAlign.address"></el-input>
                            </el-form-item>
                            <el-form-item label="region">
                                <el-select v-model="formLabelAlign.region" placeholder="選擇地區">
                                    <el-option label="--請選擇--" disabled></el-option>
                                    <el-option v-for="ele in region" v-bind:key="ele" @click.native="handleSelectRegion(ele)"></el-option>
                                </el-select>
                            </el-form-item>
                            <el-form-item label="px">
                                <el-input v-model="formLabelAlign.px"></el-input>
                            </el-form-item>
                            <el-form-item label="py">
                                <el-input v-model="formLabelAlign.py"></el-input>
                            </el-form-item>
                            <el-form-item label="picture_url">
                                <el-input v-model="formLabelAlign.picture_url"></el-input>
                            </el-form-item>
                            <el-form-item label="picture">
                                <el-input v-model="formLabelAlign.picture"></el-input>
                            </el-form-item>
                            <el-form-item label="詳細描述">
                                <el-input v-model="formLabelAlign.tolDescription"></el-input>
                            </el-form-item>
                            <el-form-item label="description">
                                <el-input v-model="formLabelAlign.description"></el-input>
                            </el-form-item>
                            <el-form-item label="travellingInfo">
                                <el-input v-model="formLabelAlign.travellingInfo"></el-input>
                            </el-form-item>
                            <el-form-item label="ticketInfo">
                                <el-input v-model="formLabelAlign.ticketInfo"></el-input>
                            </el-form-item>
                            <el-form-item label="keywords">
                                <el-input v-model="formLabelAlign.keywords"></el-input>
                            </el-form-item>
                            <el-form-item label="remarks">
                                <el-input v-model="formLabelAlign.remarks"></el-input>
                            </el-form-item>
                            <el-form-item label="rating">
                                <el-input v-model="formLabelAlign.rating"></el-input>
                            </el-form-item>
                            <el-form-item label="openTime">
                                <el-input v-model="formLabelAlign.openTime"></el-input>
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
        data: {
            region: ["全部", "臺北市", "新北市", "桃園市", "臺中市", "高雄市"],
            formLabelAlign: {
                sn: 4515,
                name: '錦吉昆蟲館',
                tel: '886-49-2920029',
                address: '埔里鎮中山路一段21號',
                region: '南投縣',
                px: '121.0420900',
                py: '23.9982700',
                picture_url: 'http://travel.nantou.gov.tw/manasystem/files/scenic/20120513170853_food_food_0428.jpg',
                picture: '',
                tolDescription: '木生昆蟲館位於埔里愛蘭橋附近，錦吉昆蟲館位於觀音瀑布附近，全都收藏了世界各地之昆蟲標本約十幾萬種，是自然科學最佳學習場所。',
                description: '',
                travellingInfo: '＊開車路線 (以埔里為目的地)1.從北部出發:國道3號→草屯交流道→台14→經過愛蘭橋→往霧社方向中途路旁→錦吉昆蟲館2.從南部出發:國道3號→草屯交流道→台14→經過愛蘭橋→往霧社方向中途路旁→錦吉昆蟲館＊大眾運輸1.可至台中干城車站搭往埔里之客運→至埔里市區轉搭往霧社或奧萬大或松岡公車→錦吉昆蟲館',
                ticketInfo: '',
                keywords: '',
                remarks: '',
                rating: '3.3',
                openTime: '上班時間AM08:00~PM06:00'
            }},
        method: {}
        });
</script>

</body>
</html>
